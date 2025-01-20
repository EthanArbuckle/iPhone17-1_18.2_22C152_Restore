@interface AVTAvatarAttributeEditorSectionColorControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)collectionView;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axLoadAccessibilityForAttributeCell:(id)a3 atIndexPath:(id)a4;
- (void)colorDataSource:(id)a3 didChangeDisplayMode:(int64_t)a4 previousDisplayMode:(int64_t)a5;
@end

@implementation AVTAvatarAttributeEditorSectionColorControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVTAvatarAttributeEditorSectionColorController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"AVTAttributeCollectionViewCell"];
  [v3 validateClass:@"AVTAvatarAttributeEditorSectionColorItem"];
  [v3 validateClass:@"AVTCoreModelColor"];
  [v3 validateClass:@"AVTAvatarAttributeEditorSectionColorDataSource"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAvatarAttributeEditorSectionColorItem", @"color", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTCoreModelColor", @"localizedName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAttributeCollectionViewCell", @"attributeView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAvatarAttributeEditorSectionColorController", @"selectedIndex", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAvatarAttributeEditorSectionColorController", @"collectionView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAvatarAttributeEditorSectionColorController", @"dataSource", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAvatarAttributeEditorSectionColorController", @"sliderContainerView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAvatarColorSliderContainerView", @"slider", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAvatarAttributeEditorSectionColorController", @"collectionView:cellForItemAtIndexPath:", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAvatarAttributeEditorSectionColorController", @"colorDataSource:didChangeDisplayMode:previousDisplayMode:", "v", "@", "q", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAvatarAttributeEditorSectionColorDataSource", @"sectionItemAtIndex:", "@", "q", 0);
  [v3 validateClass:@"AVTAvatarAttributeEditorSectionCoordinator"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAvatarAttributeEditorSectionCoordinator", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAvatarAttributeEditorViewController", @"dataSource", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAvatarAttributeEditorDataSource", @"categories", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAvatarAttributeEditorDataSource", @"currentCategoryIndex", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAvatarAttributeEditorCategory", @"localizedName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAvatarAttributeEditorCategory", @"sections", "@", 0);
  [v3 validateProtocol:@"AVTAvatarAttributeEditorSection" hasRequiredInstanceMethod:@"localizedName"];
}

- (void)_axLoadAccessibilityForAttributeCell:(id)a3 atIndexPath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  MEMORY[0x245642ED0](@"AVTAttributeCollectionViewCell");
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    id v8 = v5;
    AXPerformSafeBlock();
  }
}

void __112__AVTAvatarAttributeEditorSectionColorControllerAccessibility__axLoadAccessibilityForAttributeCell_atIndexPath___block_invoke(id *a1)
{
  id v6 = [a1[4] safeValueForKey:@"dataSource"];
  MEMORY[0x245642ED0](@"AVTAvatarAttributeEditorSectionColorDataSource");
  if (objc_opt_isKindOfClass())
  {
    v2 = objc_msgSend(v6, "sectionItemAtIndex:", objc_msgSend(a1[5], "row"));
    id v3 = [v2 safeValueForKey:@"color"];
    v4 = [v3 safeStringForKey:@"localizedName"];
    id v5 = [a1[6] safeUIViewForKey:@"attributeView"];
    [v5 setAccessibilityLabel:v4];
    [v5 _accessibilitySetShouldIncludeRowRangeInElementDescription:1];
  }
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)AVTAvatarAttributeEditorSectionColorControllerAccessibility;
  [(AVTAvatarAttributeEditorSectionColorControllerAccessibility *)&v17 _accessibilityLoadAccessibilityInformation];
  char v16 = 0;
  objc_opt_class();
  id v3 = [(AVTAvatarAttributeEditorSectionColorControllerAccessibility *)self safeValueForKey:@"collectionView"];
  v4 = __UIAccessibilityCastAsClass();

  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = objc_msgSend(v4, "visibleCells", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        v11 = [v4 indexPathForCell:v10];
        [(AVTAvatarAttributeEditorSectionColorControllerAccessibility *)self _axLoadAccessibilityForAttributeCell:v10 atIndexPath:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v7);
  }
}

