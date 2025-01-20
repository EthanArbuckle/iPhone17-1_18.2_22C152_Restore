@interface AVTAvatarAttributeEditorModelBuilder
+ (id)buildDataSourceCategoriesFromCoreModel:(id)a3 selectingFromAvatarConfiguration:(id)a4 imageProvider:(id)a5 colorLayerProvider:(id)a6 stickerRenderer:(id)a7 modelManager:(id)a8 withSelectedCategory:(id)a9 atIndex:(unint64_t)a10;
+ (id)filterPresets:(id)a3 forRowRepresentingTags:(id)a4 currentTagSelection:(id)a5 fixedTags:(id)a6 availableTags:(id)a7 sortingOption:(unint64_t)a8;
+ (id)filterPresets:(id)a3 matchingTagValues:(id)a4 sortedUsing:(unint64_t)a5;
+ (id)firstColorSectionInSections:(id)a3;
+ (id)framingModeForRow:(id)a3 selectedPreset:(id)a4;
+ (id)multicolorSectionProviderForCoreMulticolorPicker:(id)a3 platform:(unint64_t)a4 configuration:(id)a5 imageProvider:(id)a6 colorLayerProvider:(id)a7 editingColors:(id)a8 colorDefaultsProvider:(id)a9 modelManager:(id)a10 previousSectionMap:(id)a11 pairingPickers:(id)a12;
+ (id)previewModeForCoreModelGroup:(id)a3;
+ (id)sectionColorItemsForColors:(id)a3 selectedPreset:(id)a4 configuration:(id)a5 modelManager:(id)a6 additionalUpdateKind:(id)a7 imageProvider:(id)a8 colorLayerProvider:(id)a9 pairedCategory:(int64_t)a10 editingColors:(id)a11;
+ (id)sectionForModelColorsRow:(id)a3 configuration:(id)a4 modelManager:(id)a5 imageProvider:(id)a6 colorLayerProvider:(id)a7 pairedCategory:(int64_t)a8 destination:(int64_t)a9 editingColors:(id)a10 displaysTitle:(BOOL)a11;
+ (id)sectionForModelColorsRow:(id)a3 selectedColorPreset:(id)a4 configuration:(id)a5 modelManager:(id)a6 additionalAvatarUpdateKind:(id)a7 imageProvider:(id)a8 colorLayerProvider:(id)a9 pairedCategory:(int64_t)a10 destination:(int64_t)a11 editingColors:(id)a12 displaysTitle:(BOOL)a13;
+ (id)sectionForModelRow:(id)a3 fromModelPresets:(id)a4 selectedModelPreset:(id)a5 tagSelection:(id)a6 fixedTags:(id)a7 availableTags:(id)a8 category:(int64_t)a9 imageProvider:(id)a10 stickerRenderer:(id)a11 configuration:(id)a12 previousSection:(id)a13 pairedCategory:(int64_t)a14;
+ (id)sectionOptionFromModelOptions:(id)a3;
+ (id)sectionProvidersForCoreModelCategory:(id)a3 platform:(unint64_t)a4 modelManager:(id)a5 pairingPickers:(id)a6 editingColors:(id)a7 colorDefaultsProvider:(id)a8 previousSectionMap:(id)a9 imageProvider:(id)a10 colorLayerProvider:(id)a11 stickerRenderer:(id)a12 configuration:(id)a13 displayConditionEvaluator:(id)a14;
+ (id)selectedModelPresetForSelectedPreset:(id)a3 inPresetsList:(id)a4;
+ (id)selectedPresetForCoreModelColorsPicker:(id)a3 isEnabled:(BOOL)a4 fallbackToColorsPicker:(id)a5 colorDefaultsProvider:(id)a6 modelManager:(id)a7;
+ (id)subtitleFromSubtitles:(id)a3 forIndex:(int64_t)a4 enabledIndex:(int64_t)a5;
+ (id)tagCombinationsForTagNames:(id)a3 availableTags:(id)a4;
+ (id)tagSetByRemovingTagNames:(id)a3 fromTagSet:(id)a4;
+ (id)tagSetForTagNames:(id)a3 inTagSet:(id)a4;
+ (int)scoreForTags:(id)a3 forCombination:(id)a4 currentSelection:(id)a5;
+ (unint64_t)destinationForPresetCategory:(int64_t)a3 isPaired:(BOOL)a4;
+ (unint64_t)sectionDisplayModeForCoreModelDisplayMode:(unint64_t)a3;
+ (void)addTags:(id)a3 toMutableTagSet:(id)a4;
+ (void)insertPreset:(id)a3 intoList:(id)a4 forSortingOption:(unint64_t)a5;
+ (void)setTags:(id)a3 onMutableTagSet:(id)a4;
@end

@implementation AVTAvatarAttributeEditorModelBuilder

+ (unint64_t)destinationForPresetCategory:(int64_t)a3 isPaired:(BOOL)a4
{
  unint64_t result = 0;
  switch(a3)
  {
    case 25:
    case 30:
      if (a4) {
        unint64_t result = 3;
      }
      else {
        unint64_t result = 1;
      }
      break;
    case 26:
    case 31:
      if (a4) {
        unint64_t result = 3;
      }
      else {
        unint64_t result = 2;
      }
      break;
    default:
      return result;
  }
  return result;
}

+ (id)buildDataSourceCategoriesFromCoreModel:(id)a3 selectingFromAvatarConfiguration:(id)a4 imageProvider:(id)a5 colorLayerProvider:(id)a6 stickerRenderer:(id)a7 modelManager:(id)a8 withSelectedCategory:(id)a9 atIndex:(unint64_t)a10
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v58 = a4;
  id v57 = a5;
  id v56 = a6;
  id v55 = a7;
  id v16 = a8;
  id v17 = a9;
  v48 = [MEMORY[0x263EFF980] array];
  uint64_t v52 = [v15 platform];
  v59 = [MEMORY[0x263EFF9A0] dictionary];
  v45 = v17;
  if (v17)
  {
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    v18 = [v17 sections];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v72 objects:v78 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v73;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v73 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v72 + 1) + 8 * i);
          v24 = [v23 identifier];
          [v59 setObject:v23 forKeyedSubscript:v24];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v72 objects:v78 count:16];
      }
      while (v20);
    }
  }
  v69[0] = MEMORY[0x263EF8330];
  v69[1] = 3221225472;
  v69[2] = __203__AVTAvatarAttributeEditorModelBuilder_buildDataSourceCategoriesFromCoreModel_selectingFromAvatarConfiguration_imageProvider_colorLayerProvider_stickerRenderer_modelManager_withSelectedCategory_atIndex___block_invoke;
  v69[3] = &unk_263FF2968;
  id v54 = v16;
  id v70 = v54;
  unint64_t v71 = a10;
  v53 = (void *)MEMORY[0x210530210](v69);
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  obuint64_t j = [v15 groups];
  uint64_t v49 = [obj countByEnumeratingWithState:&v65 objects:v77 count:16];
  if (v49)
  {
    uint64_t v47 = *(void *)v66;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v66 != v47) {
          objc_enumerationMutation(obj);
        }
        uint64_t v51 = v25;
        v26 = *(void **)(*((void *)&v65 + 1) + 8 * v25);
        v27 = [MEMORY[0x263EFF980] array];
        v28 = [MEMORY[0x263EFF9A0] dictionary];
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        v50 = v26;
        v29 = [v26 categories];
        uint64_t v30 = [v29 countByEnumeratingWithState:&v61 objects:v76 count:16];
        if (v30)
        {
          uint64_t v31 = v30;
          uint64_t v32 = *(void *)v62;
          do
          {
            for (uint64_t j = 0; j != v31; ++j)
            {
              if (*(void *)v62 != v32) {
                objc_enumerationMutation(v29);
              }
              uint64_t v34 = *(void *)(*((void *)&v61 + 1) + 8 * j);
              v35 = [v15 colors];
              v36 = [v15 colorDefaultsProvider];
              v37 = [a1 sectionProvidersForCoreModelCategory:v34 platform:v52 modelManager:v54 pairingPickers:v28 editingColors:v35 colorDefaultsProvider:v36 previousSectionMap:v59 imageProvider:v57 colorLayerProvider:v56 stickerRenderer:v55 configuration:v58 displayConditionEvaluator:v53];

              if (v37) {
                [v27 addObjectsFromArray:v37];
              }
            }
            uint64_t v31 = [v29 countByEnumeratingWithState:&v61 objects:v76 count:16];
          }
          while (v31);
        }

        v38 = [a1 previewModeForCoreModelGroup:v50];
        v39 = [AVTAvatarAttributeEditorCategory alloc];
        v40 = [v50 name];
        v41 = [v50 symbolNames];
        v42 = [(AVTAvatarAttributeEditorCategory *)v39 initWithSectionProviders:v27 localizedName:v40 previewMode:v38 modelGroup:v50 symbolNames:v41];

        [v48 addObject:v42];
        uint64_t v25 = v51 + 1;
      }
      while (v51 + 1 != v49);
      uint64_t v49 = [obj countByEnumeratingWithState:&v65 objects:v77 count:16];
    }
    while (v49);
  }

  v43 = (void *)[v48 copy];
  return v43;
}

