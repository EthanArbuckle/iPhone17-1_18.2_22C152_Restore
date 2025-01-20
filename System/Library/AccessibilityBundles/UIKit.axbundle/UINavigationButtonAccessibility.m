@interface UINavigationButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityUserTestingIsCancelButton;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)additionsSelf;
- (unint64_t)accessibilityTraits;
@end

@implementation UINavigationButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UINavigationButton";
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
  v3 = @"UINavigationButton";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"style", "i", 0);
  objc_storeStrong(v5, obj);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)additionsSelf
{
  return (id)__UIAccessibilityCastAsSafeCategory();
}

- (id)accessibilityLabel
{
  v9 = self;
  v8[1] = (id)a2;
  v8[0] = [(UINavigationButtonAccessibility *)self additionsSelf];
  if (-[UINavigationBarAccessibility_UIViewAccessibilityAdditions _accessibilityIsNavigationView](v8[0])
    || ((v7 = (id)-[UINavigationButtonAccessibility safeValueForKey:](v9, "safeValueForKey:", @"originatingButtonItem"), (location = (id)[v8[0] _accessibilityComputedLabelForNavigationBarWithAssociatedBarButtonItem:v7]) == 0)? (int v5 = 0): (v10 = location, int v5 = 1), objc_storeStrong(&location, 0), objc_storeStrong(&v7, 0), !v5))
  {
    v4.receiver = v9;
    v4.super_class = (Class)UINavigationButtonAccessibility;
    id v10 = [(UINavigationButtonAccessibility *)&v4 accessibilityLabel];
    int v5 = 1;
  }
  objc_storeStrong(v8, 0);
  v2 = v10;

  return v2;
}

- (unint64_t)accessibilityTraits
{
  v9 = self;
  SEL v8 = a2;
  id v4 = [(UINavigationButtonAccessibility *)self additionsSelf];
  BOOL IsNavigation = -[UINavigationBarAccessibility_UIViewAccessibilityAdditions _accessibilityIsNavigationView](v4);

  if (IsNavigation)
  {
    v6.receiver = v9;
    v6.super_class = (Class)UINavigationButtonAccessibility;
    return [(UINavigationButtonAccessibility *)&v6 accessibilityTraits];
  }
  else
  {
    uint64_t v3 = *MEMORY[0x263F1CEE8];
    v7.receiver = v9;
    v7.super_class = (Class)UINavigationButtonAccessibility;
    return v3 | [(UINavigationButtonAccessibility *)&v7 accessibilityTraits];
  }
}

- (BOOL)_accessibilityUserTestingIsCancelButton
{
  objc_super v6 = self;
  SEL v5 = a2;
  char v4 = 0;
  v3.receiver = self;
  v3.super_class = (Class)UINavigationButtonAccessibility;
  char v4 = [(UINavigationButtonAccessibility *)&v3 _accessibilityUserTestingIsCancelButton];
  if (!v4) {
    char v4 = [(UINavigationButtonAccessibility *)v6 safeIntForKey:@"style"] == 3;
  }
  return v4 & 1;
}

@end