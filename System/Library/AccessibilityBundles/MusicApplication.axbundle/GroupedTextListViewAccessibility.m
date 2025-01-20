@interface GroupedTextListViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation GroupedTextListViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.GroupedTextListView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.GroupedTextListView", @"accessibilityListGroupStrings", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.GroupedTextListView", @"accessibilityStackViews", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v11.receiver = self;
  v11.super_class = (Class)GroupedTextListViewAccessibility;
  [(GroupedTextListViewAccessibility *)&v11 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  id v3 = [(GroupedTextListViewAccessibility *)self safeArrayForKey:@"accessibilityListGroupStrings"];
  v4 = __UIAccessibilityCastAsClass();

  char v10 = 0;
  objc_opt_class();
  v5 = [(GroupedTextListViewAccessibility *)self safeArrayForKey:@"accessibilityStackViews"];
  v6 = __UIAccessibilityCastAsClass();

  uint64_t v7 = [v4 count];
  if (v7 == [v6 count])
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __78__GroupedTextListViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
    v8[3] = &unk_26513CD78;
    id v9 = v4;
    [v6 enumerateObjectsUsingBlock:v8];
  }
}

void __78__GroupedTextListViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  [v5 setIsAccessibilityElement:1];
  id v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  [v5 setAccessibilityLabel:v6];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)GroupedTextListViewAccessibility;
  [(GroupedTextListViewAccessibility *)&v3 layoutSubviews];
  [(GroupedTextListViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end