uint64_t __203__AVTAvatarAttributeEditorModelBuilder_buildDataSourceCategoriesFromCoreModel_selectingFromAvatarConfiguration_imageProvider_colorLayerProvider_stickerRenderer_modelManager_withSelectedCategory_atIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return [*(id *)(a1 + 32) shouldDisplaySectionWithDisplayCondition:a2 inCategoryAtIndex:*(void *)(a1 + 40)];
  }
  else {
    return 1;
  }
}

+ (id)sectionProvidersForCoreModelCategory:(id)a3 platform:(unint64_t)a4 modelManager:(id)a5 pairingPickers:(id)a6 editingColors:(id)a7 colorDefaultsProvider:(id)a8 previousSectionMap:(id)a9 imageProvider:(id)a10 colorLayerProvider:(id)a11 stickerRenderer:(id)a12 configuration:(id)a13 displayConditionEvaluator:(id)a14
{
  uint64_t v110 = *MEMORY[0x263EF8340];
  id v18 = a3;
  id v19 = a5;
  id v90 = a6;
  id v100 = a7;
  id v89 = a8;
  uint64_t v20 = v19;
  id v95 = a9;
  id v102 = a10;
  id v99 = a11;
  id v81 = a12;
  id v21 = a13;
  v22 = (uint64_t (**)(id, void *))a14;
  v82 = v18;
  if (v19)
  {
    if (!objc_msgSend(v19, "shouldDisplaySectionForCategory:", objc_msgSend(v18, "presetCategory")))
    {
      v28 = 0;
      goto LABEL_62;
    }
    v23 = [v19 editorState];
    [v18 pairing];
    uint64_t v25 = v24 = v18;
    int v26 = objc_msgSend(v23, "isCategoryPaired:", objc_msgSend(v25, "pairedCategory"));

    if (v26)
    {
      v27 = [v24 pairing];
      uint64_t v94 = [v27 pairedCategory];

      unsigned int v91 = 1;
    }
    else
    {
      unsigned int v91 = 0;
      uint64_t v94 = 40;
    }
    id v18 = v24;
  }
  else
  {
    unsigned int v91 = 0;
    uint64_t v94 = 40;
  }
  id v29 = a1;
  uint64_t v30 = [v18 pairing];

  if (v30)
  {
    uint64_t v31 = [v20 colorsState];
    uint64_t v32 = +[AVTAvatarUpdaterFactory updaterForPairingCategory:v82 colorsState:v31];

    uint64_t v33 = +[AVTAvatarAttributeEditorSectionSupplementalPicker pickerForPairableModelCategory:v82 isPaired:v91 avatarUpdaterOnPair:v32];
    uint64_t v34 = NSNumber;
    v35 = [v82 pairing];
    v36 = objc_msgSend(v34, "numberWithInteger:", objc_msgSend(v35, "pairedCategory"));
    v98 = (void *)v33;
    [v90 setObject:v33 forKeyedSubscript:v36];

    id v18 = v82;
  }
  else
  {
    v98 = 0;
  }
  v93 = [MEMORY[0x263EFF980] array];
  v77 = [MEMORY[0x263EFF980] array];
  v37 = objc_msgSend(v21, "presetForCategory:", objc_msgSend(v18, "presetCategory"));
  uint64_t v38 = [v37 preset];

  v39 = [v18 presets];
  v76 = (void *)v38;
  v40 = [a1 selectedModelPresetForSelectedPreset:v38 inPresetsList:v39];

  v80 = v40;
  v41 = [v40 tags];
  v84 = (void *)[v41 copy];

  uint64_t v79 = [v18 tags];
  v83 = [MEMORY[0x263EFF9A0] dictionary];
  [v18 pickers];
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v103 = [obj countByEnumeratingWithState:&v105 objects:v109 count:16];
  if (v103)
  {
    uint64_t v104 = 0;
    uint64_t v101 = *(void *)v106;
    v85 = v20;
    id v78 = v21;
    v97 = v22;
    do
    {
      for (uint64_t i = 0; i != v103; ++i)
      {
        if (*(void *)v106 != v101) {
          objc_enumerationMutation(obj);
        }
        v43 = *(void **)(*((void *)&v105 + 1) + 8 * i);
        if (v22)
        {
          v44 = [*(id *)(*((void *)&v105 + 1) + 8 * i) options];
          v45 = [v44 displayCondition];
          int v46 = v22[2](v22, v45);

          if (!v46) {
            continue;
          }
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v47 = v43;
        }
        else {
          uint64_t v47 = 0;
        }
        id v48 = v47;
        if (v48)
        {
          uint64_t v49 = [v29 multicolorSectionProviderForCoreMulticolorPicker:v48 platform:a4 configuration:v21 imageProvider:v102 colorLayerProvider:v99 editingColors:v100 colorDefaultsProvider:v89 modelManager:v20 previousSectionMap:v95 pairingPickers:v90];
          if (v49) {
            [v93 addObject:v49];
          }
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v50 = v43;
        }
        else {
          v50 = 0;
        }
        id v51 = v50;
        if (v51)
        {
          LOBYTE(v75) = 1;
          id v52 = [v29 sectionForModelColorsRow:v51 configuration:v21 modelManager:v20 imageProvider:v102 colorLayerProvider:v99 pairedCategory:v94 destination:AVTAvatarSettingDestinationForColorPickerIndex(v104) editingColors:v100 displaysTitle:v75];
          if (v98)
          {
            uint64_t v53 = [v43 pairing];
            if (!v53) {
              goto LABEL_46;
            }
            id v54 = (void *)v53;
            id v55 = [v43 pairing];
            id v56 = v55;
            if (v91) {
              [v55 localizedUnpairTitle];
            }
            else {
            long long v68 = [v55 localizedPairTitle];
            }

            uint64_t v20 = v85;
            if (v68)
            {
              v69 = (void *)[v98 copyWithLocalizedTitle:v68];
              [v52 setSupplementalPicker:v69];
            }
            else
            {
LABEL_46:
              [v52 setSupplementalPicker:v98];
            }
            id v29 = a1;
            if (v91)
            {
              id v70 = [v43 pairing];
              unint64_t v71 = [v70 localizedPairedTitle];
              if (v71)
              {
                [v52 setLocalizedName:v71];
              }
              else
              {
                long long v72 = [v82 pairing];
                long long v73 = [v72 localizedPairedTitle];
                [v52 setLocalizedName:v73];

                uint64_t v20 = v85;
              }

              id v29 = a1;
            }
          }
          if (v52) {
            [v93 addObject:v52];
          }
          ++v104;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v57 = v43;
          }
          else {
            id v57 = 0;
          }
          id v52 = v57;
          if (v52)
          {
            id v86 = v48;
            id v58 = [v43 identifier];
            uint64_t v59 = [v95 objectForKeyedSubscript:v58];

            v60 = [v82 presets];
            v87 = (void *)v59;
            long long v61 = objc_msgSend(v29, "sectionForModelRow:fromModelPresets:selectedModelPreset:tagSelection:fixedTags:availableTags:category:imageProvider:stickerRenderer:configuration:previousSection:pairedCategory:", v43, v60, v80, v84, v83, v79, objc_msgSend(v82, "presetCategory"), v102, v81, v21, v59, v94);

            if (v61)
            {
              long long v62 = [v52 representedTags];
              long long v63 = [a1 tagSetForTagNames:v62 inTagSet:v84];

              [a1 setTags:v63 onMutableTagSet:v83];
              long long v64 = [v61 options];
              uint64_t v65 = [v64 displayMode];

              if (v65 == 1)
              {
                long long v66 = [a1 firstColorSectionInSections:v77];
                if (v66)
                {
                  long long v67 = +[AVTAvatarAttributeEditorSectionSupplementalPicker pickerFromEditorSection:v61];
                  [v66 setSupplementalPicker:v67];
                }
              }
              else
              {
                [v93 addObject:v61];
              }

              uint64_t v20 = v85;
            }

            id v29 = a1;
            id v21 = v78;
            id v48 = v86;
          }
        }

        v22 = v97;
      }
      uint64_t v103 = [obj countByEnumeratingWithState:&v105 objects:v109 count:16];
    }
    while (v103);
  }
  v28 = (void *)[v93 copy];

