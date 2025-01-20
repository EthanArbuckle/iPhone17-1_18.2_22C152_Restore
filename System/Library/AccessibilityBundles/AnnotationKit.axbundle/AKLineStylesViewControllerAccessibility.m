@interface AKLineStylesViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
@end

@implementation AKLineStylesViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AKLineStylesViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKLineStylesViewController", @"tableView: cellForRowAtIndexPath:", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKLineStylesViewController", @"currentLineWidthTag", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKLineStylesViewController", @"lineWidthTags", "@", 0);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)AKLineStylesViewControllerAccessibility;
  v8 = [(AKLineStylesViewControllerAccessibility *)&v21 tableView:v6 cellForRowAtIndexPath:v7];
  [v8 setIsAccessibilityElement:1];
  objc_opt_class();
  v9 = [(AKLineStylesViewControllerAccessibility *)self safeValueForKey:@"lineWidthTags"];
  v10 = __UIAccessibilityCastAsClass();

  unint64_t v11 = [v7 row];
  if (v11 < [v10 count])
  {
    v12 = objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v7, "row"));
    uint64_t v13 = [v12 integerValue];

    uint64_t v14 = [(AKLineStylesViewControllerAccessibility *)self safeIntegerForKey:@"currentLineWidthTag"];
    v15 = NSString;
    v16 = accessibilityLocalizedString(@"stroke.thickness.value");
    v17 = [NSNumber numberWithInteger:v13 - 765000];
    v18 = objc_msgSend(v15, "stringWithFormat:", v16, v17);
    [v8 setAccessibilityLabel:v18];

    uint64_t v19 = *MEMORY[0x263F1CF38];
    if (v13 != v14) {
      uint64_t v19 = 0;
    }
    [v8 setAccessibilityTraits:v19 | *MEMORY[0x263F1CEE8]];
  }

  return v8;
}

@end