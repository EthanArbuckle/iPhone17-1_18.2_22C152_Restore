@interface DOCItemCollectionListCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsFolder;
- (id)_axAttrTitle;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
@end

@implementation DOCItemCollectionListCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SaveToFiles.DOCItemCollectionListCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SaveToFiles.DOCItemCollectionCell", @"accessibilityTitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SaveToFiles.DOCItemCollectionListCell", @"accessibilitySubtitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SaveToFiles.DOCItemCollectionListCell", @"accessibilityDateLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SaveToFiles.DOCItemCollectionListCell", @"accessibilitySizeLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SaveToFiles.DOCItemCollectionListCell", @"accessibilityTagView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SaveToFiles.DOCItemCollectionCell", @"accessibilityCellManager", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SaveToFiles.DOCItemCollectionCellContent", @"accessibilityItem", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SaveToFiles.DOCItemCollectionCellContent", @"accessibilityIsFolder", "B", 0);
  [v3 validateClass:@"SaveToFiles.DOCItemCollectionListCell" isKindOfClass:@"SaveToFiles.DOCItemCollectionCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SaveToFiles.DOCItemCollectionCell", @"accessibilityTitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SaveToFiles.DOCItemCollectionCellContent", @"accessibilityItem", "@", 0);
}

- (id)_axAttrTitle
{
  objc_opt_class();
  id v3 = [(DOCItemCollectionListCellAccessibility *)self safeValueForKey:@"accessibilityTitleLabel"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 attributedText];

  return v5;
}

- (id)accessibilityLabel
{
  v4 = [(DOCItemCollectionListCellAccessibility *)self safeValueForKey:@"accessibilityCellManager"];
  v5 = [v4 safeValueForKey:@"accessibilityItem"];
  v6 = __UIAccessibilitySafeClass();

  v37 = v6;
  if ([v6 isCloudItem] && (objc_msgSend(v6, "isDownloaded") & 1) == 0)
  {
    v34 = accessibilityLocalizedString(@"in.cloud");
  }
  else
  {
    v34 = 0;
  }
  v7 = [(DOCItemCollectionListCellAccessibility *)self _axAttrTitle];
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__1;
  v44 = __Block_byref_object_dispose__1;
  id v45 = 0;
  uint64_t v8 = [v7 length];
  uint64_t v9 = *MEMORY[0x263F1C208];
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __60__DOCItemCollectionListCellAccessibility_accessibilityLabel__block_invoke;
  v39[3] = &unk_26514B760;
  v39[4] = &v40;
  objc_msgSend(v7, "enumerateAttribute:inRange:options:usingBlock:", v9, 0, v8, 0, v39);
  v30 = v7;
  v10 = [v7 string];
  v24 = (void *)v41[5];
  v25 = @"__AXStringForVariablesSentinel";
  v38 = __UIAXStringForVariables();
  v29 = v4;

  if (!v37)
  {
    v32 = 0;
    goto LABEL_13;
  }
  if (AXDoesRequestingClientDeserveAutomation())
  {
    v11 = objc_msgSend(v37, "filename", v24, @"__AXStringForVariablesSentinel");
    v12 = [v11 pathExtension];
    v24 = v12;
    v25 = @"__AXStringForVariablesSentinel";
    uint64_t v13 = __UIAXStringForVariables();

    v32 = 0;
    v38 = (void *)v13;
  }
  else
  {
    if ([(DOCItemCollectionListCellAccessibility *)self _accessibilityIsFolder])
    {
      v32 = accessibilityLocalizedString(@"folder.type");
      goto LABEL_13;
    }
    v11 = [v37 filename];
    v12 = [v11 pathExtension];
    v32 = UIAXFileTypeDescriptionForFileExtension();
  }

LABEL_13:
  v36 = [(DOCItemCollectionListCellAccessibility *)self safeValueForKey:@"accessibilitySubtitleLabel", v24, v25];
  int v35 = [v36 _accessibilityViewIsVisible];
  if (v35)
  {
    v28 = [(DOCItemCollectionListCellAccessibility *)self safeValueForKey:@"accessibilitySubtitleLabel"];
    v31 = [v28 accessibilityLabel];
  }
  else
  {
    v31 = 0;
  }
  v33 = [(DOCItemCollectionListCellAccessibility *)self safeValueForKey:@"accessibilityDateLabel"];
  int v14 = [v33 _accessibilityViewIsVisible];
  if (v14)
  {
    v27 = [(DOCItemCollectionListCellAccessibility *)self safeValueForKey:@"accessibilityDateLabel"];
    v15 = [v27 accessibilityLabel];
  }
  else
  {
    v15 = 0;
  }
  v16 = [(DOCItemCollectionListCellAccessibility *)self safeValueForKey:@"accessibilitySizeLabel"];
  int v17 = [v16 _accessibilityViewIsVisible];
  if (v17)
  {
    v26 = [(DOCItemCollectionListCellAccessibility *)self safeValueForKey:@"accessibilitySizeLabel"];
    v18 = [v26 accessibilityLabel];
  }
  else
  {
    v18 = 0;
  }
  v19 = [(DOCItemCollectionListCellAccessibility *)self safeValueForKey:@"accessibilityTagView"];
  int v20 = [v19 _accessibilityViewIsVisible];
  if (v20)
  {
    v2 = [(DOCItemCollectionListCellAccessibility *)self safeValueForKey:@"accessibilityTagView"];
    v21 = [v2 accessibilityLabel];
  }
  else
  {
    v21 = 0;
  }
  v22 = __UIAXStringForVariables();
  if (v20)
  {
  }
  if (v17)
  {
  }
  if (v14)
  {
  }
  if (v35)
  {
  }
  _Block_object_dispose(&v40, 8);

  return v22;
}

void __60__DOCItemCollectionListCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v8 contentView];
    v7 = [v3 accessibilityLabel];
    uint64_t v4 = __UIAXStringForVariables();
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

- (id)accessibilityUserInputLabels
{
  v2 = (void *)MEMORY[0x263EFF8C0];
  id v3 = [(DOCItemCollectionListCellAccessibility *)self _axAttrTitle];
  uint64_t v4 = [v3 string];
  uint64_t v5 = objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v4);

  return v5;
}

- (BOOL)_accessibilityIsFolder
{
  v2 = [(DOCItemCollectionListCellAccessibility *)self safeValueForKey:@"accessibilityCellManager"];
  id v3 = __UIAccessibilitySafeClass();

  LOBYTE(v2) = [v3 safeBoolForKey:@"accessibilityIsFolder"];
  return (char)v2;
}

@end