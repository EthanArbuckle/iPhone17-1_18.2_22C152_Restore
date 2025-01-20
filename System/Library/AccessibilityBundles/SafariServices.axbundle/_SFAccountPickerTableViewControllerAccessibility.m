@interface _SFAccountPickerTableViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
@end

@implementation _SFAccountPickerTableViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_SFAccountPickerTableViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_SFAccountPickerTableViewController", @"tableView:cellForRowAtIndexPath:", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_SFAccountPickerTableViewController", @"_rowTypeForIndexPath:", "q", "@", 0);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_SFAccountPickerTableViewControllerAccessibility;
  v8 = [(_SFAccountPickerTableViewControllerAccessibility *)&v16 tableView:v6 cellForRowAtIndexPath:v7];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  id v9 = v7;
  AXPerformSafeBlock();
  uint64_t v10 = v13[3];

  _Block_object_dispose(&v12, 8);
  if (v10 == 1) {
    [v8 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
  }

  return v8;
}

@end