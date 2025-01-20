@interface TabOverviewItemViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityScrollToVisible;
- (BOOL)isAccessibilityElement;
- (_NSRange)_accessibilityRowRange;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityCustomActions;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)automationElements;
- (unint64_t)accessibilityTraits;
- (unsigned)_accessibilityMediaAnalysisOptions;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation TabOverviewItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFTabOverviewItemView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SFTabOverviewItemView" isKindOfClass:@"UIView"];
  [v3 validateClass:@"SFTabOverviewItemView" hasSwiftField:@"thumbnailView" withSwiftType:"TabThumbnailView"];
  [v3 validateClass:@"SFTabOverviewItemView" hasSwiftField:@"configuration" withSwiftType:"Configuration"];
  [v3 validateSwiftStruct:@"MobileSafari.TabOverviewItemView[class].Configuration" hasSwiftField:@"canBeClosed" withSwiftType:"Bool"];
  [v3 validateSwiftStruct:@"MobileSafari.TabOverviewItemView[class].Configuration" hasSwiftField:@"isPinned" withSwiftType:"Bool"];
  [v3 validateSwiftStruct:@"MobileSafari.TabOverviewItemView[class].Configuration" hasSwiftField:@"isSelected" withSwiftType:"Bool"];
  [v3 validateSwiftStruct:@"MobileSafari.TabOverviewItemView[class].Configuration" hasSwiftField:@"showsMultipleSelectionIndicator" withSwiftType:"Bool"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFTabThumbnailView", @"trailingCornerButtonReceivedTap", "v", 0);
  [v3 validateClass:@"SFTabThumbnailView" hasSwiftField:@"trailingCornerButton" withSwiftType:"CornerButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFTabOverview", @"indexInAllItemsForItemView:", "q", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFTabOverview", @"totalItemCount", "q", 0);
  [v3 validateClass:@"SFTabOverview" hasSwiftField:@"content" withSwiftType:"Content"];
  [v3 validateSwiftStruct:@"MobileSafari.TabOverview[class].Content" hasSwiftField:@"cancelRetitlingButtonStyle" withSwiftType:"CancelEditingButtonStyle"];
  [v3 validateSwiftEnum:@"MobileSafari.CancelEditingButtonStyle"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)TabOverviewItemViewAccessibility;
  [(TabOverviewItemViewAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  id v3 = [(TabOverviewItemViewAccessibility *)self safeSwiftValueForKey:@"thumbnailView"];
  v4 = [v3 safeSwiftValueForKey:@"trailingCornerButton"];

  [v4 setIsAccessibilityElement:1];
  v5 = accessibilitySafariServicesLocalizedString(@"close.button");
  [v4 setAccessibilityLabel:v5];
}

- (id)accessibilityCustomActions
{
  id v3 = [(TabOverviewItemViewAccessibility *)self _accessibilityAncestorIsKindOf:MEMORY[0x245655C80](@"SFTabOverview", a2)];
  v4 = [v3 safeSwiftValueForKey:@"content"];
  v5 = [v4 safeSwiftValueForKey:@"cancelRetitlingButtonStyle"];
  objc_super v6 = [v5 safeSwiftEnumCase];
  char v7 = [v6 isEqualToString:@"undo"];

  if (v7)
  {
    v8 = 0;
    goto LABEL_8;
  }
  v8 = [MEMORY[0x263EFF980] array];
  objc_initWeak(&location, self);
  v9 = [(TabOverviewItemViewAccessibility *)self safeSwiftValueForKey:@"configuration"];
  if ([v9 safeSwiftBoolForKey:@"canBeClosed"])
  {
    v10 = [(TabOverviewItemViewAccessibility *)self safeSwiftValueForKey:@"configuration"];
    if (![v10 safeSwiftBoolForKey:@"showsMultipleSelectionIndicator"])
    {
      v15 = [(TabOverviewItemViewAccessibility *)self safeSwiftValueForKey:@"configuration"];
      char v16 = [v15 safeSwiftBoolForKey:@"isPinned"];

      if ((v16 & 1) == 0)
      {
        id v17 = objc_alloc(MEMORY[0x263F1C390]);
        v18 = accessibilitySafariServicesLocalizedString(@"close.button");
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __62__TabOverviewItemViewAccessibility_accessibilityCustomActions__block_invoke;
        v22[3] = &unk_265135E18;
        objc_copyWeak(&v23, &location);
        v19 = (void *)[v17 initWithName:v18 actionHandler:v22];

        [v19 _accessibilitySetInternalCustomActionIdentifier:@"AX_CLOSE"];
        [v8 addObject:v19];

        objc_destroyWeak(&v23);
      }
      goto LABEL_7;
    }
  }
LABEL_7:
  id v11 = objc_alloc(MEMORY[0x263F1C390]);
  v12 = accessibilityMobileSafariLocalizedString(@"show.context.menu");
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __62__TabOverviewItemViewAccessibility_accessibilityCustomActions__block_invoke_2;
  v20[3] = &unk_265135E18;
  objc_copyWeak(&v21, &location);
  v13 = (void *)[v11 initWithName:v12 actionHandler:v20];

  [v8 addObject:v13];
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
LABEL_8:

  return v8;
}

uint64_t __62__TabOverviewItemViewAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained safeSwiftValueForKey:@"thumbnailView"];
  [v2 trailingCornerButtonReceivedTap];

  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  return 1;
}

uint64_t __62__TabOverviewItemViewAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  id v1 = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [v1 safeSwiftValueForKey:@"thumbnailView"];
  [v1 _accessibilityShowContextMenuForElement:v2 targetPointValue:0];

  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  return 1;
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

- (id)_accessibilitySupplementaryFooterViews
{
  if ((AXRequestingClient() & 0xFFFFFFFFFFFFFFFDLL) == 5)
  {
    id v3 = (void *)MEMORY[0x263EFF8C0];
    v4 = [(TabOverviewItemViewAccessibility *)self safeSwiftValueForKey:@"thumbnailView"];
    v5 = [v4 safeSwiftValueForKey:@"trailingCornerButton"];
    objc_super v6 = objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 1, v5);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)TabOverviewItemViewAccessibility;
    objc_super v6 = [(TabOverviewItemViewAccessibility *)&v8 _accessibilitySupplementaryFooterViews];
  }

  return v6;
}

