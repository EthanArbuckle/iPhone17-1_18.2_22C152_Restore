@interface _UIBarCustomizationReservoirCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityAllDragSourceDescriptors;
- (id)_accessibilityAllDropPointDescriptors;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation _UIBarCustomizationReservoirCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIBarCustomizationReservoirCell";
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
  objc_storeStrong(location, 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)UIAXStringForAllChildren();
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8] | *MEMORY[0x263F81380];
}

- (id)_accessibilityAllDragSourceDescriptors
{
  v21[1] = *MEMORY[0x263EF8340];
  v20 = self;
  SEL v19 = a2;
  [(_UIBarCustomizationReservoirCellAccessibility *)self bounds];
  CGRect v18 = v23;
  CGFloat MidX = CGRectGetMidX(v23);
  CGRectGetMidY(v18);
  CGPointMake();
  *(void *)&long long v17 = v2;
  *((void *)&v17 + 1) = v3;
  id v16 = (id)[(_UIBarCustomizationReservoirCellAccessibility *)v20 _accessibilityFindViewAncestor:&__block_literal_global_5 startWithSelf:1];
  [(_UIBarCustomizationReservoirCellAccessibility *)v20 convertPoint:v16 toView:v17];
  *(void *)&long long v15 = v4;
  *((void *)&v15 + 1) = v5;
  long long v17 = v15;
  id v9 = objc_alloc(MEMORY[0x263F1C3B8]);
  v8 = NSString;
  id v12 = (id)UIKitAccessibilityLocalizedString();
  id v11 = [(_UIBarCustomizationReservoirCellAccessibility *)v20 accessibilityLabel];
  id v10 = (id)objc_msgSend(v8, "localizedStringWithFormat:", v12, v11, *(void *)&MidX);
  uint64_t v14 = objc_msgSend(v9, "initWithName:point:inView:", v17);

  v21[0] = v14;
  id v13 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
  objc_storeStrong((id *)&v14, 0);
  objc_storeStrong(&v16, 0);

  return v13;
}

- (id)_accessibilityAllDropPointDescriptors
{
  v16[1] = *MEMORY[0x263EF8340];
  long long v15 = self;
  v14[1] = (id)a2;
  v14[0] = (id)[(_UIBarCustomizationReservoirCellAccessibility *)self _accessibilityFindViewAncestor:&__block_literal_global_282 startWithSelf:1];
  [(_UIBarCustomizationReservoirCellAccessibility *)v15 bounds];
  CGRect v13 = v18;
  CGRectGetMidX(v18);
  CGRectGetMidY(v13);
  CGPointMake();
  -[_UIBarCustomizationReservoirCellAccessibility convertPoint:toView:](v15, "convertPoint:toView:", v14[0], v2, v3);
  *(void *)&long long v11 = v4;
  *((void *)&v11 + 1) = v5;
  long long v12 = v11;
  id v7 = objc_alloc(MEMORY[0x263F1C3B8]);
  id v8 = (id)UIKitAccessibilityLocalizedString();
  uint64_t v10 = objc_msgSend(v7, "initWithName:point:inView:", v11);

  v16[0] = v10;
  id v9 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(v14, 0);

  return v9;
}

@end