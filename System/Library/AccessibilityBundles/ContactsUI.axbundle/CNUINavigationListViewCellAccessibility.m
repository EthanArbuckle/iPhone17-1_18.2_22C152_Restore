@interface CNUINavigationListViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityToggleSelection;
- (id)accessibilityCustomActions;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CNUINavigationListViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNUINavigationListViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNUINavigationListViewCell", @"accessoryImageView", "@", 0);
  [v3 validateClass:@"CNUINavigationListViewCell" hasProperty:@"accessoryControlExpanded" customGetter:@"isAccessoryControlExpanded" customSetter:0 withType:"B"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)CNUINavigationListViewCellAccessibility;
  [(CNUINavigationListViewCellAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CNUINavigationListViewCellAccessibility *)self safeValueForKey:@"accessoryImageView"];
  [v3 setIsAccessibilityElement:0];
}

- (id)accessibilityCustomActions
{
  id v3 = [MEMORY[0x263EFF980] array];
  v13.receiver = self;
  v13.super_class = (Class)CNUINavigationListViewCellAccessibility;
  objc_super v4 = [(CNUINavigationListViewCellAccessibility *)&v13 accessibilityCustomActions];
  [v3 axSafelyAddObjectsFromArray:v4];

  v5 = [(CNUINavigationListViewCellAccessibility *)self safeUIViewForKey:@"accessoryImageView"];
  int v6 = [v5 _accessibilityViewIsVisible];

  if (v6)
  {
    int v7 = [(CNUINavigationListViewCellAccessibility *)self safeBoolForKey:@"accessoryControlExpanded"];
    id v8 = objc_alloc(MEMORY[0x263F1C390]);
    if (v7) {
      v9 = @"collapse.selection.action";
    }
    else {
      v9 = @"expand.selection.action";
    }
    v10 = accessibilityLocalizedString(v9);
    v11 = (void *)[v8 initWithName:v10 target:self selector:sel__accessibilityToggleSelection];

    [v3 axSafelyAddObject:v11];
  }

  return v3;
}

- (BOOL)_accessibilityToggleSelection
{
  v2 = [(CNUINavigationListViewCellAccessibility *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
  id v3 = [v2 safeValueForKey:@"delegate"];
  objc_opt_class();
  __UIAccessibilityCastAsSafeCategory();
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  AXPerformSafeBlock();
  char v4 = *((unsigned char *)v8 + 24);

  _Block_object_dispose(&v7, 8);
  return v4;
}

void __72__CNUINavigationListViewCellAccessibility__accessibilityToggleSelection__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) _accessibilityToggleItemForCell:*(void *)(a1 + 40)];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    UIAccessibilityNotifications v2 = *MEMORY[0x263F1CE68];
    id v3 = *(void **)(a1 + 40);
    UIAccessibilityPostNotification(v2, v3);
  }
}

@end