- (id)automationElements
{
  v2 = (void *)MEMORY[0x263EFF8C0];
  id v3 = [(TabOverviewItemViewAccessibility *)self safeSwiftValueForKey:@"thumbnailView"];
  v4 = [v3 safeSwiftValueForKey:@"trailingCornerButton"];
  v5 = objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v4);

  return v5;
}

- (_NSRange)_accessibilityRowRange
{
  [(TabOverviewItemViewAccessibility *)self _accessibilityAncestorIsKindOf:MEMORY[0x245655C80](@"SFTabOverview", a2)];
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v7 = 0;
  objc_super v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  AXPerformSafeBlock();
  NSUInteger v3 = v12[3];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v3 = 0;
    NSUInteger v4 = 0;
  }
  else
  {
    NSUInteger v4 = v8[3];
  }

  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);

  NSUInteger v5 = v3;
  NSUInteger v6 = v4;
  result.length = v6;
  result.id location = v5;
  return result;
}

uint64_t __58__TabOverviewItemViewAccessibility__accessibilityRowRange__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) indexInAllItemsForItemView:*(void *)(a1 + 40)];
  uint64_t result = [*(id *)(a1 + 32) totalItemCount];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2 = *MEMORY[0x263F813F8];
  NSUInteger v3 = [(TabOverviewItemViewAccessibility *)self safeSwiftValueForKey:@"configuration"];
  int v4 = [v3 safeSwiftBoolForKey:@"isSelected"];

  uint64_t v5 = *MEMORY[0x263F1CF38];
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v5 | v2;
}

- (id)accessibilityHint
{
  uint64_t v2 = [(TabOverviewItemViewAccessibility *)self safeSwiftValueForKey:@"configuration"];
  if ([v2 safeSwiftBoolForKey:@"showsMultipleSelectionIndicator"]
    && ([v2 safeSwiftBoolForKey:@"isSelected"] & 1) == 0)
  {
    NSUInteger v3 = accessibilityMobileSafariLocalizedString(@"tab.overview.selection.hint");
  }
  else
  {
    NSUInteger v3 = 0;
  }

  return v3;
}

- (BOOL)_accessibilityScrollToVisible
{
  v3.receiver = self;
  v3.super_class = (Class)TabOverviewItemViewAccessibility;
  return [(TabOverviewItemViewAccessibility *)&v3 _accessibilityScrollToVisible];
}

- (id)accessibilityLabel
{
  objc_super v3 = [(TabOverviewItemViewAccessibility *)self safeSwiftValueForKey:@"configuration"];
  int v4 = [v3 safeSwiftBoolForKey:@"isPinned"];

  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)TabOverviewItemViewAccessibility;
    uint64_t v5 = [(TabOverviewItemViewAccessibility *)&v10 accessibilityLabel];
    objc_super v8 = accessibilityMobileSafariLocalizedString(@"tab.pinned");
    NSUInteger v6 = __AXStringForVariables();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)TabOverviewItemViewAccessibility;
    NSUInteger v6 = [(TabOverviewItemViewAccessibility *)&v9 accessibilityLabel];
  }

  return v6;
}

@end