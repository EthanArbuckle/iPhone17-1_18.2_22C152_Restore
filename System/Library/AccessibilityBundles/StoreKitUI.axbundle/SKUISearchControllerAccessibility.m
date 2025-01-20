@interface SKUISearchControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_setSuffix:(id)a3;
- (void)setActive:(BOOL)a3;
@end

@implementation SKUISearchControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUISearchController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUISearchController", @"_setSuffix:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUISearchController", @"setActive:", "v", "B", 0);
}

- (void)setActive:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SKUISearchControllerAccessibility;
  [(SKUISearchControllerAccessibility *)&v9 setActive:a3];
  v4 = [(SKUISearchControllerAccessibility *)self safeValueForKey:@"searchBar"];
  v5 = [v4 safeValueForKey:@"searchField"];

  [v5 setAccessibilityValue:0];
  v6 = [v5 safeValueForKey:@"_clearButton"];
  [v6 setAccessibilityLabel:0];

  v7 = [v5 safeValueForKey:@"_clearButton"];
  [v7 setAccessibilityHint:0];

  v8 = [v5 safeValueForKey:@"_clearButton"];
  [v8 setAccessibilityIdentifier:@"ClearText"];
}

- (void)_setSuffix:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)SKUISearchControllerAccessibility;
  id v4 = a3;
  [(SKUISearchControllerAccessibility *)&v13 _setSuffix:v4];
  v5 = [(SKUISearchControllerAccessibility *)self safeValueForKey:@"searchBar", v13.receiver, v13.super_class];
  v6 = [v5 safeValueForKey:@"searchField"];

  uint64_t v7 = [v4 length];
  if (v7)
  {
    v8 = [v6 safeValueForKey:@"_clearButton"];
    objc_super v9 = accessibilitySKUILocalizedString(@"clear.search.results.button");
    [v8 setAccessibilityLabel:v9];

    v10 = [v6 safeValueForKey:@"_clearButton"];
    v11 = accessibilitySKUILocalizedString(@"clear.search.results.hint");
    [v10 setAccessibilityHint:v11];
  }
  v12 = [v6 safeValueForKey:@"_clearButton"];
  [v12 setAccessibilityIdentifier:@"ClearText"];
}

@end