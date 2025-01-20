@interface _UIStatusBarPillViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityInTopLevelTabLoop;
- (BOOL)accessibilityRespondsToUserInteraction;
- (BOOL)canBecomeFocused;
- (BOOL)isAccessibilityElement;
- (id)accessibilityElements;
- (id)accessibilityHint;
- (unint64_t)accessibilityTraits;
@end

@implementation _UIStatusBarPillViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIStatusBarPillView";
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIStatusBarPillView", @"canBecomeFocused", "B", 0);
  objc_storeStrong(v4, obj);
}

- (BOOL)isAccessibilityElement
{
  id v3 = (id)[(_UIStatusBarPillViewAccessibility *)self accessibilityLabel];
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  id v3 = (id)[(_UIStatusBarPillViewAccessibility *)self accessibilityLabel];
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (BOOL)canBecomeFocused
{
  v8 = self;
  SEL v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)_UIStatusBarPillViewAccessibility;
  char v4 = 0;
  BOOL v3 = 1;
  if (![(_UIStatusBarPillViewAccessibility *)&v6 canBecomeFocused])
  {
    id v5 = (id)[(_UIStatusBarPillViewAccessibility *)v8 accessibilityLabel];
    char v4 = 1;
    BOOL v3 = [v5 length] != 0;
  }
  BOOL v9 = v3;
  if (v4) {

  }
  return v9;
}

- (BOOL)_accessibilityInTopLevelTabLoop
{
  return 1;
}

- (id)accessibilityElements
{
  if ([(_UIStatusBarPillViewAccessibility *)self isAccessibilityElement]) {
    v2 = 0;
  }
  else {
    v2 = (void *)MEMORY[0x263EFFA68];
  }

  return v2;
}

- (id)accessibilityHint
{
  id v4 = accessibilityLocalizedString(@"status.backgroundactivity.hint");
  id v3 = AXStatusBarItemHint(self);
  id v5 = (id)__UIAXStringForVariables();

  return v5;
}

- (unint64_t)accessibilityTraits
{
  v8 = self;
  SEL v7 = a2;
  unint64_t v6 = 0;
  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarPillViewAccessibility;
  unint64_t v6 = [(_UIStatusBarPillViewAccessibility *)&v5 accessibilityTraits] | *MEMORY[0x263F813F0] | *MEMORY[0x263F1CEE8];
  id v2 = AXStatusBarPillTimeView(v8);
  BOOL v4 = v2 == 0;

  if (!v4) {
    v6 |= *MEMORY[0x263F1CF68] | *MEMORY[0x263F81368];
  }
  return v6;
}

@end