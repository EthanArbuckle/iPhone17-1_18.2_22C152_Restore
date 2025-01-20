@interface CNVisualIdentityPickerViewControllerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_axIsAddItem:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
@end

@implementation CNVisualIdentityPickerViewControllerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNVisualIdentityPickerViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  v5 = self;
  v9.receiver = self;
  v9.super_class = (Class)CNVisualIdentityPickerViewControllerInvertColorsAccessibility;
  id v6 = a4;
  v7 = [(CNVisualIdentityPickerViewControllerInvertColorsAccessibility *)&v9 collectionView:a3 cellForItemAtIndexPath:v6];
  LODWORD(v5) = -[CNVisualIdentityPickerViewControllerInvertColorsAccessibility _axIsAddItem:](v5, "_axIsAddItem:", v6, v9.receiver, v9.super_class);

  [v7 setAccessibilityIgnoresInvertColors:v5 ^ 1];

  return v7;
}

- (BOOL)_axIsAddItem:(id)a3
{
  id v4 = a3;
  [(CNVisualIdentityPickerViewControllerInvertColorsAccessibility *)self safeValueForKey:@"dataSource"];
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = v4;
  AXPerformSafeBlock();
  char v5 = *((unsigned char *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return v5;
}

@end