LABEL_62:
  return v28;
}

+ (id)previewModeForCoreModelGroup:(id)a3
{
  id v3 = a3;
  v4 = [AVTAvatarAttributeEditorPreviewModeOptions alloc];
  v5 = [v3 previewMode];
  v6 = [v5 options];
  v7 = [v6 framingMode];
  v8 = [v3 previewMode];
  v9 = [v8 options];
  v10 = [v9 bodyPosePack];
  v11 = [(AVTAvatarAttributeEditorPreviewModeOptions *)v4 initWithFramingMode:v7 bodyPosePack:v10];

  v12 = [v3 previewMode];

  unint64_t v13 = +[AVTAvatarAttributeEditorPreviewMode attributeEditorPreviewModeTypeForEditingPreviewModeType:](AVTAvatarAttributeEditorPreviewMode, "attributeEditorPreviewModeTypeForEditingPreviewModeType:", [v12 type]);
  v14 = [[AVTAvatarAttributeEditorPreviewMode alloc] initWithType:v13 options:v11];

  return v14;
}

+ (id)selectedModelPresetForSelectedPreset:(id)a3 inPresetsList:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = a4;
  id v7 = (id)[v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "identifier", (void)v15);
        v12 = [v5 identifier];
        int v13 = [v11 isEqualToString:v12];

        if (v13)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

