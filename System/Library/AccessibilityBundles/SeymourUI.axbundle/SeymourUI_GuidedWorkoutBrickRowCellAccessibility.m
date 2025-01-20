@interface SeymourUI_GuidedWorkoutBrickRowCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityCustomActions;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SeymourUI_GuidedWorkoutBrickRowCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.GuidedWorkoutBrickRowCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SeymourUI.GuidedWorkoutBrickRowCell" isKindOfClass:@"UICollectionViewCell"];
  [v3 validateClass:@"SeymourUI.DownloadButton"];
}

- (id)accessibilityLabel
{
  v2 = [(SeymourUI_GuidedWorkoutBrickRowCellAccessibility *)self safeUIViewForKey:@"contentView"];
  id v3 = v2;
  if (v2)
  {
    v4 = [v2 subviews];
    v5 = objc_msgSend(v4, "ax_filteredArrayUsingBlock:", &__block_literal_global_1);
    v6 = v5;
    if (v5)
    {
      v7 = objc_msgSend(v5, "ax_mappedArrayUsingBlock:", &__block_literal_global_284);

      v6 = AXLabelForElements();
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)SeymourUI_GuidedWorkoutBrickRowCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(SeymourUI_GuidedWorkoutBrickRowCellAccessibility *)&v3 accessibilityTraits];
}

- (id)_accessibilityCustomActions
{
  v10[1] = *MEMORY[0x263EF8340];
  v2 = [(SeymourUI_GuidedWorkoutBrickRowCellAccessibility *)self _accessibilityDescendantOfType:MEMORY[0x245660210](@"SeymourUI.DownloadButton", a2)];
  objc_super v3 = [v2 accessibilityLabel];
  if ([v3 length])
  {
    id v4 = objc_alloc(MEMORY[0x263F1C390]);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __79__SeymourUI_GuidedWorkoutBrickRowCellAccessibility__accessibilityCustomActions__block_invoke;
    v8[3] = &unk_26514EEA0;
    id v9 = v2;
    v5 = (void *)[v4 initWithName:v3 actionHandler:v8];
    v10[0] = v5;
    v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end