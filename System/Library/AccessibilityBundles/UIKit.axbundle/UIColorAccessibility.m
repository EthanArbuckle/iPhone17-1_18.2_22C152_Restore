@interface UIColorAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_accessibilityCachedColorDescriptions;
- (id)_accessibilityColorDescription;
- (id)_accessibilityColorDescriptionWithOptions:(unint64_t)a3;
- (void)_accessibilitySetCachedColorDescriptions:(uint64_t)a1;
@end

@implementation UIColorAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIColor";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityCachedColorDescriptions
{
  if (a1) {
    id v2 = objc_getAssociatedObject(a1, &__UIColor___accessibilityCachedColorDescriptions);
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (void)_accessibilitySetCachedColorDescriptions:(uint64_t)a1
{
  uint64_t v3 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v3) {
    __UIAccessibilitySetAssociatedObject();
  }
  objc_storeStrong(&location, 0);
}

- (id)_accessibilityColorDescription
{
  return [(UIColorAccessibility *)self _accessibilityColorDescriptionWithOptions:0];
}

- (id)_accessibilityColorDescriptionWithOptions:(unint64_t)a3
{
  v13 = self;
  SEL v12 = a2;
  unint64_t v11 = a3;
  id v3 = -[UIColorAccessibility _accessibilityCachedColorDescriptions](self);
  BOOL v7 = v3 != 0;

  if (!v7)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    -[UIColorAccessibility _accessibilitySetCachedColorDescriptions:]((uint64_t)v13, v6);
  }
  id v10 = -[UIColorAccessibility _accessibilityCachedColorDescriptions](v13);
  id v9 = (id)[NSNumber numberWithUnsignedInteger:v11];
  id v8 = (id)[v10 objectForKeyedSubscript:v9];
  if (!v8)
  {
    id v8 = (id)AXColorStringForColor();

    [v10 setObject:v8 forKeyedSubscript:v9];
  }
  id v5 = v8;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);

  return v5;
}

@end