+ (id)sectionForModelColorsRow:(id)a3 configuration:(id)a4 modelManager:(id)a5 imageProvider:(id)a6 colorLayerProvider:(id)a7 pairedCategory:(int64_t)a8 destination:(int64_t)a9 editingColors:(id)a10 displaysTitle:(BOOL)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a10;
  if (v16 && ([v16 isEmpty] & 1) == 0)
  {
    [v18 colorsState];
    v23 = int64_t v29 = a8;
    v24 = objc_msgSend(v23, "selectedColorPresetForCategory:destinationIndex:", objc_msgSend(v16, "colorCategory"), a9);

    uint64_t v25 = AVTColorSettingKind(40, 0);
    LOBYTE(v28) = a11;
    v22 = objc_msgSend(a1, "sectionForModelColorsRow:selectedColorPreset:configuration:modelManager:additionalAvatarUpdateKind:imageProvider:colorLayerProvider:pairedCategory:destination:editingColors:displaysTitle:", v16, v24, v17, v18, v25, v26, v19, v20, v29, a9, v21, v28);
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

+ (id)sectionForModelColorsRow:(id)a3 selectedColorPreset:(id)a4 configuration:(id)a5 modelManager:(id)a6 additionalAvatarUpdateKind:(id)a7 imageProvider:(id)a8 colorLayerProvider:(id)a9 pairedCategory:(int64_t)a10 destination:(int64_t)a11 editingColors:(id)a12 displaysTitle:(BOOL)a13
{
  int64_t var1 = a7.var1;
  int64_t var0 = a7.var0;
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a8;
  id v23 = a9;
  id v24 = a12;
  id v52 = v22;
  if (!v18 || ([v18 isEmpty] & 1) != 0)
  {
    uint64_t v25 = 0;
    goto LABEL_20;
  }
  id v48 = v19;
  uint64_t v26 = [v18 primaryColors];

  if (v26)
  {
    v27 = [v18 primaryColors];
    v45 = objc_msgSend(a1, "sectionColorItemsForColors:selectedPreset:configuration:modelManager:additionalUpdateKind:imageProvider:colorLayerProvider:pairedCategory:editingColors:", v27, v48, v20, v21, var0, var1, v22, v23, a10, v24);
  }
  else
  {
    v45 = 0;
  }
  uint64_t v28 = [v18 extendedColors];

  if (v28)
  {
    int64_t v29 = [v18 extendedColors];
    uint64_t v30 = objc_msgSend(a1, "sectionColorItemsForColors:selectedPreset:configuration:modelManager:additionalUpdateKind:imageProvider:colorLayerProvider:pairedCategory:editingColors:", v29, v48, v20, v21, var0, var1, v22, v23, a10, v24);
  }
  else
  {
    uint64_t v30 = 0;
  }
  int v46 = (void *)v30;
  id v47 = v20;
  if (a10 == 40)
  {
    uint64_t v31 = 0;
    if (a13) {
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  uint64_t v32 = [v18 pairing];
  uint64_t v31 = v32 != 0;

  if (!a13)
  {
LABEL_16:
    uint64_t v49 = 0;
    goto LABEL_19;
  }
  unsigned int v44 = v31;
  uint64_t v33 = [v18 pairing];
  if (!v33)
  {
    uint64_t v31 = v31;
LABEL_18:
    uint64_t v49 = [v18 title];
    goto LABEL_19;
  }
  uint64_t v34 = (void *)v33;
  v35 = [v18 pairing];
  uint64_t v49 = [v35 localizedPairedTitle];

  uint64_t v31 = v44;
LABEL_19:
  v36 = [v18 options];
  v37 = [a1 sectionOptionFromModelOptions:v36];

  uint64_t v51 = objc_msgSend((id)objc_opt_class(), "destinationForPresetCategory:isPaired:", objc_msgSend(v18, "colorCategory"), v31);
  uint64_t v38 = [AVTAvatarAttributeEditorColorSection alloc];
  v39 = [v21 colorsState];
  v40 = [v39 variationStore];
  v41 = [v18 identifier];
  LOBYTE(v43) = [v18 alwaysShowExtended];
  uint64_t v25 = [(AVTAvatarAttributeEditorColorSection *)v38 initWithPrimaryItems:v45 extendedItems:v46 colorVariationStore:v40 localizedName:v49 identifier:v41 intendedDestination:v51 alwaysShowExtended:v43 options:v37];

  id v20 = v47;
  id v19 = v48;
LABEL_20:

  return v25;
}

+ (id)multicolorSectionProviderForCoreMulticolorPicker:(id)a3 platform:(unint64_t)a4 configuration:(id)a5 imageProvider:(id)a6 colorLayerProvider:(id)a7 editingColors:(id)a8 colorDefaultsProvider:(id)a9 modelManager:(id)a10 previousSectionMap:(id)a11 pairingPickers:(id)a12
{
  uint64_t v193 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v162 = a5;
  id v160 = a6;
  id v159 = a7;
  id v158 = a8;
  id v17 = v16;
  id v167 = a9;
  id v18 = a10;
  id v147 = a11;
  id v146 = a12;
  id v19 = (void *)MEMORY[0x263EFF980];
  id v20 = [v17 subpickers];
  v140 = objc_msgSend(v19, "arrayWithCapacity:", objc_msgSend(v20, "count"));

  id v21 = (void *)MEMORY[0x263EFF980];
  id v22 = [v17 subpickers];
  v136 = objc_msgSend(v21, "arrayWithCapacity:", objc_msgSend(v22, "count"));

  id v23 = (void *)MEMORY[0x263EFF980];
  id v24 = [v17 subpickers];
  uint64_t v25 = objc_msgSend(v23, "arrayWithCapacity:", objc_msgSend(v24, "count"));

  v148 = v25;
  v139 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v25, "count"));
  uint64_t v26 = [v18 editorState];
  v27 = [v17 identifier];
  uint64_t v137 = [v26 selectedMulticolorSubpickersIndexForMulticolorPickerIdentifier:v27];

  uint64_t v28 = [v18 editorState];
  int64_t v29 = [v17 identifier];
  uint64_t v30 = [v28 enabledMulticolorSubpickersIndexForMulticolorPickerIdentifier:v29];

  long long v188 = 0u;
  long long v189 = 0u;
  long long v186 = 0u;
  long long v187 = 0u;
  obuint64_t j = [v17 subpickers];
  v141 = v17;
  v161 = v18;
  uint64_t v154 = [obj countByEnumeratingWithState:&v186 objects:v192 count:16];
  if (!v154)
  {
    v138 = 0;
    id v32 = a1;
    goto LABEL_77;
  }
  v138 = 0;
  uint64_t v31 = 0;
  uint64_t v152 = *(void *)v187;
  uint64_t v153 = v30 + 1;
  id v32 = a1;
  uint64_t v163 = v30;
  do
  {
    for (uint64_t i = 0; i != v154; ++i)
    {
      if (*(void *)v187 != v152) {
        objc_enumerationMutation(obj);
      }
      uint64_t v34 = *(void **)(*((void *)&v186 + 1) + 8 * i);
      if (v31 < 1)
      {
        uint64_t v36 = 0;
      }
      else
      {
        v35 = [v17 subpickers];
        uint64_t v36 = [v35 objectAtIndexedSubscript:v31 - 1];
      }
      id v164 = (id)v36;
      [v32 selectedPresetForCoreModelColorsPicker:v34 isEnabled:v31 <= v30 fallbackToColorsPicker:v36 colorDefaultsProvider:v167 modelManager:v18];
      id v171 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v37 = AVTColorSettingKind(40, 0);
      uint64_t v39 = v38;
      BOOL v41 = [v34 colorCategory] == 1 && objc_msgSend(v34, "destination") == 1 && v30 == 0;
      BOOL v43 = [v34 colorCategory] == 2 && objc_msgSend(v34, "destination") == 1 && v30 == 0;
      uint64_t v168 = v31;
      if (v41 || v43)
      {
        unint64_t v44 = v31 + 1;
        v45 = [v17 subpickers];
        if (v44 < [v45 count])
        {
          int v46 = [v17 subpickers];
          id v47 = [v46 objectAtIndexedSubscript:v44];

          uint64_t v30 = v163;
          if (!v47) {
            goto LABEL_30;
          }
          uint64_t v37 = [v47 destination];
          uint64_t v39 = [v47 colorCategory];
          v45 = v47;
        }
      }
LABEL_30:
      LOBYTE(v135) = 0;
      id v48 = objc_msgSend(v32, "sectionForModelColorsRow:selectedColorPreset:configuration:modelManager:additionalAvatarUpdateKind:imageProvider:colorLayerProvider:pairedCategory:destination:editingColors:displaysTitle:", v34, v171, v162, v18, v37, v39, v160, v159, 40, objc_msgSend(v34, "destination"), v158, v135);
      if (!v48)
      {
        uint64_t v31 = v168;
        long long v63 = v164;
        goto LABEL_73;
      }
      [v148 addObject:v48];
      uint64_t v31 = v168;
      BOOL v150 = v168 > v30;
      uint64_t v49 = [v48 sectionItems];
      uint64_t v50 = [v49 indexOfObjectPassingTest:&__block_literal_global_29];

      if (v50 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v51 = 0;
      }
      else {
        uint64_t v51 = v50;
      }
      id v52 = [v48 sectionItems];
      uint64_t v155 = [v52 objectAtIndexedSubscript:v51];

      if (v168 >= 1)
      {
        if ([v34 destination] == 1)
        {
          uint64_t v53 = [v18 colorsState];
          id v54 = [v53 variationStore];
          id v55 = [v138 color];
          id v56 = [v54 colorPresetFromColor:v55];

          id v57 = [v138 color];
          id v58 = objc_msgSend(v57, "copyForPairedCategory:", objc_msgSend(v34, "colorCategory"));
          uint64_t v59 = NSNumber;
          [v56 variation];
          v60 = objc_msgSend(v59, "numberWithFloat:");
          long long v61 = [v18 colorsState];
          long long v62 = +[AVTAvatarUpdaterFactory updaterForColor:v58 variationOverride:v60 colorsState:v61 pairedColors:0 additionalColor:0 saveToColorsState:0];

          id v18 = v161;
        }
        else
        {
          long long v62 = +[AVTAvatarUpdaterFactory updaterForClearingColorsForCategory:destination:](AVTAvatarUpdaterFactory, "updaterForClearingColorsForCategory:destination:", [v34 colorCategory], objc_msgSend(v34, "destination"));
        }
        uint64_t v65 = (void *)[v62 copy];
        long long v66 = (void *)MEMORY[0x210530210]();
        [v140 addObject:v66];

        long long v67 = [v18 colorsState];
        long long v68 = objc_msgSend(v67, "selectedColorForCategory:destinationIndex:", objc_msgSend(v34, "colorCategory"), objc_msgSend(v34, "destination"));

        if (v167 && !v68)
        {
          v69 = objc_msgSend(v167, "defaultColorForCategory:destination:withConfiguration:", objc_msgSend(v34, "colorCategory"), AVTAvatarSettingColorIndexForColorDestination(objc_msgSend(v34, "destination")), v162);
          long long v68 = v69;
          if (v69) {
            id v70 = v69;
          }
        }
        if (!v68)
        {
          unint64_t v71 = [v17 subpickers];
          long long v72 = [v71 objectAtIndexedSubscript:v168 - 1];

          long long v73 = [v18 colorsState];
          long long v74 = objc_msgSend(v73, "selectedColorForCategory:destinationIndex:", objc_msgSend(v72, "colorCategory"), objc_msgSend(v72, "destination"));

          long long v68 = objc_msgSend(v74, "copyForCategory:destination:", objc_msgSend(v34, "colorCategory"), objc_msgSend(v34, "destination"));
        }
        uint64_t v75 = [v18 colorsState];
        v76 = +[AVTAvatarUpdaterFactory updaterForColor:v68 colorsState:v75 pairedColors:0 additionalColor:0 saveToColorsState:0];

        long long v64 = 0;
        if (v168 > v153)
        {
          uint64_t v30 = v163;
          if (v76) {
            goto LABEL_51;
          }
        }
        else
        {
          uint64_t v30 = v163;
          if (v168 > v163) {
            long long v64 = (void *)MEMORY[0x210530210](v76);
          }
          if (v76)
          {
LABEL_51:
            v77 = (void *)[v76 copy];
            id v78 = (void *)MEMORY[0x210530210]();
            [v136 addObject:v78];

            uint64_t v30 = v163;
          }
        }

        id v32 = a1;
        uint64_t v31 = v168;
        goto LABEL_53;
      }
      long long v62 = 0;
      long long v64 = 0;
LABEL_53:
      v157 = v62;
      if (v31 > v153)
      {
        long long v63 = v164;
        v92 = (void *)v155;
      }
      else
      {
        v151 = v48;
        v149 = v64;
        unsigned int v79 = [v17 allowsRemoval];
        if (v31 > 0) {
          uint64_t v80 = v79;
        }
        else {
          uint64_t v80 = 0;
        }
        id v81 = [v17 subtitles];
        [v32 subtitleFromSubtitles:v81 forIndex:v31 enabledIndex:v163];
        v82 = v17;
        v84 = uint64_t v83 = v31;

        uint64_t v85 = v163;
        id v86 = v84;
        v87 = v82;
        v144 = v86;
        if (!v86)
        {
          if (v83 <= v163)
          {
            id v86 = [v34 title];
          }
          else
          {
            v88 = NSString;
            id v89 = AVTAvatarUIBundle();
            id v90 = [v89 localizedStringForKey:@"ADD_MULTICOLOR_FORMAT" value:&stru_26BF058D0 table:@"Localized"];
            unsigned int v91 = [v34 title];
            objc_msgSend(v88, "stringWithFormat:", v90, v91);
            id v86 = (id)objc_claimAutoreleasedReturnValue();

            uint64_t v85 = v163;
          }
          v87 = v141;
          uint64_t v83 = v168;
        }
        BOOL v143 = v83 > v85;
        if (v80) {
          v93 = v157;
        }
        else {
          v93 = 0;
        }
        uint64_t v94 = v80;
        uint64_t v95 = MEMORY[0x210530210](v93);
        v96 = [AVTAvatarAttributeEditorMulticolorPickerSectionItem alloc];
        v97 = [v151 identifier];
        v98 = [v151 colorVariationStore];
        v181[0] = MEMORY[0x263EF8330];
        v181[1] = 3221225472;
        v181[2] = __228__AVTAvatarAttributeEditorModelBuilder_multicolorSectionProviderForCoreMulticolorPicker_platform_configuration_imageProvider_colorLayerProvider_editingColors_colorDefaultsProvider_modelManager_previousSectionMap_pairingPickers___block_invoke_2;
        v181[3] = &unk_263FF2990;
        BOOL v185 = v150;
        id v182 = v161;
        uint64_t v184 = v83;
        id v183 = v87;
        v169 = (void *)v95;
        v92 = (void *)v155;
        id v99 = [(AVTAvatarAttributeEditorMulticolorPickerSectionItem *)v96 initWithIdentifier:v97 localizedName:v86 isPlaceholder:v143 isRemovable:v94 colorItem:v155 variationStore:v98 avatarUpdater:v149 editorStateUpdater:v181 removalUpdater:v95];

        [(AVTAvatarAttributeEditorMulticolorPickerSectionItem *)v99 setSelected:v83 == v137];
        [v139 addObject:v99];
        uint64_t v100 = v83;
        if (!v83)
        {
          uint64_t v101 = [v148 objectAtIndexedSubscript:0];
          id v102 = [v101 sectionItems];
          uint64_t v103 = [v102 indexOfObjectPassingTest:&__block_literal_global_24];

          if (v103 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v104 = [v151 sectionItems];
            uint64_t v105 = [v104 objectAtIndexedSubscript:v103];

            v138 = (void *)v105;
          }
        }
        id v17 = v141;
        id v32 = a1;
        uint64_t v30 = v163;
        long long v64 = v149;
        uint64_t v31 = v100 + 1;

        long long v63 = v164;
        id v48 = v151;
      }

      id v18 = v161;
LABEL_73:
    }
    uint64_t v154 = [obj countByEnumeratingWithState:&v186 objects:v192 count:16];
  }
  while (v154);
LABEL_77:

  long long v106 = v148;
  if ([v148 count])
  {
    long long v107 = (void *)MEMORY[0x263EFF9A0];
    long long v108 = [v17 nestedPresetPickers];
    v170 = objc_msgSend(v107, "dictionaryWithCapacity:", objc_msgSend(v108, "count"));

    [v17 nestedPresetPickers];
    long long v177 = 0u;
    long long v178 = 0u;
    long long v179 = 0u;
    long long v180 = 0u;
    id v172 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v109 = [v172 countByEnumeratingWithState:&v177 objects:v191 count:16];
    if (v109)
    {
      uint64_t v110 = v109;
      id v165 = *(id *)v178;
      do
      {
        for (uint64_t j = 0; j != v110; ++j)
        {
          if (*(id *)v178 != v165) {
            objc_enumerationMutation(v172);
          }
          uint64_t v112 = *(void *)(*((void *)&v177 + 1) + 8 * j);
          v113 = [v172 objectForKeyedSubscript:v112];
          v114 = [v32 sectionProvidersForCoreModelCategory:v113 platform:a4 modelManager:v18 pairingPickers:v146 editingColors:v158 colorDefaultsProvider:v167 previousSectionMap:v147 imageProvider:v160 colorLayerProvider:v159 stickerRenderer:0 configuration:v162 displayConditionEvaluator:0];
          v115 = [MEMORY[0x263EFF980] array];
          long long v173 = 0u;
          long long v174 = 0u;
          long long v175 = 0u;
          long long v176 = 0u;
          id v116 = v114;
          uint64_t v117 = [v116 countByEnumeratingWithState:&v173 objects:v190 count:16];
          if (v117)
          {
            uint64_t v118 = v117;
            uint64_t v119 = *(void *)v174;
            do
            {
              for (uint64_t k = 0; k != v118; ++k)
              {
                if (*(void *)v174 != v119) {
                  objc_enumerationMutation(v116);
                }
                v121 = [*(id *)(*((void *)&v173 + 1) + 8 * k) sections];
                [v115 addObjectsFromArray:v121];
              }
              uint64_t v118 = [v116 countByEnumeratingWithState:&v173 objects:v190 count:16];
            }
            while (v118);
          }

          [v170 setObject:v115 forKeyedSubscript:v112];
          id v18 = v161;
          id v32 = a1;
        }
        uint64_t v110 = [v172 countByEnumeratingWithState:&v177 objects:v191 count:16];
      }
      while (v110);
    }
    v122 = [v18 editorState];
    id v17 = v141;
    v123 = [v141 identifier];
    BOOL v124 = [v122 enabledMulticolorSubpickersIndexForMulticolorPickerIdentifier:v123] > 0;

    v125 = v140;
    v126 = +[AVTAvatarUpdaterFactory updaterForAggregatingUpdaters:v140];
    v127 = +[AVTAvatarUpdaterFactory updaterForAggregatingUpdaters:v136];
    v128 = +[AVTAvatarAttributeEditorSectionSupplementalPicker pickerForMulticolorPicker:v141 isMultipleSelected:v124 switchToSingleColorAvatarUpdater:v126 switchToMultipleColorAvatarUpdater:v127];
    long long v106 = v148;
    if (v128)
    {
      v129 = [v148 objectAtIndexedSubscript:0];
      [v129 setSupplementalPicker:v128];
    }
    v130 = [AVTAvatarAttributeEditorMulticolorSectionProvider alloc];
    v131 = [v141 identifier];
    v132 = [v141 title];
    v133 = v139;
    v166 = [(AVTAvatarAttributeEditorMulticolorSectionProvider *)v130 initWithIdentifier:v131 localizedName:v132 subpickers:v148 subpickerRemovalUpdaters:v140 nestedPresetPickers:v170 supplementalPicker:v128 pickerItems:v139 editorState:v122];
  }
  else
  {
    v166 = 0;
    v133 = v139;
    v125 = v140;
  }

  return v166;
}

uint64_t __228__AVTAvatarAttributeEditorModelBuilder_multicolorSectionProviderForCoreMulticolorPicker_platform_configuration_imageProvider_colorLayerProvider_editingColors_colorDefaultsProvider_modelManager_previousSectionMap_pairingPickers___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isSelected];
}

