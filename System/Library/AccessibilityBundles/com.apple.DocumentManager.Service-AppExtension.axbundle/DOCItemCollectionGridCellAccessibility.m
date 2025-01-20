@interface DOCItemCollectionGridCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsFolder;
- (BOOL)_accessibilitySubviewIsVisible:(id)a3;
- (CGPoint)accessibilityActivationPoint;
- (id)_axAttrTitle;
- (id)accessibilityDropPointDescriptors;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
@end

@implementation DOCItemCollectionGridCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"com_apple_DocumentManager_Service.DOCItemCollectionGridCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"com_apple_DocumentManager_Service.DOCItemCollectionCell", @"accessibilityTitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"com_apple_DocumentManager_Service.DOCItemCollectionGridCell", @"accessibilitySubtitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"com_apple_DocumentManager_Service.DOCItemCollectionGridCell", @"accessibilitySecondSubtitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"com_apple_DocumentManager_Service.DOCItemCollectionCell", @"accessibilityCellManager", "@", 0);
  [v3 validateClass:@"com_apple_DocumentManager_Service.DOCItemCollectionListCell" isKindOfClass:@"com_apple_DocumentManager_Service.DOCItemCollectionCell"];
  [v3 validateClass:@"com_apple_DocumentManager_Service.DOCItemCollectionGridCell" isKindOfClass:@"com_apple_DocumentManager_Service.DOCItemCollectionCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"com_apple_DocumentManager_Service.DOCItemCollectionCellContent", @"accessibilityIsFolder", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"com_apple_DocumentManager_Service.DOCItemCollectionCellContent", @"accessibilityItem", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"com_apple_DocumentManager_Service.DOCItemCollectionCell", @"accessibilityThumbnailView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"com_apple_DocumentManager_Service.DOCItemCollectionCellContent", @"accessibilityItem", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FPItem", @"isCloudItem", "B", 0);
  [v3 validateClass:@"UICollectionView" hasInstanceVariable:@"_dragAndDropController" withType:"_UICollectionViewDragAndDropController"];
}

- (BOOL)_accessibilitySubviewIsVisible:(id)a3
{
  id v4 = a3;
  if (AXDoesRequestingClientDeserveAutomation()
    && (objc_opt_class(),
        __UIAccessibilityCastAsClass(),
        v5 = objc_claimAutoreleasedReturnValue(),
        [v5 window],
        v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        !v6))
  {
    char v7 = [v4 _accessibilityViewIsVisibleIgnoringAXOverrides:0 stoppingBeforeContainer:self];
  }
  else
  {
    char v7 = [v4 _accessibilityViewIsVisible];
  }
  BOOL v8 = v7;

  return v8;
}

- (id)_axAttrTitle
{
  id v3 = [(DOCItemCollectionGridCellAccessibility *)self safeValueForKey:@"accessibilityTitleLabel"];
  if ([(DOCItemCollectionGridCellAccessibility *)self _accessibilitySubviewIsVisible:v3])
  {
    objc_opt_class();
    id v4 = [(DOCItemCollectionGridCellAccessibility *)self safeValueForKey:@"accessibilityTitleLabel"];
    v5 = __UIAccessibilityCastAsClass();

    v6 = [v5 attributedText];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)accessibilityLabel
{
  id v3 = [(DOCItemCollectionGridCellAccessibility *)self safeValueForKey:@"accessibilityCellManager"];
  id v4 = [v3 safeValueForKey:@"accessibilityItem"];
  v5 = __UIAccessibilitySafeClass();

  if ([v5 isCloudItem] && (objc_msgSend(v5, "isDownloaded") & 1) == 0)
  {
    v27 = accessibilityLocalizedString(@"in.cloud");
  }
  else
  {
    v27 = 0;
  }
  v28 = v5;
  v6 = [(DOCItemCollectionGridCellAccessibility *)self _axAttrTitle];
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__0;
  v34 = __Block_byref_object_dispose__0;
  id v35 = 0;
  uint64_t v7 = [v6 length];
  uint64_t v8 = *MEMORY[0x263F1C208];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __60__DOCItemCollectionGridCellAccessibility_accessibilityLabel__block_invoke;
  v29[3] = &unk_26516A560;
  v29[4] = &v30;
  objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v8, 0, v7, 0, v29);
  v9 = [v6 string];
  v22 = (void *)v31[5];
  v23 = @"__AXStringForVariablesSentinel";
  v10 = __UIAXStringForVariables();
  v25 = v6;
  v26 = v3;

  if (!v28)
  {
    v13 = 0;
    goto LABEL_13;
  }
  if (AXDoesRequestingClientDeserveAutomation())
  {
    v11 = objc_msgSend(v28, "filename", v22, @"__AXStringForVariablesSentinel");
    v12 = [v11 pathExtension];
    v22 = v12;
    v23 = @"__AXStringForVariablesSentinel";
    id v3 = __UIAXStringForVariables();

    v13 = 0;
    v10 = v3;
  }
  else
  {
    if ([(DOCItemCollectionGridCellAccessibility *)self _accessibilityIsFolder])
    {
      v13 = accessibilityLocalizedString(@"folder.type");
      goto LABEL_13;
    }
    v11 = [v28 filename];
    v12 = [v11 pathExtension];
    v13 = UIAXFileTypeDescriptionForFileExtension();
  }

LABEL_13:
  v14 = [(DOCItemCollectionGridCellAccessibility *)self safeValueForKey:@"accessibilitySubtitleLabel", v22, v23];
  BOOL v15 = [(DOCItemCollectionGridCellAccessibility *)self _accessibilitySubviewIsVisible:v14];
  if (v15)
  {
    v24 = [(DOCItemCollectionGridCellAccessibility *)self safeValueForKey:@"accessibilitySubtitleLabel"];
    v16 = [v24 accessibilityLabel];
  }
  else
  {
    v16 = 0;
  }
  v17 = [(DOCItemCollectionGridCellAccessibility *)self safeValueForKey:@"accessibilitySecondSubtitleLabel"];
  BOOL v18 = [(DOCItemCollectionGridCellAccessibility *)self _accessibilitySubviewIsVisible:v17];
  if (v18)
  {
    id v3 = [(DOCItemCollectionGridCellAccessibility *)self safeValueForKey:@"accessibilitySecondSubtitleLabel"];
    v19 = [v3 accessibilityLabel];
  }
  else
  {
    v19 = 0;
  }
  v20 = __UIAXStringForVariables();
  if (v18)
  {
  }
  if (v15)
  {
  }
  _Block_object_dispose(&v30, 8);

  return v20;
}

