@interface PBFFocusPosterCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_axWidgetDescriptorFromLookupInfo:(id)a3;
- (id)_axWidgetNames;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (unsigned)_accessibilityMediaAnalysisOptions;
@end

@implementation PBFFocusPosterCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PBFFocusPosterCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PRSWidget"];
  [v3 validateClass:@"PRComplicationDescriptor"];
  [v3 validateClass:@"PBFGenericComplicationLookupInfo"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PBFFocusPosterCell", @"isCheckboxOn", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PBFFocusPosterCell", @"posterPreview", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PBFPosterConfigurationGalleryPreview", @"galleryLocalizedTitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PBFPosterConfigurationGalleryPreview", @"subtitleComplication", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PBFPosterConfigurationGalleryPreview", @"suggestedComplications", "@", 0);
  [v3 validateClass:@"PBFFocusPosterCell" hasInstanceVariable:@"_checkboxView" withType:"PBFFocusCheckboxView"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"PRSWidget", @"pbf_PRSWidgetFromComplicationLookupInfo:uniqueIdentifier:intent:", "@", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PRComplicationDescriptor", @"initWithPRSWidget:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PRComplicationDescriptor", @"widgetDescriptor", "@", 0);
  [v3 validateClass:@"CHSWidgetDescriptor" hasProperty:@"displayName" withType:"@"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(PBFFocusPosterCellAccessibility *)self safeValueForKey:@"posterPreview"];
  id v3 = AXMappedLabelOrValueForPosterPreview(v2);
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
LABEL_5:
    v8 = v5;
    goto LABEL_7;
  }
  v6 = AXPosterProvider(v2);
  int v7 = [v6 isEqualToString:@"com.apple.GradientPoster.GradientPosterExtension"];

  if (v7)
  {
    accessibilityLocalizedString(@"color.poster.label");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v9 = accessibilityLocalizedString(@"lock.screen.wallpaper.label");
  v11 = [v2 safeSwiftStringForKey:@"galleryLocalizedTitle"];
  v8 = AXCFormattedString();

LABEL_7:

  return v8;
}

- (id)accessibilityValue
{
  id v3 = [(PBFFocusPosterCellAccessibility *)self safeValueForKey:@"posterPreview"];
  v4 = AXMappedLabelOrValueForPosterPreview(v3);
  if (!v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)PBFFocusPosterCellAccessibility;
    v4 = [(PBFFocusPosterCellAccessibility *)&v8 accessibilityValue];
  }
  int v7 = [(PBFFocusPosterCellAccessibility *)self _axWidgetNames];
  id v5 = __UIAXStringForVariables();

  return v5;
}

- (unint64_t)accessibilityTraits
{
  int v2 = [(PBFFocusPosterCellAccessibility *)self safeBoolForKey:@"isCheckboxOn"];
  uint64_t v3 = *MEMORY[0x263F832A8];
  if (!v2) {
    uint64_t v3 = 0;
  }
  return v3 | *MEMORY[0x263F83260];
}

- (id)accessibilityHint
{
  uint64_t v3 = [(PBFFocusPosterCellAccessibility *)self safeUIViewForKey:@"_checkboxView"];
  if (v3)
  {
    if ([(PBFFocusPosterCellAccessibility *)self safeBoolForKey:@"isCheckboxOn"])v4 = @"focus.poster.cell.unlink.hint"; {
    else
    }
      v4 = @"focus.poster.cell.link.hint";
  }
  else
  {
    v4 = @"focus.poster.cell.hint";
  }
  id v5 = accessibilityLocalizedString(v4);

  return v5;
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

- (id)_axWidgetNames
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(PBFFocusPosterCellAccessibility *)self safeValueForKey:@"posterPreview"];
  v4 = [v3 safeArrayForKey:@"suggestedComplications"];
  id v5 = [MEMORY[0x263EFF980] array];
  v6 = [MEMORY[0x263EFF9A0] dictionary];
  v28 = v3;
  int v7 = [v3 safeValueForKey:@"subtitleComplication"];
  objc_super v8 = [(PBFFocusPosterCellAccessibility *)self _axWidgetDescriptorFromLookupInfo:v7];

  if (v8)
  {
    v9 = AXTopWidgetAndAppName(v8);
    [v5 axSafelyAddObject:v9];
  }
  v27 = v8;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v10 = v4;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = [(PBFFocusPosterCellAccessibility *)self _axWidgetDescriptorFromLookupInfo:*(void *)(*((void *)&v33 + 1) + 8 * i)];
        AXMapAppNameToWidgets(v15, v6);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v12);
  }
  v26 = v10;

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v16 = [v6 allKeys];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v30 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = [v6 objectForKey:*(void *)(*((void *)&v29 + 1) + 8 * j)];
        v22 = AXFormatAndListWithElements();
        v23 = __UIAXStringForVariables();
        objc_msgSend(v5, "axSafelyAddObject:", v23, v22, @"__AXStringForVariablesSentinel");
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v18);
  }

  v24 = AXFormatAndListWithElements();

  return v24;
}

- (id)_axWidgetDescriptorFromLookupInfo:(id)a3
{
  id v3 = a3;
  MEMORY[0x24565BD30](@"PBFGenericComplicationLookupInfo");
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x3032000000;
    uint64_t v17 = __Block_byref_object_copy__0;
    uint64_t v18 = __Block_byref_object_dispose__0;
    id v19 = 0;
    id v13 = v3;
    AXPerformSafeBlock();
    id v4 = (id)v15[5];

    _Block_object_dispose(&v14, 8);
    if (v4)
    {
      uint64_t v14 = 0;
      v15 = &v14;
      uint64_t v16 = 0x3032000000;
      uint64_t v17 = __Block_byref_object_copy__0;
      uint64_t v18 = __Block_byref_object_dispose__0;
      id v19 = 0;
      uint64_t v8 = MEMORY[0x263EF8330];
      uint64_t v9 = 3221225472;
      id v10 = __69__PBFFocusPosterCellAccessibility__axWidgetDescriptorFromLookupInfo___block_invoke_2;
      uint64_t v11 = &unk_2651454B0;
      id v12 = v4;
      AXPerformSafeBlock();
      id v5 = (id)v15[5];

      _Block_object_dispose(&v14, 8);
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  v6 = objc_msgSend(v5, "safeValueForKey:", @"widgetDescriptor", v8, v9, v10, v11);

  return v6;
}

uint64_t __69__PBFFocusPosterCellAccessibility__axWidgetDescriptorFromLookupInfo___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend((id)MEMORY[0x24565BD30](@"PRSWidget"), "pbf_PRSWidgetFromComplicationLookupInfo:uniqueIdentifier:intent:", *(void *)(a1 + 32), &stru_26F77E3F0, 0);

  return MEMORY[0x270F9A758]();
}

uint64_t __69__PBFFocusPosterCellAccessibility__axWidgetDescriptorFromLookupInfo___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [objc_alloc((Class)MEMORY[0x24565BD30](@"PRComplicationDescriptor")) initWithPRSWidget:*(void *)(a1 + 32)];

  return MEMORY[0x270F9A758]();
}

@end