void __228__AVTAvatarAttributeEditorModelBuilder_multicolorSectionProviderForCoreMulticolorPicker_platform_configuration_imageProvider_colorLayerProvider_editingColors_colorDefaultsProvider_modelManager_previousSectionMap_pairingPickers___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    v2 = [*(id *)(a1 + 32) editorState];
    uint64_t v3 = *(void *)(a1 + 48);
    v4 = [*(id *)(a1 + 40) identifier];
    [v2 setEnabledMulticolorSubpickersIndex:v3 forMulticolorPickerIdentifier:v4];
  }
  id v7 = [*(id *)(a1 + 32) editorState];
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = [*(id *)(a1 + 40) identifier];
  [v7 setSelectedMulticolorSubpickersIndex:v5 forMulticolorPickerIdentifier:v6];
}

uint64_t __228__AVTAvatarAttributeEditorModelBuilder_multicolorSectionProviderForCoreMulticolorPicker_platform_configuration_imageProvider_colorLayerProvider_editingColors_colorDefaultsProvider_modelManager_previousSectionMap_pairingPickers___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 isSelected];
}

+ (id)subtitleFromSubtitles:(id)a3 forIndex:(int64_t)a4 enabledIndex:(int64_t)a5
{
  id v7 = a3;
  uint64_t v8 = v7;
  if (v7 && [v7 count])
  {
    v9 = [v8 objectAtIndexedSubscript:a5];
    v10 = [NSNumber numberWithInteger:a4];
    v11 = [v9 objectForKeyedSubscript:v10];

    id v12 = v11;
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

+ (id)selectedPresetForCoreModelColorsPicker:(id)a3 isEnabled:(BOOL)a4 fallbackToColorsPicker:(id)a5 colorDefaultsProvider:(id)a6 modelManager:(id)a7
{
  BOOL v10 = a4;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  long long v15 = [v14 colorsState];
  id v16 = objc_msgSend(v15, "selectedColorPresetForCategory:destinationIndex:", objc_msgSend(v11, "colorCategory"), objc_msgSend(v11, "destination"));

  id v17 = [v14 colorsState];
  id v18 = objc_msgSend(v17, "selectedColorPresetForCategory:destinationIndex:", objc_msgSend(v12, "colorCategory"), objc_msgSend(v12, "destination"));

  if (!v16 && v10)
  {
    id v40 = v13;
    uint64_t v19 = [v11 destination];
    uint64_t v20 = [v11 colorCategory];
    id v21 = [v14 avatarConfiguration];
    id v22 = objc_msgSend(v21, "colorPresetForSettingKind:", v19, v20);

    id v23 = [v18 name];
    id v24 = [v22 colorPreset];
    uint64_t v25 = [v24 name];
    if ([v23 isEqual:v25])
    {
      [v18 variation];
      float v27 = v26;
      uint64_t v28 = [v22 colorPreset];
      [v28 variation];
      float v30 = v29;

      if (v27 == v30)
      {
        id v16 = 0;
LABEL_8:
        id v13 = v40;

        goto LABEL_9;
      }
    }
    else
    {
    }
    id v16 = [v22 colorPreset];
    goto LABEL_8;
  }
LABEL_9:
  if (!v16 && v10)
  {
    uint64_t v31 = [v11 colorCategory];
    uint64_t v32 = AVTAvatarSettingColorIndexForColorDestination([v11 destination]);
    uint64_t v33 = [v14 avatarConfiguration];
    id v16 = [v13 defaultColorPresetForCategory:v31 destination:v32 withConfiguration:v33];
  }
  if (v12 && !v16)
  {
    uint64_t v34 = [v14 colorsState];
    v35 = objc_msgSend(v34, "selectedColorPresetForCategory:destinationIndex:", objc_msgSend(v12, "colorCategory"), objc_msgSend(v12, "destination"));

    uint64_t v36 = (void *)MEMORY[0x263F29678];
    uint64_t v37 = [v35 name];
    uint64_t v38 = [v11 colorCategory];
    [v35 variation];
    id v16 = objc_msgSend(v36, "colorPresetWithName:category:variation:", v37, v38);
  }
  return v16;
}

+ (id)sectionColorItemsForColors:(id)a3 selectedPreset:(id)a4 configuration:(id)a5 modelManager:(id)a6 additionalUpdateKind:(id)a7 imageProvider:(id)a8 colorLayerProvider:(id)a9 pairedCategory:(int64_t)a10 editingColors:(id)a11
{
  int64_t var1 = a7.var1;
  int64_t var0 = a7.var0;
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v43 = a4;
  id v42 = a5;
  id v46 = a6;
  id v40 = a8;
  id v39 = a9;
  id v38 = a11;
  id v41 = [MEMORY[0x263EFF980] array];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  obuint64_t j = v14;
  uint64_t v44 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
  if (v44)
  {
    uint64_t v36 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v44; ++i)
      {
        if (*(void *)v48 != v36) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        id v17 = [v46 colorsState];
        id v18 = [v17 variationStore];
        uint64_t v19 = [v18 colorPresetFromColor:v16];

        uint64_t v20 = AVTColorSettingKind(0, 0);
        id v22 = objc_msgSend(v42, "colorPresetForSettingKind:", v20, v21);
        id v23 = [v22 colorPreset];
        char v45 = [v19 isEqual:v43];
        id v24 = 0;
        if (a10 != 40)
        {
          uint64_t v25 = (void *)[v16 copyForPairedCategory:a10];
          uint64_t v51 = v25;
          id v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v51 count:1];
        }
        if (var1 == 40)
        {
          float v26 = 0;
          float v27 = v38;
        }
        else
        {
          uint64_t v28 = [v19 name];
          float v27 = v38;
          float v26 = objc_msgSend(v38, "colorForSettingKind:identifier:", var0, var1, v28);
        }
        float v29 = [v46 colorsState];
        float v30 = +[AVTAvatarUpdaterFactory updaterForColor:v16 colorsState:v29 pairedColors:v24 additionalColor:v26];

        LOBYTE(v33) = v45;
        uint64_t v31 = -[AVTAvatarAttributeEditorSectionColorItem initWithColor:skinColor:imageProvider:colorLayerProvider:avatarUpdater:derivedColorDependent:selected:]([AVTAvatarAttributeEditorSectionColorItem alloc], "initWithColor:skinColor:imageProvider:colorLayerProvider:avatarUpdater:derivedColorDependent:selected:", v16, v23, v40, v39, v30, [v27 colorHasDerivedColorDependency:v16], v33);
        [v41 addObject:v31];
      }
      uint64_t v44 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
    }
    while (v44);
  }

  return v41;
}

