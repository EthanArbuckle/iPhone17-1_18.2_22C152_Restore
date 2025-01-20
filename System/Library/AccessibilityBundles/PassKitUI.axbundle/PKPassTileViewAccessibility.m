@interface PKPassTileViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsEventDetailsListView;
- (BOOL)isAccessibilityElement;
- (id)_axHostingView;
- (id)_axHostingViewLabel;
- (id)accessibilityLabel;
@end

@implementation PKPassTileViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPassTileView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKPassTileView" hasInstanceVariable:@"_title" withType:"UILabel"];
  [v3 validateClass:@"PKPassTileView" hasInstanceVariable:@"_body" withType:"UILabel"];
  [v3 validateClass:@"PKPassTileView" hasInstanceVariable:@"_footer" withType:"UILabel"];
  [v3 validateClass:@"PKPassTileView" hasInstanceVariable:@"_hostedView" withType:"UIView"];
  [v3 validateClass:@"_TtGC9PassKitUI22PKEquatableHostingViewVS_20EventDetailsListView_" isKindOfClass:@"PKEquatableHostingView"];
}

- (BOOL)isAccessibilityElement
{
  return ![(PKPassTileViewAccessibility *)self _axIsEventDetailsListView];
}

- (id)accessibilityLabel
{
  id v3 = [(PKPassTileViewAccessibility *)self _axHostingView];

  if (v3)
  {
    v4 = [(PKPassTileViewAccessibility *)self _axHostingViewLabel];
  }
  else
  {
    v5 = [(PKPassTileViewAccessibility *)self safeUIViewForKey:@"_title"];
    v6 = [v5 accessibilityLabel];

    v7 = [(PKPassTileViewAccessibility *)self safeUIViewForKey:@"_body"];
    v8 = [v7 accessibilityLabel];

    v9 = [(PKPassTileViewAccessibility *)self safeUIViewForKey:@"_footer"];
    v10 = [v9 accessibilityLabel];

    v11 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 3, v6, v8, v10);
    v4 = AXLabelForElements();
  }

  return v4;
}

- (id)_axHostingView
{
  return (id)[(PKPassTileViewAccessibility *)self safeUIViewForKey:@"_hostedView"];
}

- (BOOL)_axIsEventDetailsListView
{
  v2 = [(PKPassTileViewAccessibility *)self _axHostingView];
  NSClassFromString(&cfstr_Ttgc9passkitui.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_axHostingViewLabel
{
  v2 = [(PKPassTileViewAccessibility *)self _axHostingView];
  id v3 = [v2 _accessibilityFindUnsortedDescendantsPassingTest:&__block_literal_global_1];

  v4 = AXLabelForElements();

  return v4;
}

BOOL __50__PKPassTileViewAccessibility__axHostingViewLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isAccessibilityElement])
  {
    id v3 = [v2 accessibilityLabel];
    BOOL v4 = v3 != 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

@end