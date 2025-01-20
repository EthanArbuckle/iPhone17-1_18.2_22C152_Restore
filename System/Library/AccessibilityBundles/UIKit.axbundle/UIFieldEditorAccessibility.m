@interface UIFieldEditorAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (void)insertText:(id)a3;
@end

@implementation UIFieldEditorAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIFieldEditor";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v7 = location;
  id v6 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = "@";
  v4 = @"UIFieldEditor";
  v5 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "@", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"insertText:", v5, v3, 0);
  objc_storeStrong(v7, v6);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (void)insertText:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  MEMORY[0x2455E6B10](*MEMORY[0x263F81340]);
  v3.receiver = v5;
  v3.super_class = (Class)UIFieldEditorAccessibility;
  [(UIFieldEditorAccessibility *)&v3 insertText:location[0]];
  MEMORY[0x2455E6B10](0);
  objc_storeStrong(location, 0);
}

@end