+ (id)sectionForModelRow:(id)a3 fromModelPresets:(id)a4 selectedModelPreset:(id)a5 tagSelection:(id)a6 fixedTags:(id)a7 availableTags:(id)a8 category:(int64_t)a9 imageProvider:(id)a10 stickerRenderer:(id)a11 configuration:(id)a12 previousSection:(id)a13 pairedCategory:(int64_t)a14
{
  uint64_t v109 = *MEMORY[0x263EF8340];
  id v19 = a3;
  id v20 = a4;
  id v93 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a8;
  id v86 = a10;
  id v88 = a11;
  id v92 = a12;
  id v24 = a13;
  uint64_t v25 = [MEMORY[0x263EFF980] array];
  float v26 = [v19 representedTags];
  float v27 = [v19 options];
  v82 = v21;
  uint64_t v83 = v20;
  uint64_t v80 = v23;
  id v81 = v22;
  uint64_t v28 = objc_msgSend(a1, "filterPresets:forRowRepresentingTags:currentTagSelection:fixedTags:availableTags:sortingOption:", v20, v26, v21, v22, v23, objc_msgSend(v27, "sortingOption"));

  float v29 = (void *)MEMORY[0x263EFF9A0];
  float v30 = [v24 sectionItems];
  v96 = objc_msgSend(v29, "dictionaryWithCapacity:", objc_msgSend(v30, "count"));

  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  unsigned int v79 = v24;
  uint64_t v31 = [v24 sectionItems];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v103 objects:v108 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v104;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v104 != v34) {
          objc_enumerationMutation(v31);
        }
        uint64_t v36 = *(void **)(*((void *)&v103 + 1) + 8 * i);
        uint64_t v37 = [v36 identifier];
        [v96 setObject:v36 forKeyedSubscript:v37];
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v103 objects:v108 count:16];
    }
    while (v33);
  }

  uint64_t v85 = [(id)objc_opt_class() framingModeForRow:v19 selectedPreset:v93];
  int64_t v38 = a14;
  if (a14 == 40)
  {
    BOOL v78 = 0;
  }
  else
  {
    id v39 = [v19 pairing];
    BOOL v78 = v39 != 0;
  }
  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  obuint64_t j = v28;
  uint64_t v94 = [obj countByEnumeratingWithState:&v99 objects:v107 count:16];
  if (v94)
  {
    uint64_t v89 = *(void *)v100;
    id v90 = v25;
    id v91 = v19;
    do
    {
      for (uint64_t j = 0; j != v94; ++j)
      {
        if (*(void *)v100 != v89) {
          objc_enumerationMutation(obj);
        }
        id v41 = *(void **)(*((void *)&v99 + 1) + 8 * j);
        id v42 = [v41 identifier];
        uint64_t v95 = [v96 objectForKeyedSubscript:v42];

        id v43 = [v19 options];
        uint64_t v44 = [v43 stickerConfiguration];

        char v45 = [v19 options];
        id v46 = [v45 presetOverrides];
        long long v47 = [v19 options];
        long long v48 = v47;
        if (v44)
        {
          long long v49 = [v47 stickerConfiguration];
          v97 = [v88 scheduledStickerResourceProviderForThumbnailForModelPreset:v41 presetOverrides:v46 avatarConfiguration:v92 stickerConfiguration:v49 correctClipping:0];
          long long v50 = 0;
        }
        else
        {
          long long v49 = [v47 poseOverride];
          long long v50 = [v86 providerForThumbnailForModelPreset:v41 presetOverrides:v46 poseOverride:v49 avatarConfiguration:v92 framingMode:v85];
          v97 = 0;
        }

        uint64_t v51 = [v41 identifier];
        id v52 = [v93 identifier];
        char v53 = [v51 isEqual:v52];

        id v54 = [v19 options];
        id v55 = [v54 framingMode];
        +[AVTRenderingScope thumbnailHeightRatioForFramingMode:v55];
        double v57 = v56;

        if (v38 == 40) {
          id v58 = 0;
        }
        else {
          id v58 = (void *)[v41 copyForPairedCategory:v38];
        }
        uint64_t v59 = +[AVTAvatarUpdaterFactory updaterForPreset:v41 pairedPreset:v58];
        v98[0] = MEMORY[0x263EF8330];
        v98[1] = 3221225472;
        v98[2] = __217__AVTAvatarAttributeEditorModelBuilder_sectionForModelRow_fromModelPresets_selectedModelPreset_tagSelection_fixedTags_availableTags_category_imageProvider_stickerRenderer_configuration_previousSection_pairedCategory___block_invoke;
        v98[3] = &unk_263FF29B8;
        v98[4] = v41;
        v60 = (void *)MEMORY[0x210530210](v98);
        if (v38 == 40) {
          [v41 localizedName];
        }
        else {
        long long v61 = [v41 localizedPairedName];
        }
        long long v62 = [AVTAvatarAttributeEditorSectionItem alloc];
        long long v63 = [v41 identifier];
        long long v64 = (void *)[v60 copy];
        LOBYTE(v77) = v53;
        uint64_t v65 = [(AVTAvatarAttributeEditorSectionItem *)v62 initWithIdentifier:v63 localizedName:v61 thumbnailProvider:v50 stickerResourceProvider:v97 presetResourcesProvider:v64 avatarUpdater:v59 heightRatio:v57 selected:v77];

        long long v66 = [v95 cachedThumbnail];

        if (v66)
        {
          long long v67 = [v95 cachedThumbnail];
          [(AVTAvatarAttributeEditorSectionItem *)v65 setCachedThumbnail:v67];
        }
        uint64_t v25 = v90;
        [v90 addObject:v65];

        id v19 = v91;
        int64_t v38 = a14;
      }
      uint64_t v94 = [obj countByEnumeratingWithState:&v99 objects:v107 count:16];
    }
    while (v94);
  }

  if (v78)
  {
    long long v68 = [v19 pairing];
    v69 = [v68 localizedPairedTitle];
  }
  else
  {
    v69 = [v19 title];
  }
  id v70 = [v19 options];
  unint64_t v71 = [a1 sectionOptionFromModelOptions:v70];

  if ((unint64_t)[v25 count] < 2)
  {
    uint64_t v75 = 0;
  }
  else
  {
    uint64_t v72 = [(id)objc_opt_class() destinationForPresetCategory:a9 isPaired:v78];
    long long v73 = [AVTAvatarAttributeEditorSection alloc];
    long long v74 = [v19 identifier];
    uint64_t v75 = [(AVTAvatarAttributeEditorSection *)v73 initWithSectionItems:v25 localizedName:v69 identifier:v74 intendedDestination:v72 options:v71];
  }
  return v75;
}

