@interface UISearchFieldAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_accessibilityCapturedImages;
- (unint64_t)_accessibilityAutomationType;
- (unint64_t)accessibilityTraits;
@end

@implementation UISearchFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UISearchField";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)_accessibilityAutomationType
{
  return 45;
}

- (unint64_t)accessibilityTraits
{
  v14 = self;
  SEL v13 = a2;
  unint64_t v12 = 0;
  unint64_t v12 = *MEMORY[0x263F81408] | *MEMORY[0x263F1CF30];
  id v7 = (id)[(UISearchFieldAccessibility *)self safeValueForKey:@"isEditing"];
  char v8 = [v7 BOOLValue];

  if ((v8 & 1) != 0
    && (([(id)*MEMORY[0x263F1D020] _accessibilityHardwareKeyboardActive] & 1) != 0
     || ([(id)*MEMORY[0x263F1D020] _accessibilitySoftwareKeyboardActive] & 1) != 0
     || _AXSMossdeepEnabled()))
  {
    v12 |= *MEMORY[0x263F81398];
  }
  id v2 = (id)[(UISearchFieldAccessibility *)v14 accessibilityUserDefinedTraits];
  BOOL v6 = v2 == 0;

  if (!v6)
  {
    id v5 = (id)[(UISearchFieldAccessibility *)v14 accessibilityUserDefinedTraits];
    v12 |= [v5 unsignedLongLongValue];
  }
  char v11 = 0;
  objc_opt_class();
  id v10 = (id)__UIAccessibilityCastAsClass();
  id v9 = v10;
  objc_storeStrong(&v10, 0);
  uint64_t v3 = -[UIView _accessibilityTextAreaTraits](v9);
  v12 |= v3;

  return v12;
}

- (id)_accessibilityCapturedImages
{
  return 0;
}

@end