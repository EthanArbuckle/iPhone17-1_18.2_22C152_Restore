@interface SUUIProductInformationViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityElements;
@end

@implementation SUUIProductInformationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIProductInformationView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SUUIProductInformationView" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"SUUIProductInformationView" hasInstanceVariable:@"_keyLabels" withType:"NSMutableArray"];
  [v3 validateClass:@"SUUIProductInformationView" hasInstanceVariable:@"_valueLabels" withType:"NSMutableArray"];
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityElements
{
  id v3 = [(SUUIProductInformationViewAccessibility *)self _accessibilityValueForKey:*MEMORY[0x263F81490]];
  if (!v3)
  {
    id v3 = [MEMORY[0x263EFF980] array];
    v4 = [(SUUIProductInformationViewAccessibility *)self safeValueForKey:@"_titleLabel"];
    [v4 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];
    v17 = v4;
    [v3 axSafelyAddObject:v4];
    v5 = [(SUUIProductInformationViewAccessibility *)self safeValueForKey:@"_keyLabels"];
    v6 = [(SUUIProductInformationViewAccessibility *)self safeValueForKey:@"_valueLabels"];
    uint64_t v7 = [v5 count];
    if (v7 != [v6 count]) {
      _AXAssert();
    }
    unint64_t v8 = [v5 count];
    unint64_t v9 = [v6 count];
    if (v8 >= v9) {
      unint64_t v10 = v9;
    }
    else {
      unint64_t v10 = v8;
    }
    if (v10)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        v12 = [v5 objectAtIndex:i];
        v13 = [v6 objectAtIndex:i];
        v14 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 2, v12, v13);
        v15 = (void *)[objc_alloc(MEMORY[0x263F81178]) initWithAccessibilityContainer:self representedElements:v14];
        [v3 addObject:v15];
      }
    }
    [(SUUIProductInformationViewAccessibility *)self _accessibilitySetRetainedValue:v3 forKey:*MEMORY[0x263F81490]];
  }

  return v3;
}

@end