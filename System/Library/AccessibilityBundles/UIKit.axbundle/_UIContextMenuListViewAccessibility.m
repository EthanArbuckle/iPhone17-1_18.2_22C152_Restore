@interface _UIContextMenuListViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_configureCell:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 forElement:(id)a6 section:(id)a7 size:(int64_t)a8;
@end

@implementation _UIContextMenuListViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIContextMenuListView";
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
  id v4 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIContextMenuListView", @"_configureCell: inCollectionView: atIndexPath: forElement: section: size:", "v", "@", "@", "@", "@", "@", "q", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIContextMenuCell", @"actionView", v3, 0);
  objc_storeStrong(v5, v4);
}

- (void)_configureCell:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 forElement:(id)a6 section:(id)a7 size:(int64_t)a8
{
  v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v29 = 0;
  objc_storeStrong(&v29, a4);
  id v28 = 0;
  objc_storeStrong(&v28, a5);
  id v27 = 0;
  objc_storeStrong(&v27, a6);
  id v26 = 0;
  objc_storeStrong(&v26, a7);
  int64_t v25 = a8;
  v24.receiver = v31;
  v24.super_class = (Class)_UIContextMenuListViewAccessibility;
  [(_UIContextMenuListViewAccessibility *)&v24 _configureCell:location[0] inCollectionView:v29 atIndexPath:v28 forElement:v27 section:v26 size:a8];
  char v22 = 0;
  objc_opt_class();
  id v19 = (id)[location[0] safeValueForKey:@"actionView"];
  id v21 = (id)__UIAccessibilityCastAsSafeCategory();

  id v20 = v21;
  objc_storeStrong(&v21, 0);
  uint64_t v23 = (uint64_t)v20;
  id v8 = (id)[v27 accessibilityLabel];
  -[_UIContextMenuCellContentViewAccessibility _accessibilitySetStoredLabelFromMenuElement:](v23, v8);

  id v9 = (id)[v27 accessibilityValue];
  -[_UIContextMenuCellContentViewAccessibility _accessibilitySetStoredValueFromMenuElement:](v23, v9);

  id v10 = (id)[v27 accessibilityHint];
  -[_UIContextMenuCellContentViewAccessibility _accessibilitySetStoredHintFromMenuElement:](v23, v10);

  id v11 = (id)[v27 accessibilityIdentifier];
  -[_UIContextMenuCellContentViewAccessibility _accessibilitySetStoredIdentifierFromMenuElement:](v23, v11);

  id v12 = (id)objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v27, "accessibilityTraits"));
  -[_UIContextMenuCellContentViewAccessibility _accessibilitySetStoredTraitsFromMenuElement:](v23, v12);

  id v13 = (id)[v27 accessibilityUserInputLabels];
  -[_UIContextMenuCellContentViewAccessibility _accessibilitySetStoredUserInputLabelsFromMenuElement:](v23, v13);

  [v27 accessibilityElementsHidden];
  -[_UIContextMenuCellContentViewAccessibility _accessibilitySetStoredElementsHidden:](v23);
  objc_storeStrong((id *)&v23, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
}

@end