@interface _UIFocusSearchInfoAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)shouldIncludeFocusItem:(id)a3;
@end

@implementation _UIFocusSearchInfoAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIFocusSearchInfo";
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIFocusSearchInfo", @"shouldIncludeFocusItem:", "B", "@", 0);
  objc_storeStrong(v4, obj);
}

- (BOOL)shouldIncludeFocusItem:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v10 = 0;
  v9.receiver = v12;
  v9.super_class = (Class)_UIFocusSearchInfoAccessibility;
  char v10 = [(_UIFocusSearchInfoAccessibility *)&v9 shouldIncludeFocusItem:location[0]];
  char v8 = 0;
  objc_opt_class();
  id v7 = (id)__UIAccessibilityCastAsClass();
  id v6 = v7;
  objc_storeStrong(&v7, 0);
  char v5 = [v6 _accessibilityHandlesRemoteFocusMovement];

  if (v5) {
    char v10 = 1;
  }
  char v4 = v10;
  objc_storeStrong(location, 0);
  return v4 & 1;
}

@end