- (id)collectionView
{
  v18.receiver = self;
  v18.super_class = (Class)AVTAvatarAttributeEditorSectionColorControllerAccessibility;
  id v3 = [(AVTAvatarAttributeEditorSectionColorControllerAccessibility *)&v18 collectionView];
  [v3 setAccessibilityContainerType:4];
  v4 = [(AVTAvatarAttributeEditorSectionColorControllerAccessibility *)self safeValueForKey:@"section"];
  id v5 = [v4 safeStringForKey:@"localizedName"];
  if (v5) {
    goto LABEL_10;
  }
  uint64_t v6 = [(AVTAvatarAttributeEditorSectionColorControllerAccessibility *)self safeValueForKey:@"delegate"];
  MEMORY[0x245642ED0](@"AVTAvatarAttributeEditorSectionCoordinator");
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v6 safeValueForKey:@"delegate"];

    uint64_t v6 = (void *)v7;
  }
  uint64_t v8 = [v6 safeValueForKey:@"dataSource"];
  v9 = [v8 safeArrayForKey:@"categories"];
  uint64_t v10 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v8, "safeUnsignedIntegerForKey:", @"currentCategoryIndex"));

  v11 = [v10 safeArrayForKey:@"sections"];
  unint64_t v12 = [v11 indexOfObject:v4];
  if (v12 >= [v11 count]) {
    goto LABEL_8;
  }
  do
  {
    long long v13 = [v11 objectAtIndexedSubscript:v12];
    id v5 = [v13 safeValueForKey:@"localizedName"];

    --v12;
  }
  while (v12 < [v11 count] && !v5);
  if (!v5)
  {
LABEL_8:
    id v5 = [v10 safeValueForKey:@"localizedName"];
  }

  if (v5)
  {
LABEL_10:
    long long v14 = NSString;
    long long v15 = accessibilityLocalizedString(@"section.name.color");
    char v16 = objc_msgSend(v14, "localizedStringWithFormat:", v15, v5);
    [v3 setAccessibilityLabel:v16];
  }

  return v3;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AVTAvatarAttributeEditorSectionColorControllerAccessibility;
  id v6 = a4;
  uint64_t v7 = [(AVTAvatarAttributeEditorSectionColorControllerAccessibility *)&v9 collectionView:a3 cellForItemAtIndexPath:v6];
  -[AVTAvatarAttributeEditorSectionColorControllerAccessibility _axLoadAccessibilityForAttributeCell:atIndexPath:](self, "_axLoadAccessibilityForAttributeCell:atIndexPath:", v7, v6, v9.receiver, v9.super_class);

  return v7;
}

- (void)colorDataSource:(id)a3 didChangeDisplayMode:(int64_t)a4 previousDisplayMode:(int64_t)a5
{
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AVTAvatarAttributeEditorSectionColorControllerAccessibility;
  [(AVTAvatarAttributeEditorSectionColorControllerAccessibility *)&v15 colorDataSource:v8 didChangeDisplayMode:a4 previousDisplayMode:a5];
  if ((a4 & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    objc_super v9 = [(AVTAvatarAttributeEditorSectionColorControllerAccessibility *)self safeValueForKeyPath:@"sliderContainerView.slider"];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v9);
  }
  else
  {
    uint64_t v10 = [(AVTAvatarAttributeEditorSectionColorControllerAccessibility *)self safeIntegerForKey:@"selectedIndex"];
    objc_opt_class();
    v11 = [(AVTAvatarAttributeEditorSectionColorControllerAccessibility *)self safeValueForKey:@"collectionView"];
    objc_super v9 = __UIAccessibilityCastAsClass();

    if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = v10;
    }
    long long v13 = [MEMORY[0x263F088C8] indexPathForRow:v12 inSection:0];
    long long v14 = [v9 cellForItemAtIndexPath:v13];

    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v14);
  }
}

@end