void __60__DOCItemCollectionGridCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v8 contentView];
    uint64_t v7 = [v3 accessibilityLabel];
    uint64_t v4 = __UIAXStringForVariables();
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

- (id)accessibilityUserInputLabels
{
  v2 = (void *)MEMORY[0x263EFF8C0];
  id v3 = [(DOCItemCollectionGridCellAccessibility *)self _axAttrTitle];
  uint64_t v4 = [v3 string];
  uint64_t v5 = objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v4);

  return v5;
}

- (CGPoint)accessibilityActivationPoint
{
  char v15 = 0;
  objc_opt_class();
  id v3 = [(DOCItemCollectionGridCellAccessibility *)self safeValueForKey:@"accessibilityThumbnailView"];
  uint64_t v4 = __UIAccessibilityCastAsClass();

  uint64_t v5 = [v4 window];
  v6 = (void *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    v14.receiver = self;
    v14.super_class = (Class)DOCItemCollectionGridCellAccessibility;
    [(DOCItemCollectionGridCellAccessibility *)&v14 accessibilityActivationPoint];
  }
  else
  {
    [v4 bounds];
    AX_CGRectGetCenter();
    objc_msgSend(v4, "convertPoint:toView:", v6);
    objc_msgSend(v6, "convertPoint:toWindow:", 0);
  }
  double v10 = v8;
  double v11 = v9;

  double v12 = v10;
  double v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

- (id)accessibilityDropPointDescriptors
{
  v14[1] = *MEMORY[0x263EF8340];
  if ([(DOCItemCollectionGridCellAccessibility *)self _accessibilityIsFolder])
  {
    id v3 = [(DOCItemCollectionGridCellAccessibility *)self _accessibilityViewAncestorIsKindOf:objc_opt_class()];
    char v13 = 0;
    objc_opt_class();
    uint64_t v4 = [(DOCItemCollectionGridCellAccessibility *)self safeValueForKey:@"accessibilityThumbnailView"];
    uint64_t v5 = __UIAccessibilityCastAsClass();

    if ([v3 hasActiveDrop]) {
      BOOL v6 = v5 == 0;
    }
    else {
      BOOL v6 = 1;
    }
    if (!v6)
    {
      id v7 = objc_alloc(MEMORY[0x263F1C3B8]);
      double v8 = accessibilityLocalizedString(@"drop.into.folder");
      [v5 bounds];
      AX_CGRectGetCenter();
      objc_msgSend(v5, "convertPoint:toView:", v3);
      double v9 = objc_msgSend(v7, "initWithName:point:inView:", v8, v3);
      v14[0] = v9;
      double v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];

      goto LABEL_9;
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)DOCItemCollectionGridCellAccessibility;
  double v10 = [(DOCItemCollectionGridCellAccessibility *)&v12 accessibilityDropPointDescriptors];
LABEL_9:

  return v10;
}

- (BOOL)_accessibilityIsFolder
{
  v2 = [(DOCItemCollectionGridCellAccessibility *)self safeValueForKey:@"accessibilityCellManager"];
  id v3 = __UIAccessibilitySafeClass();

  LOBYTE(v2) = [v3 safeBoolForKey:@"accessibilityIsFolder"];
  return (char)v2;
}

@end