AVTPresetResources *__217__AVTAvatarAttributeEditorModelBuilder_sectionForModelRow_fromModelPresets_selectedModelPreset_tagSelection_fixedTags_availableTags_category_imageProvider_stickerRenderer_configuration_previousSection_pairedCategory___block_invoke(uint64_t a1)
{
  v2 = [AVTPresetResources alloc];
  uint64_t v3 = [*(id *)(a1 + 32) preset];
  v4 = [(AVTPresetResources *)v2 initWithPreset:v3];

  return v4;
}

+ (unint64_t)sectionDisplayModeForCoreModelDisplayMode:(unint64_t)a3
{
  return a3 == 1;
}

+ (id)framingModeForRow:(id)a3 selectedPreset:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v27 = a4;
  id v6 = [v5 options];
  id v7 = [v6 framingMode];

  uint64_t v8 = [v5 options];
  v9 = [v8 framingModeOverrides];

  if (v9)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    BOOL v10 = [v9 orderedTags];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (!v11)
    {
LABEL_13:

      goto LABEL_15;
    }
    uint64_t v12 = v11;
    id v23 = v9;
    id v24 = v7;
    id v25 = v5;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v29;
    uint64_t v15 = -1;
    int v16 = 1;
    do
    {
      id v17 = v10;
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(v17);
        }
        uint64_t v19 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        id v20 = [v27 tags];
        int v21 = [a1 scoreForTags:v19 forCombination:v19 currentSelection:v20];

        if (v21 > v16)
        {
          int v16 = v21;
          uint64_t v15 = v13 + i;
        }
      }
      v13 += v12;
      BOOL v10 = v17;
      uint64_t v12 = [v17 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v12);

    id v5 = v25;
    if ((v15 & 0x8000000000000000) == 0)
    {
      v9 = v23;
      BOOL v10 = [v23 orderedFramingModeOverrides];
      id v7 = [v10 objectAtIndexedSubscript:v15];

      goto LABEL_13;
    }
    v9 = v23;
    id v7 = v24;
  }
LABEL_15:

  return v7;
}

+ (id)filterPresets:(id)a3 forRowRepresentingTags:(id)a4 currentTagSelection:(id)a5 fixedTags:(id)a6 availableTags:(id)a7 sortingOption:(unint64_t)a8
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (v15)
  {
    id v43 = [MEMORY[0x263EFF980] array];
    id v41 = v15;
    id v39 = v18;
    uint64_t v19 = [a1 tagCombinationsForTagNames:v15 availableTags:v18];
    id v40 = v16;
    if (v16) {
      id v20 = v16;
    }
    else {
      id v20 = (void *)MEMORY[0x263EFFA78];
    }
    id v52 = (void *)[v20 mutableCopy];
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    obuint64_t j = v19;
    uint64_t v48 = [obj countByEnumeratingWithState:&v57 objects:v62 count:16];
    if (v48)
    {
      uint64_t v44 = *(void *)v58;
      unint64_t v45 = a8;
      id v46 = v17;
      id v47 = v14;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v58 != v44) {
            objc_enumerationMutation(obj);
          }
          uint64_t v50 = v21;
          id v22 = *(void **)(*((void *)&v57 + 1) + 8 * v21);
          uint64_t v23 = [v22 mutableCopy];
          [a1 setTags:v17 onMutableTagSet:v23];
          long long v49 = (void *)v23;
          id v24 = [a1 filterPresets:v14 matchingTagValues:v23 sortedUsing:a8];
          id v25 = [v24 firstObject];
          long long v53 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          id v51 = v24;
          uint64_t v26 = [v51 countByEnumeratingWithState:&v53 objects:v61 count:16];
          if (v26)
          {
            uint64_t v27 = v26;
            int v28 = 0;
            uint64_t v29 = *(void *)v54;
            do
            {
              for (uint64_t i = 0; i != v27; ++i)
              {
                if (*(void *)v54 != v29) {
                  objc_enumerationMutation(v51);
                }
                long long v31 = *(void **)(*((void *)&v53 + 1) + 8 * i);
                uint64_t v32 = [v31 tags];
                id v33 = a1;
                int v34 = [a1 scoreForTags:v32 forCombination:v22 currentSelection:v52];

                if (v34 > v28)
                {
                  id v35 = v31;

                  int v28 = v34;
                  id v25 = v35;
                }
                a1 = v33;
              }
              uint64_t v27 = [v51 countByEnumeratingWithState:&v53 objects:v61 count:16];
            }
            while (v27);
          }

          if (v25 && ([v43 containsObject:v25] & 1) == 0)
          {
            [v43 addObject:v25];
            uint64_t v36 = [v25 tags];
            [a1 addTags:v36 toMutableTagSet:v52];
          }
          uint64_t v21 = v50 + 1;
          id v14 = v47;
          a8 = v45;
          id v17 = v46;
        }
        while (v50 + 1 != v48);
        uint64_t v48 = [obj countByEnumeratingWithState:&v57 objects:v62 count:16];
      }
      while (v48);
    }

    uint64_t v37 = (void *)[v43 copy];
    id v16 = v40;
    id v15 = v41;
    id v18 = v39;
  }
  else
  {
    uint64_t v37 = [a1 filterPresets:v14 matchingTagValues:v17 sortedUsing:a8];
  }

  return v37;
}

