@interface _UITabOutlineViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityLastIndexPath;
- (id)_accessibilityLastMessage;
- (id)_accessibilityStartingCellLabel;
- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5;
- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilitySetLastIndexPath:(id)a3;
- (void)_accessibilitySetLastMessage:(id)a3;
- (void)_accessibilitySetStartingCellLabel:(id)a3;
- (void)_accessibilitySetupTabButton;
@end

@implementation _UITabOutlineViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UITabOutlineView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityStartingCellLabel
{
  return objc_getAssociatedObject(self, &___UITabOutlineViewAccessibility___accessibilityStartingCellLabel);
}

- (void)_accessibilitySetStartingCellLabel:(id)a3
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(location, 0);
}

- (id)_accessibilityLastIndexPath
{
  return objc_getAssociatedObject(self, &___UITabOutlineViewAccessibility___accessibilityLastIndexPath);
}

- (void)_accessibilitySetLastIndexPath:(id)a3
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(location, 0);
}

- (id)_accessibilityLastMessage
{
  return objc_getAssociatedObject(self, &___UITabOutlineViewAccessibility___accessibilityLastMessage);
}

- (void)_accessibilitySetLastMessage:(id)a3
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(location, 0);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UITabContainerView", @"sidebar", "@", 0);
  v4 = "B";
  [location[0] validateClass:@"_UITabBarControllerSidebar" hasInstanceMethod:@"_isVisible" withFullSignature:0];
  v3 = @"_UITabOutlineView";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  [location[0] validateClass:v3 isKindOfClass:@"UICollectionViewDelegate"];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"isEditing", v4, 0);
  objc_storeStrong(v6, obj);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)_UITabOutlineViewAccessibility;
  [(_UITabOutlineViewAccessibility *)&v2 _accessibilityLoadAccessibilityInformation];
  -[_UITabOutlineViewAccessibility _accessibilitySetupTabButton](v4);
}

- (void)_accessibilitySetupTabButton
{
  id v14 = a1;
  if (a1)
  {
    char v12 = 0;
    objc_opt_class();
    id v2 = (id)[v14 safeValueForKey:@"_navigationItem"];
    id v11 = (id)__UIAccessibilityCastAsClass();

    id v10 = v11;
    objc_storeStrong(&v11, 0);
    id v13 = v10;
    objc_initWeak(&from, v14);
    id v1 = (id)[v13 leftBarButtonItem];
    uint64_t v3 = MEMORY[0x263EF8330];
    int v4 = -1073741824;
    int v5 = 0;
    v6 = __62___UITabOutlineViewAccessibility__accessibilitySetupTabButton__block_invoke;
    v7 = &unk_2650AE108;
    objc_copyWeak(v8, &from);
    [v1 _setAccessibilityLabelBlock:&v3];

    objc_destroyWeak(v8);
    objc_destroyWeak(&from);
    objc_storeStrong(&v13, 0);
  }
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = 0;
  objc_storeStrong(&v15, a4);
  id v14 = 0;
  objc_storeStrong(&v14, a5);
  v12.receiver = v17;
  v12.super_class = (Class)_UITabOutlineViewAccessibility;
  id v13 = [(_UITabOutlineViewAccessibility *)&v12 collectionView:location[0] itemsForBeginningDragSession:v15 atIndexPath:v14];
  id v11 = (id)[location[0] cellForItemAtIndexPath:v14];
  v8 = v17;
  id v9 = (id)[v11 accessibilityLabel];
  -[_UITabOutlineViewAccessibility _accessibilitySetStartingCellLabel:](v8, "_accessibilitySetStartingCellLabel:");

  [(_UITabOutlineViewAccessibility *)v17 _accessibilitySetLastIndexPath:v14];
  id v10 = v13;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);

  return v10;
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  v40 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v38 = 0;
  objc_storeStrong(&v38, a4);
  id v37 = 0;
  objc_storeStrong(&v37, a5);
  v35.receiver = v40;
  v35.super_class = (Class)_UITabOutlineViewAccessibility;
  id v36 = [(_UITabOutlineViewAccessibility *)&v35 collectionView:location[0] dropSessionDidUpdate:v38 withDestinationIndexPath:v37];
  id v34 = (id)[location[0] cellForItemAtIndexPath:v37];
  id v24 = (id)[v34 accessibilityLabel];
  char v32 = 0;
  char v30 = 0;
  LOBYTE(v25) = 0;
  if (v24)
  {
    id v33 = (id)[v34 accessibilityLabel];
    char v32 = 1;
    id v31 = [(_UITabOutlineViewAccessibility *)v40 _accessibilityStartingCellLabel];
    char v30 = 1;
    int v25 = objc_msgSend(v33, "isEqualToString:") ^ 1;
  }
  if (v30) {

  }
  if (v32) {
  if (v25)
  }
  {
    id v17 = [(_UITabOutlineViewAccessibility *)v40 _accessibilityLastIndexPath];
    uint64_t v18 = [v17 row];

    uint64_t v29 = v18;
    uint64_t v28 = [v37 row];
    id v27 = [(_UITabOutlineViewAccessibility *)v40 _accessibilityLastMessage];
    v19 = NSString;
    id v21 = accessibilityLocalizedString(@"row.reorder.above");
    id v20 = (id)[v34 accessibilityLabel];
    id v26 = (id)objc_msgSend(v19, "stringWithFormat:", v21, v20);

    if (v18 >= v28)
    {
      if (v29 == v28 && ([v27 isEqualToString:v26] & 1) != 0)
      {
        id v11 = NSString;
        id v13 = accessibilityLocalizedString(@"row.reorder.below");
        id v12 = (id)[v34 accessibilityLabel];
        id v7 = (id)objc_msgSend(v11, "stringWithFormat:", v13, v12);
        id v8 = v26;
        id v26 = v7;
      }
    }
    else
    {
      id v14 = NSString;
      id v16 = accessibilityLocalizedString(@"row.reorder.below");
      id v15 = (id)[v34 accessibilityLabel];
      id v5 = (id)objc_msgSend(v14, "stringWithFormat:", v16, v15);
      id v6 = v26;
      id v26 = v5;
    }
    [(_UITabOutlineViewAccessibility *)v40 _accessibilitySetLastIndexPath:v37];
    [(_UITabOutlineViewAccessibility *)v40 _accessibilitySetLastMessage:v26];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v26);
    objc_storeStrong(&v26, 0);
    objc_storeStrong(&v27, 0);
  }
  id v10 = v36;
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(location, 0);

  return v10;
}

@end