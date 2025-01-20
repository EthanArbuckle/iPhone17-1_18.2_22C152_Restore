@interface SetupChoiceControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
@end

@implementation SetupChoiceControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SetupChoiceController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v14 = 0;
  objc_opt_class();
  v13.receiver = self;
  v13.super_class = (Class)SetupChoiceControllerAccessibility;
  v8 = [(SetupChoiceControllerAccessibility *)&v13 tableView:v6 cellForRowAtIndexPath:v7];
  v9 = __UIAccessibilityCastAsClass();

  if (v14) {
    abort();
  }
  NSClassFromString(&cfstr_Buddysetuptabl.isa);
  if (objc_opt_isKindOfClass())
  {
    [v9 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
    [v9 setIsAccessibilityElement:1];
    v10 = [v9 textLabel];
    v11 = [v10 accessibilityLabel];
    [v9 setAccessibilityLabel:v11];
  }

  return v9;
}

@end