+ (id)tagCombinationsForTagNames:(id)a3 availableTags:(id)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    uint64_t v8 = [v6 firstObject];
    id v33 = [v7 objectForKeyedSubscript:v8];
    v9 = [MEMORY[0x263EFF980] array];
    id v30 = v6;
    BOOL v10 = (void *)[v6 mutableCopy];
    objc_msgSend(v10, "removeObjectsInRange:", 0, 1);
    int v28 = v10;
    uint64_t v11 = (void *)[v10 copy];
    id v29 = v7;
    uint64_t v12 = [a1 tagCombinationsForTagNames:v11 availableTags:v7];

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    obuint64_t j = v12;
    uint64_t v34 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v34)
    {
      uint64_t v32 = *(void *)v41;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v41 != v32) {
            objc_enumerationMutation(obj);
          }
          uint64_t v35 = v13;
          id v14 = *(void **)(*((void *)&v40 + 1) + 8 * v13);
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          id v15 = v33;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v36 objects:v44 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v37;
            do
            {
              for (uint64_t i = 0; i != v17; ++i)
              {
                if (*(void *)v37 != v18) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v20 = *(void *)(*((void *)&v36 + 1) + 8 * i);
                uint64_t v21 = (void *)[v14 mutableCopy];
                id v22 = [MEMORY[0x263EFF9B0] orderedSetWithObject:v20];
                [v21 setObject:v22 forKeyedSubscript:v8];

                [v9 addObject:v21];
                if ([v14 count])
                {
                  uint64_t v23 = NSDictionary;
                  id v24 = [MEMORY[0x263EFF9D8] orderedSetWithObject:v20];
                  id v25 = [v23 dictionaryWithObject:v24 forKey:v8];

                  [v9 addObject:v25];
                }
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v36 objects:v44 count:16];
            }
            while (v17);
          }

          if ([v14 count]) {
            [v9 addObject:v14];
          }
          uint64_t v13 = v35 + 1;
        }
        while (v35 + 1 != v34);
        uint64_t v34 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
      }
      while (v34);
    }

    uint64_t v26 = (void *)[v9 copy];
    id v7 = v29;
    id v6 = v30;
  }
  else
  {
    uint64_t v26 = &unk_26BF4D630;
  }

  return v26;
}

+ (id)tagSetByRemovingTagNames:(id)a3 fromTagSet:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void *)[a4 mutableCopy];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(v6, "removeObjectForKey:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  uint64_t v12 = (void *)[v6 copy];
  return v12;
}

+ (id)filterPresets:(id)a3 matchingTagValues:(id)a4 sortedUsing:(unint64_t)a5
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v31 = a4;
  id v25 = [MEMORY[0x263EFF980] array];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obuint64_t j = v6;
  uint64_t v28 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v28)
  {
    uint64_t v27 = *(void *)v37;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v37 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = v7;
        uint64_t v8 = *(void **)(*((void *)&v36 + 1) + 8 * v7);
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v30 = [v31 allKeys];
        uint64_t v9 = [v30 countByEnumeratingWithState:&v32 objects:v40 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v33;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v33 != v11) {
                objc_enumerationMutation(v30);
              }
              uint64_t v13 = *(void *)(*((void *)&v32 + 1) + 8 * i);
              long long v14 = [v8 tags];
              uint64_t v15 = [v14 objectForKeyedSubscript:v13];
              if (v15)
              {
                long long v16 = (void *)v15;
                long long v17 = [v8 tags];
                uint64_t v18 = [v17 objectForKeyedSubscript:v13];
                uint64_t v19 = [v31 objectForKeyedSubscript:v13];
                int v20 = [v18 intersectsOrderedSet:v19];

                if (!v20)
                {

                  goto LABEL_18;
                }
              }
              else
              {
              }
            }
            uint64_t v10 = [v30 countByEnumeratingWithState:&v32 objects:v40 count:16];
          }
          while (v10);
        }

        [a1 insertPreset:v8 intoList:v25 forSortingOption:a5];
LABEL_18:
        uint64_t v7 = v29 + 1;
      }
      while (v29 + 1 != v28);
      uint64_t v28 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v28);
  }

  uint64_t v21 = (void *)[v25 copy];
  return v21;
}

+ (void)insertPreset:(id)a3 intoList:(id)a4 forSortingOption:(unint64_t)a5
{
  id v8 = a3;
  id v7 = a4;
  if (a5 == 1 || a5 == 2 && [v8 isDefaultPreset]) {
    [v7 insertObject:v8 atIndex:0];
  }
  else {
    [v7 addObject:v8];
  }
}

+ (int)scoreForTags:(id)a3 forCombination:(id)a4 currentSelection:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v9 = [a4 allKeys];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (!v10)
  {
LABEL_19:

    goto LABEL_20;
  }
  char v11 = 0;
  uint64_t v12 = *(void *)v30;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v30 != v12) {
        objc_enumerationMutation(v9);
      }
      long long v14 = [v7 objectForKeyedSubscript:*(void *)(*((void *)&v29 + 1) + 8 * i)];
      BOOL v15 = v14 != 0;

      v11 |= v15;
    }
    uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
  }
  while (v10);

  if (v11)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v9 = objc_msgSend(v7, "allKeys", 0);
    uint64_t v16 = [v9 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v26;
      LODWORD(v10) = 1;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v26 != v18) {
            objc_enumerationMutation(v9);
          }
          uint64_t v20 = *(void *)(*((void *)&v25 + 1) + 8 * j);
          uint64_t v21 = [v7 objectForKeyedSubscript:v20];
          id v22 = (void *)[v21 mutableCopy];

          uint64_t v23 = [v8 objectForKeyedSubscript:v20];
          [v22 intersectOrderedSet:v23];

          uint64_t v10 = [v22 count] + (int)v10;
        }
        uint64_t v17 = [v9 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v17);
    }
    else
    {
      LODWORD(v10) = 1;
    }
    goto LABEL_19;
  }
  LODWORD(v10) = 0;
LABEL_20:

  return v10;
}

+ (void)addTags:(id)a3 toMutableTagSet:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__AVTAvatarAttributeEditorModelBuilder_addTags_toMutableTagSet___block_invoke;
  v7[3] = &unk_263FF1660;
  id v8 = v5;
  id v6 = v5;
  [a3 enumerateKeysAndObjectsUsingBlock:v7];
}

void __64__AVTAvatarAttributeEditorModelBuilder_addTags_toMutableTagSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];

  if (!v6)
  {
    id v7 = (void *)[v5 mutableCopy];
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v8];
  }
}

+ (void)setTags:(id)a3 onMutableTagSet:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__AVTAvatarAttributeEditorModelBuilder_setTags_onMutableTagSet___block_invoke;
  v7[3] = &unk_263FF1660;
  id v8 = v5;
  id v6 = v5;
  [a3 enumerateKeysAndObjectsUsingBlock:v7];
}

void __64__AVTAvatarAttributeEditorModelBuilder_setTags_onMutableTagSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = (id)[a3 mutableCopy];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

+ (id)tagSetForTagNames:(id)a3 inTagSet:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263EFF9A0] dictionary];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        long long v14 = objc_msgSend(v6, "objectForKeyedSubscript:", v13, (void)v18);
        BOOL v15 = (void *)[v14 mutableCopy];
        [v7 setObject:v15 forKeyedSubscript:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  uint64_t v16 = (void *)[v7 copy];
  return v16;
}

+ (id)firstColorSectionInSections:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 indexOfObjectPassingTest:&__block_literal_global_40];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [v3 objectAtIndex:v4];
  }

  return v5;
}

uint64_t __68__AVTAvatarAttributeEditorModelBuilder_firstColorSectionInSections___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (id)sectionOptionFromModelOptions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(a1, "sectionDisplayModeForCoreModelDisplayMode:", objc_msgSend(v4, "displayMode"));
  id v6 = [AVTAvatarAttributeEditorSectionOptions alloc];
  id v7 = [v4 framingMode];
  id v8 = [v4 poseOverride];
  uint64_t v9 = [v4 presetOverrides];
  uint64_t v10 = [v4 stickerConfiguration];
  uint64_t v11 = [v4 showsLabel];

  uint64_t v12 = [(AVTAvatarAttributeEditorSectionOptions *)v6 initWithFramingMode:v7 poseOverride:v8 presetOverrides:v9 displayMode:v5 stickerConfiguration:v10 showsLabel:v11];
  return v12;
}

@end