@interface UIInputSetHostViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsScannerGroup;
- (unint64_t)_accessibilityScannerGroupTraits;
@end

@implementation UIInputSetHostViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIInputSetHostView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [location[0] validateClass:@"UIRemoteKeyboardWindow"];
  objc_storeStrong(location, 0);
}

- (BOOL)_accessibilityIsScannerGroup
{
  return 1;
}

- (unint64_t)_accessibilityScannerGroupTraits
{
  v12 = self;
  SEL v11 = a2;
  unint64_t v10 = 0;
  v9.receiver = self;
  v9.super_class = (Class)UIInputSetHostViewAccessibility;
  unint64_t v10 = [(UIInputSetHostViewAccessibility *)&v9 _accessibilityScannerGroupTraits];
  id v2 = (id)[(UIInputSetHostViewAccessibility *)v12 _accessibilityViewAncestorIsKindOf:NSClassFromString(&cfstr_Uiremotekeyboa_4.isa)];
  BOOL v5 = v2 != 0;

  BOOL v8 = v5;
  if (AXUIKeyboardIsOOP())
  {
    char v6 = 0;
    BOOL v4 = 1;
    if (!v5)
    {
      id v7 = (id)[(UIInputSetHostViewAccessibility *)v12 _accessibilityViewAncestorIsKindOf:NSClassFromString(&cfstr_Uitexteffectsw.isa)];
      char v6 = 1;
      BOOL v4 = v7 != 0;
    }
    BOOL v8 = v4;
    if (v6) {
  }
    }
  if (v8) {
    v10 |= 1uLL;
  }
  return v10;
}

@end