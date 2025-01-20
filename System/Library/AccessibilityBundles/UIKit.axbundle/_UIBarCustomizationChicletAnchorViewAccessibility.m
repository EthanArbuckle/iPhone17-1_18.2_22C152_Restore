@interface _UIBarCustomizationChicletAnchorViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityAllDragSourceDescriptors;
- (id)_accessibilityAllDropPointDescriptors;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)axBarCustomizationChiclet;
- (id)axBarCustomizationRepresentedItem;
- (unint64_t)accessibilityTraits;
@end

@implementation _UIBarCustomizationChicletAnchorViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIBarCustomizationChicletAnchorView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [location[0] validateClass:@"_UIBarCustomizationContainerView"];
  objc_msgSend(location[0], "validateClass:hasProperty:withType:", @"_UIBarCustomizationChicletAnchorView", @"chiclet");
  [location[0] validateClass:@"_UIBarCustomizationChiclet" hasProperty:@"representedItem" withType:"@"];
  objc_msgSend(location[0], "validateClass:hasProperty:withType:");
  [location[0] validateClass:@"_UIBarCustomizationItem" hasProperty:@"identifier" withType:"@"];
  objc_storeStrong(location, 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8] | *MEMORY[0x263F81380];
}

- (id)accessibilityLabel
{
  id v4 = [(_UIBarCustomizationChicletAnchorViewAccessibility *)self axBarCustomizationRepresentedItem];
  id v3 = (id)[v4 safeStringForKey:@"name"];
  id v5 = (id)UIKitAccessibilityLocalizedString();

  return v5;
}

- (id)accessibilityIdentifier
{
  id v3 = [(_UIBarCustomizationChicletAnchorViewAccessibility *)self axBarCustomizationRepresentedItem];
  id v4 = (id)[v3 safeStringForKey:@"identifier"];

  return v4;
}

- (id)_accessibilityAllDragSourceDescriptors
{
  v23[1] = *MEMORY[0x263EF8340];
  v21 = self;
  v20[1] = (id)a2;
  id v13 = [(_UIBarCustomizationChicletAnchorViewAccessibility *)self axBarCustomizationChiclet];
  v20[0] = (id)[v13 accessibilityUserDefinedDragSourceDescriptors];

  if (v20[0])
  {
    id v22 = v20[0];
    int v19 = 1;
  }
  else
  {
    [(_UIBarCustomizationChicletAnchorViewAccessibility *)v21 bounds];
    CGRect v18 = v25;
    CGRectGetMidX(v25);
    CGRectGetMidY(v18);
    CGPointMake_10();
    *(void *)&long long v17 = v2;
    *((void *)&v17 + 1) = v3;
    id v16 = (id)[(_UIBarCustomizationChicletAnchorViewAccessibility *)v21 _accessibilityFindViewAncestor:&__block_literal_global_46 startWithSelf:1];
    [(_UIBarCustomizationChicletAnchorViewAccessibility *)v21 convertPoint:v16 toView:v17];
    *(void *)&long long v15 = v4;
    *((void *)&v15 + 1) = v5;
    long long v17 = v15;
    id v9 = objc_alloc(MEMORY[0x263F1C3B8]);
    v8 = NSString;
    id v12 = (id)UIKitAccessibilityLocalizedString();
    id v11 = [(_UIBarCustomizationChicletAnchorViewAccessibility *)v21 accessibilityLabel];
    id v10 = (id)objc_msgSend(v8, "localizedStringWithFormat:", v12, v11);
    uint64_t v14 = objc_msgSend(v9, "initWithName:point:inView:", v17);

    v23[0] = v14;
    id v22 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
    int v19 = 1;
    objc_storeStrong((id *)&v14, 0);
    objc_storeStrong(&v16, 0);
  }
  objc_storeStrong(v20, 0);
  v6 = v22;

  return v6;
}

- (id)_accessibilityAllDropPointDescriptors
{
  v35[2] = *MEMORY[0x263EF8340];
  v33 = self;
  v32[1] = (id)a2;
  id v22 = [(_UIBarCustomizationChicletAnchorViewAccessibility *)self axBarCustomizationChiclet];
  v32[0] = (id)[v22 accessibilityUserDefinedDropPointDescriptors];

  if (v32[0])
  {
    id v34 = v32[0];
    int v31 = 1;
  }
  else
  {
    [(_UIBarCustomizationChicletAnchorViewAccessibility *)v33 bounds];
    CGRect v30 = v37;
    CGRectGetMaxX(v37);
    CGRectGetMidY(v30);
    CGPointMake_10();
    *(void *)&long long v29 = v2;
    *((void *)&v29 + 1) = v3;
    CGRectGetMinX(v30);
    CGRectGetMidY(v30);
    CGPointMake_10();
    *(void *)&long long v28 = v4;
    *((void *)&v28 + 1) = v5;
    id v27 = (id)[(_UIBarCustomizationChicletAnchorViewAccessibility *)v33 _accessibilityFindViewAncestor:&__block_literal_global_301 startWithSelf:1];
    [(_UIBarCustomizationChicletAnchorViewAccessibility *)v33 convertPoint:v27 toView:v29];
    *(void *)&long long v26 = v6;
    *((void *)&v26 + 1) = v7;
    long long v29 = v26;
    id v13 = objc_alloc(MEMORY[0x263F1C3B8]);
    id v12 = NSString;
    id v16 = (id)UIKitAccessibilityLocalizedString();
    id v15 = [(_UIBarCustomizationChicletAnchorViewAccessibility *)v33 accessibilityLabel];
    id v14 = (id)objc_msgSend(v12, "localizedStringWithFormat:", v16, v15);
    uint64_t v25 = objc_msgSend(v13, "initWithName:point:inView:", v29);

    [(_UIBarCustomizationChicletAnchorViewAccessibility *)v33 convertPoint:v27 toView:v28];
    *(void *)&long long v24 = v8;
    *((void *)&v24 + 1) = v9;
    long long v28 = v24;
    id v18 = objc_alloc(MEMORY[0x263F1C3B8]);
    long long v17 = NSString;
    id v21 = (id)UIKitAccessibilityLocalizedString();
    id v20 = [(_UIBarCustomizationChicletAnchorViewAccessibility *)v33 accessibilityLabel];
    id v19 = (id)objc_msgSend(v17, "localizedStringWithFormat:", v21, v20);
    uint64_t v23 = objc_msgSend(v18, "initWithName:point:inView:", v28);

    v35[0] = v25;
    v35[1] = v23;
    id v34 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:2];
    int v31 = 1;
    objc_storeStrong((id *)&v23, 0);
    objc_storeStrong((id *)&v25, 0);
    objc_storeStrong(&v27, 0);
  }
  objc_storeStrong(v32, 0);
  id v10 = v34;

  return v10;
}

- (id)axBarCustomizationChiclet
{
  return (id)[(_UIBarCustomizationChicletAnchorViewAccessibility *)self safeValueForKey:@"chiclet", a2, self];
}

- (id)axBarCustomizationRepresentedItem
{
  id v3 = [(_UIBarCustomizationChicletAnchorViewAccessibility *)self axBarCustomizationChiclet];
  id v4 = (id)[v3 safeValueForKey:@"representedItem"];

  return v4;
}

@end