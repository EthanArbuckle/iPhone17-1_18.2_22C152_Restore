@interface UIStatusBarOpenInSafariItemViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation UIStatusBarOpenInSafariItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIStatusBarOpenInSafariItemView";
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIStatusBarOpenInSafariItemView", @"destinationText", "@", 0);
  objc_storeStrong(v4, obj);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(UIStatusBarOpenInSafariItemViewAccessibility *)self safeValueForKey:@"destinationText", a2, self];
}

- (id)accessibilityHint
{
  v3 = NSString;
  id v5 = (id)accessibilityUIKitLocalizedString();
  id v4 = (id)[(UIStatusBarOpenInSafariItemViewAccessibility *)self safeValueForKey:@"destinationText"];
  id v6 = (id)objc_msgSend(v3, "stringWithFormat:", v5, v4);

  return v6;
}

- (unint64_t)accessibilityTraits
{
  id v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarOpenInSafariItemViewAccessibility;
  return [(UIStatusBarOpenInSafariItemViewAccessibility *)&v3 accessibilityTraits] | *MEMORY[0x263F1CEE8];
}

@end