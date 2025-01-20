@interface BuddyLocaleControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilitySelectedLanguage;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_accessibilityUpdateLanguageOnLabel:(id)a3;
- (void)setLanguage:(id)a3;
@end

@implementation BuddyLocaleControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BuddyLocaleController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"OBTemplateLabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BuddyLocaleController", @"tableView: cellForRowAtIndexPath:", "@", "@", "@", 0);
  [v3 validateClass:@"BuddyLocaleController" hasInstanceVariable:@"_language" withType:"NSString"];
  [v3 validateClass:@"BuddyLocaleController" isKindOfClass:@"OBWelcomeController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BuddyLocaleController", @"setLanguage:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"OBWelcomeController", @"headerView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BuddyLanguageLocaleCell", @"titleLabel", "@", 0);
}

- (void)setLanguage:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BuddyLocaleControllerAccessibility;
  [(BuddyLocaleControllerAccessibility *)&v8 setLanguage:v4];
  v5 = [(BuddyLocaleControllerAccessibility *)self safeValueForKey:@"headerView"];
  v6 = [v5 _accessibilityDescendantOfType:NSClassFromString(&cfstr_Obtemplatelabe.isa)];

  objc_opt_class();
  v7 = __UIAccessibilityCastAsClass();
  [(BuddyLocaleControllerAccessibility *)self _accessibilityUpdateLanguageOnLabel:v7];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)BuddyLocaleControllerAccessibility;
  objc_super v8 = [(BuddyLocaleControllerAccessibility *)&v16 tableView:v6 cellForRowAtIndexPath:v7];
  objc_opt_class();
  v9 = __UIAccessibilitySafeClass();
  v10 = [v9 safeValueForKey:@"titleLabel"];
  v11 = __UIAccessibilityCastAsClass();

  v12 = [v11 text];

  v13 = [(BuddyLocaleControllerAccessibility *)self _accessibilitySelectedLanguage];
  v14 = AXAttributedStringForLanguage(v12, v13);

  if (v14) {
    [v8 setAccessibilityLabel:v14];
  }

  return v8;
}

- (id)_accessibilitySelectedLanguage
{
  objc_opt_class();
  id v3 = [(BuddyLocaleControllerAccessibility *)self safeValueForKey:@"_language"];
  id v4 = __UIAccessibilityCastAsClass();

  return v4;
}

- (void)_accessibilityUpdateLanguageOnLabel:(id)a3
{
  id v7 = a3;
  id v4 = [v7 text];
  v5 = [(BuddyLocaleControllerAccessibility *)self _accessibilitySelectedLanguage];
  id v6 = AXAttributedStringForLanguage(v4, v5);

  if (v6) {
    [v7 setAccessibilityLabel:v6];
  }
}

@end