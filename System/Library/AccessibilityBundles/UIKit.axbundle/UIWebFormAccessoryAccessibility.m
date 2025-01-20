@interface UIWebFormAccessoryAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (UIWebFormAccessoryAccessibility)initWithInputAssistantItem:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation UIWebFormAccessoryAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIWebFormAccessory";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = @"UIWebFormAccessory";
  v3 = "UIBarButtonItem";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  [location[0] validateClass:@"UIWebFormAccessory" hasInstanceVariable:@"_previousItem" withType:"UIBarButtonItem"];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIWebFormAccessory", @"initWithInputAssistantItem:", "@", 0);
  objc_storeStrong(v6, obj);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v8 = self;
  SEL v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)UIWebFormAccessoryAccessibility;
  [(UIWebFormAccessoryAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  id v3 = (id)[(UIWebFormAccessoryAccessibility *)v8 safeValueForKey:@"_previousItem"];
  id v2 = accessibilityLocalizedString(@"uibutton.table.previous.button.title");
  objc_msgSend(v3, "setAccessibilityLabel:");

  id v5 = (id)[(UIWebFormAccessoryAccessibility *)v8 safeValueForKey:@"_nextItem"];
  id v4 = accessibilityLocalizedString(@"uibutton.table.next.button.title");
  objc_msgSend(v5, "setAccessibilityLabel:");
}

- (UIWebFormAccessoryAccessibility)initWithInputAssistantItem:(id)a3
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = v9;
  v9 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)UIWebFormAccessoryAccessibility;
  v9 = [(UIWebFormAccessoryAccessibility *)&v6 initWithInputAssistantItem:location[0]];
  SEL v7 = v9;
  [(UIWebFormAccessoryAccessibility *)v9 _accessibilityLoadAccessibilityInformation];
  id v5 = v7;
  objc_storeStrong((id *)&v7, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v9, 0);
  return v5;
}

@end