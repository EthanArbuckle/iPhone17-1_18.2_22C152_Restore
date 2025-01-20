@interface _UIPreviewActionSheetItemViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation _UIPreviewActionSheetItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIPreviewActionSheetItemView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v5 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = "@";
  [location[0] validateClass:@"_UIPreviewActionSheetItemView" hasInstanceMethod:@"action" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIPreviewMenuItem", @"title", v3, 0);
  objc_storeStrong(v5, obj);
}

- (id)accessibilityLabel
{
  v9 = self;
  SEL v8 = a2;
  char v7 = 0;
  objc_opt_class();
  id v4 = (id)[(_UIPreviewActionSheetItemViewAccessibility *)v9 safeValueForKey:@"action"];
  id v3 = (id)[v4 safeValueForKey:@"title"];
  id v6 = (id)__UIAccessibilityCastAsClass();

  id v5 = v6;
  objc_storeStrong(&v6, 0);

  return v5;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end