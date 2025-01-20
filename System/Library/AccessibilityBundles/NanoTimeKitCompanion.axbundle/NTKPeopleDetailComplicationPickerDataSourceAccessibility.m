@interface NTKPeopleDetailComplicationPickerDataSourceAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
@end

@implementation NTKPeopleDetailComplicationPickerDataSourceAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKPeopleDetailComplicationPickerDataSource";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKPeopleDetailComplicationPickerDataSource", @"tableView:cellForRowAtIndexPath:", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKPeopleDetailComplicationPickerDataSource", @"_itemIsSelectedAtIndexPath:", "B", "@", 0);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)NTKPeopleDetailComplicationPickerDataSourceAccessibility;
  v8 = [(NTKPeopleDetailComplicationPickerDataSourceAccessibility *)&v16 tableView:v6 cellForRowAtIndexPath:v7];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  id v9 = v7;
  AXPerformSafeBlock();
  LODWORD(v7) = *((unsigned __int8 *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  v10 = &UIAccessibilityTraitSelected;
  if (!v7) {
    v10 = &UIAccessibilityTraitNone;
  }
  [v8 setAccessibilityTraits:*v10];

  return v8;
}

id __92__NTKPeopleDetailComplicationPickerDataSourceAccessibility_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) _itemIsSelectedAtIndexPath:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (_BYTE)result;
  return result;
}

@end