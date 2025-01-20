@interface AVTEditingModelDefinitionsParser
+ (id)dataFromAvatarKit;
+ (id)dataFromBundle;
+ (id)errorWithDescription:(id)a3 underlyingError:(id)a4;
+ (id)localizedString:(id)a3;
+ (id)platformDictionaryKeyForPlatform:(unint64_t)a3;
+ (id)sortedModelRows:(id)a3 forPlatform:(unint64_t)a4;
+ (unint64_t)defaultSortingOptionForPlatform:(unint64_t)a3;
- (AVTEditingModelColors)colorCache;
- (AVTEditingModelDefinitionsParser)initWithPlistData:(id)a3 forPlatform:(unint64_t)a4 logger:(id)a5;
- (AVTUILogger)logger;
- (BOOL)validateForCategoryWithEnumValue:(id)a3 pickers:(id)a4;
- (BOOL)validateForColorPicker:(id)a3 colorPaletteCategory:(id)a4 error:(id *)a5;
- (BOOL)validateForMulticolorPicker:(id)a3 subpickers:(id)a4 error:(id *)a5;
- (NSData)plistData;
- (NSDictionary)colorPickersDefinitions;
- (NSDictionary)multicolorPickersDefinitions;
- (NSDictionary)neutralMemojiPresetsIdentifierPerCategory;
- (NSDictionary)presetPickersDefinitions;
- (NSError)error;
- (NSString)platformDictionaryKey;
- (id)applyPlatformOverrideForDictionary:(id)a3;
- (id)coreModelCategoryFromCategoryDictionary:(id)a3;
- (id)coreModelCategoryFromCategoryDictionary:(id)a3 parsedPickerKeys:(id)a4;
- (id)coreModelColorsForColorDefinitions:(id)a3 paletteSettingKind:(id)a4;
- (id)coreModelColorsForPaletteSettingKind:(id)a3;
- (id)coreModelColorsRowForColorPickerDictionary:(id)a3 settingDestination:(int64_t)a4 inCategory:(int64_t)a5 defaultOptions:(id)a6;
- (id)coreModelGroupFromGroupDictionary:(id)a3;
- (id)coreModelMulticolorPickerForDictionary:(id)a3 groupPickerCategory:(int64_t)a4 defaultOptions:(id)a5 parsedPickerKeys:(id)a6 error:(id *)a7;
- (id)coreModelPresetsForCategory:(int64_t)a3;
- (id)coreModelRowFromRowDictionary:(id)a3 availableTags:(id)a4 usedTags:(id)a5 defaultOptions:(id)a6;
- (id)coreModelRowOptionsFromOptionsDictionary:(id)a3;
- (id)decodePropertyListObjects:(id)a3;
- (id)gatherAllTagsFromPresets:(id)a3;
- (id)initForPlatform:(unint64_t)a3 withLogger:(id)a4;
- (id)localizedSubtitlesForSubtitles:(id)a3 subpickerCount:(int64_t)a4;
- (id)multicolorAuxiliaryPickerForDictionary:(id)a3 error:(id *)a4;
- (id)neutralMemojiPresetIdentifierForCategory:(int64_t)a3;
- (id)pairingFromDictionary:(id)a3;
- (id)parseCoreModelFromGroupsDefinitions:(id)a3 colorDefaultsDefinitions:(id)a4;
- (id)symbolNamesFromGroupDictionary:(id)a3;
- (unint64_t)platform;
- (void)initalizeColorCacheIfNeeded;
- (void)parseWithCompletionHandler:(id)a3;
- (void)setColorCache:(id)a3;
- (void)setColorPickersDefinitions:(id)a3;
- (void)setError:(id)a3;
- (void)setMulticolorPickersDefinitions:(id)a3;
- (void)setNeutralMemojiPresetsIdentifierPerCategory:(id)a3;
- (void)setPresetPickersDefinitions:(id)a3;
@end

@implementation AVTEditingModelDefinitionsParser

+ (id)errorWithDescription:(id)a3 underlyingError:(id)a4
{
  id v5 = a4;
  v6 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithObjectsAndKeys:", *MEMORY[0x263F08320], a3, 0);
  v7 = v6;
  if (v5) {
    [v6 setObject:*MEMORY[0x263F08608] forKey:v5];
  }
  v8 = [MEMORY[0x263F29748] errorWithCode:415 userInfo:v7];

  return v8;
}

+ (id)dataFromAvatarKit
{
  if (AVTPrereleaseCategoriesEnabled()) {
    AVTPrereleaseEditorMetadata();
  }
  else {
  v2 = AVTEditorMetadata();
  }
  return v2;
}

+ (id)dataFromBundle
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [v2 pathForResource:@"editor" ofType:@"plist"];

  if (!v3)
  {
    v4 = [MEMORY[0x263F08AB0] processInfo];
    id v5 = [v4 environment];
    v6 = [v5 objectForKeyedSubscript:@"AVT_RESOURCES_BASE_PATH"];

    v3 = [v6 stringByAppendingPathComponent:@"editor.plist"];
  }
  v7 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v3];

  return v7;
}

+ (id)platformDictionaryKeyForPlatform:(unint64_t)a3
{
  return (id)kAVTEditingModelDefinitionsPlatformiOSKey;
}

+ (id)sortedModelRows:(id)a3 forPlatform:(unint64_t)a4
{
  id v4 = a3;
  return v4;
}

+ (unint64_t)defaultSortingOptionForPlatform:(unint64_t)a3
{
  return 0;
}

+ (id)localizedString:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = AVTLocalizedEditorString();
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)initForPlatform:(unint64_t)a3 withLogger:(id)a4
{
  id v6 = a4;
  int v7 = AVTUIUseLocalEditorModel_once();
  v8 = objc_opt_class();
  if (v7) {
    [v8 dataFromBundle];
  }
  else {
  v9 = [v8 dataFromAvatarKit];
  }
  v10 = [(AVTEditingModelDefinitionsParser *)self initWithPlistData:v9 forPlatform:a3 logger:v6];

  return v10;
}

- (AVTEditingModelDefinitionsParser)initWithPlistData:(id)a3 forPlatform:(unint64_t)a4 logger:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)AVTEditingModelDefinitionsParser;
  v11 = [(AVTEditingModelDefinitionsParser *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_plistData, a3);
    v12->_platform = a4;
    uint64_t v13 = [(id)objc_opt_class() platformDictionaryKeyForPlatform:a4];
    platformDictionaryKey = v12->_platformDictionaryKey;
    v12->_platformDictionaryKey = (NSString *)v13;

    objc_storeStrong((id *)&v12->_logger, a5);
  }

  return v12;
}

- (void)parseWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, id, void *))a3;
  id v5 = [(AVTEditingModelDefinitionsParser *)self plistData];
  if (!v5) {
    [MEMORY[0x263EFF940] raise:@"MissingPlistData" format:@"Unable to get data for the plist from AvatarKit"];
  }
  id v6 = [(AVTEditingModelDefinitionsParser *)self decodePropertyListObjects:v5];
  int v7 = v6;
  if (v6)
  {
    v8 = [v6 objectForKeyedSubscript:kAVTEditingModelDefinitionsGroupsKey];
    id v9 = [v7 objectForKeyedSubscript:kAVTEditingModelDefinitionsColorDefaultsKey];
    id v10 = [v7 objectForKeyedSubscript:kAVTEditingModelDefinitionsColorPickersKey];
    [(AVTEditingModelDefinitionsParser *)self setColorPickersDefinitions:v10];

    v11 = [v7 objectForKeyedSubscript:kAVTEditingModelDefinitionsPresetPickersKey];
    [(AVTEditingModelDefinitionsParser *)self setPresetPickersDefinitions:v11];

    v12 = [v7 objectForKeyedSubscript:kAVTEditingModelDefinitionsMulticolorPickersKey];
    [(AVTEditingModelDefinitionsParser *)self setMulticolorPickersDefinitions:v12];

    id v14 = [(AVTEditingModelDefinitionsParser *)self parseCoreModelFromGroupsDefinitions:v8 colorDefaultsDefinitions:v9];
  }
  else
  {
    id v14 = 0;
  }
  uint64_t v13 = [(AVTEditingModelDefinitionsParser *)self error];
  v4[2](v4, v14, v13);
}

- (id)decodePropertyListObjects:(id)a3
{
  id v12 = 0;
  id v4 = [MEMORY[0x263F08AC0] propertyListWithData:a3 options:0 format:0 error:&v12];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = v12;
    v8 = [(AVTEditingModelDefinitionsParser *)self logger];
    id v9 = [v7 localizedDescription];
    [v8 logParsingMetadataDefinitionsError:v9];

    id v10 = [(id)objc_opt_class() errorWithDescription:@"Error deserializing plist" underlyingError:v7];

    [(AVTEditingModelDefinitionsParser *)self setError:v10];
  }

  return v5;
}

- (void)initalizeColorCacheIfNeeded
{
  id v3 = [(AVTEditingModelDefinitionsParser *)self colorCache];

  if (!v3)
  {
    id v4 = +[AVTEditingModelColors buildAllColors];
    [(AVTEditingModelDefinitionsParser *)self setColorCache:v4];
  }
}

- (id)parseCoreModelFromGroupsDefinitions:(id)a3 colorDefaultsDefinitions:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    [(AVTEditingModelDefinitionsParser *)self initalizeColorCacheIfNeeded];
    id v29 = v7;
    if (v7
      && ([v7 objectForKeyedSubscript:kAVTEditingModelDefinitionsColorDefaultsMappingKey],
          (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0)
      && (id v9 = (void *)v8,
          [v7 objectForKeyedSubscript:kAVTEditingModelDefinitionsColorDefaultsDefinitionsKey],
          id v10 = objc_claimAutoreleasedReturnValue(),
          v10,
          v9,
          v10))
    {
      v11 = [AVTAvatarEditorColorDefaultsProvider alloc];
      id v12 = [(AVTEditingModelDefinitionsParser *)self colorCache];
      v28 = [(AVTAvatarEditorColorDefaultsProvider *)v11 initWithColorDefaultsDictionary:v7 editingColors:v12];
    }
    else
    {
      v28 = 0;
    }
    uint64_t v13 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v30 = v6;
    id v14 = v6;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v32 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [(AVTEditingModelDefinitionsParser *)self coreModelGroupFromGroupDictionary:*(void *)(*((void *)&v31 + 1) + 8 * i)];
          if (v19)
          {
            [v13 addObject:v19];
          }
          else
          {
            v20 = [(AVTEditingModelDefinitionsParser *)self logger];
            v21 = [(AVTEditingModelDefinitionsParser *)self error];
            v22 = [v21 description];
            [v20 logParsingMetadataDefinitionsError:v22];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v16);
    }

    v23 = [AVTCoreModel alloc];
    v24 = [(AVTEditingModelDefinitionsParser *)self colorCache];
    v25 = [(AVTCoreModel *)v23 initWithGroups:v13 colors:v24 colorDefaultsProvider:v28 forPlatform:[(AVTEditingModelDefinitionsParser *)self platform]];

    id v7 = v29;
    id v6 = v30;
  }
  else
  {
    v26 = [(id)objc_opt_class() errorWithDescription:@"Definitions must contain at least one group" underlyingError:0];
    [(AVTEditingModelDefinitionsParser *)self setError:v26];

    v25 = 0;
  }

  return v25;
}

- (id)coreModelGroupFromGroupDictionary:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v4 = [(AVTEditingModelDefinitionsParser *)self applyPlatformOverrideForDictionary:a3];
  id v5 = objc_opt_class();
  id v6 = [v4 objectForKeyedSubscript:kAVTEditingModelDefinitionsGroupNameKey];
  id v7 = [v5 localizedString:v6];

  if (v7 && [v7 length])
  {
    uint64_t v8 = [v4 objectForKeyedSubscript:kAVTEditingModelDefinitionsCategoriesKey];
    if (AVTPrereleaseCategoriesEnabled())
    {
      id v9 = [v4 objectForKeyedSubscript:kAVTEditingModelDefinitionsPrereleaseCategoriesKey];
      id v10 = v9;
      if (v9 && [v9 count])
      {
        id v11 = v10;

        uint64_t v8 = v11;
      }
    }
    if (v8 && [v8 count])
    {
      id v12 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v8, "count"));
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v13 = v8;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v39;
        while (2)
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v39 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = [(AVTEditingModelDefinitionsParser *)self coreModelCategoryFromCategoryDictionary:*(void *)(*((void *)&v38 + 1) + 8 * i)];
            if (!v18)
            {
              long long v34 = 0;
              goto LABEL_27;
            }
            v19 = (void *)v18;
            [v12 addObject:v18];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v38 objects:v42 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }

      id v13 = [(AVTEditingModelDefinitionsParser *)self symbolNamesFromGroupDictionary:v4];
      v20 = [v4 objectForKeyedSubscript:kAVTEditingModelDefinitionsPreviewModeKey];
      v21 = v20;
      if (v20)
      {
        v22 = [v20 objectForKeyedSubscript:kAVTEditingModelDefinitionsPreviewModeTypeKey];
        unint64_t v23 = +[AVTEditingPreviewMode previewModeTypeForString:v22];

        v24 = [v21 objectForKeyedSubscript:kAVTEditingModelDefinitionsPreviewModeOptionsKey];
        v37 = v24;
        uint64_t v25 = [v24 objectForKeyedSubscript:kAVTEditingModelDefinitionsPreviewModeOptionsCameraKey];
        v26 = (void *)v25;
        v27 = (void *)*MEMORY[0x263F295E0];
        if (v25) {
          v27 = (void *)v25;
        }
        id v28 = v27;

        id v29 = [v24 objectForKeyedSubscript:kAVTEditingModelDefinitionsPreviewModeOptionsBodyPosePackKey];
        id v30 = v21;
        long long v31 = [[AVTEditingPreviewModeOptions alloc] initWithFramingMode:v28 bodyPosePack:v29];

        long long v32 = [[AVTEditingPreviewMode alloc] initWithType:v23 options:v31];
        v21 = v30;
      }
      else
      {
        long long v32 = +[AVTEditingPreviewMode defaultPreviewMode];
      }
      long long v34 = [[AVTCoreModelGroup alloc] initWithName:v7 symbolNames:v13 previewMode:v32 categories:v12];

LABEL_27:
    }
    else
    {
      v35 = [(id)objc_opt_class() errorWithDescription:@"Group definitions must contain at least one category" underlyingError:0];
      [(AVTEditingModelDefinitionsParser *)self setError:v35];

      long long v34 = 0;
    }
  }
  else
  {
    long long v33 = [(id)objc_opt_class() errorWithDescription:@"Group definitions must contain a non-empty name" underlyingError:0];
    [(AVTEditingModelDefinitionsParser *)self setError:v33];

    long long v34 = 0;
  }

  return v34;
}

- (id)symbolNamesFromGroupDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:kAVTEditingModelDefinitionsGroupSymbolKey];
  if (v4)
  {
    id v5 = (void *)MEMORY[0x263EFF9A0];
    id v6 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:1];
    id v7 = [v5 dictionaryWithObject:v4 forKey:v6];

    uint64_t v8 = [v3 objectForKeyedSubscript:kAVTEditingModelDefinitionsGroupSymbolDarkKey];
    if (v8)
    {
      id v9 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:2];
      [v7 setObject:v8 forKey:v9];
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)coreModelCategoryFromCategoryDictionary:(id)a3
{
  return [(AVTEditingModelDefinitionsParser *)self coreModelCategoryFromCategoryDictionary:a3 parsedPickerKeys:MEMORY[0x263EFFA68]];
}

- (id)coreModelCategoryFromCategoryDictionary:(id)a3 parsedPickerKeys:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 objectForKeyedSubscript:kAVTEditingModelDefinitionsCategoryNameKey];
  id v9 = +[AVTEditingModelMappings presetCategoryFromCategoryName:v8];
  uint64_t v30 = [v9 integerValue];
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__9;
  v52 = __Block_byref_object_dispose__9;
  id v53 = 0;
  uint64_t v42 = 0;
  uint64_t v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__9;
  v46 = __Block_byref_object_dispose__9;
  id v47 = 0;
  id v10 = [MEMORY[0x263EFF9B0] orderedSet];
  id v11 = [(AVTEditingModelDefinitionsParser *)self applyPlatformOverrideForDictionary:v6];
  uint64_t v12 = [v11 objectForKeyedSubscript:kAVTEditingModelDefinitionsCategoryPickersKey];
  id v13 = (void *)v12;
  uint64_t v14 = (void *)MEMORY[0x263EFFA68];
  if (v12) {
    uint64_t v14 = (void *)v12;
  }
  id v15 = v14;

  uint64_t v16 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v15, "count"));
  id v29 = (void *)v8;
  if ([(AVTEditingModelDefinitionsParser *)self validateForCategoryWithEnumValue:v9 pickers:v15])
  {
    v27 = [v11 objectForKeyedSubscript:kAVTEditingModelDefinitionsOptionsKey];
    id v28 = v7;
    uint64_t v17 = [(AVTEditingModelDefinitionsParser *)self coreModelRowOptionsFromOptionsDictionary:v27];
    v41[0] = 0;
    v41[1] = v41;
    v41[2] = 0x2020000000;
    v41[3] = 0;
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __93__AVTEditingModelDefinitionsParser_coreModelCategoryFromCategoryDictionary_parsedPickerKeys___block_invoke;
    v31[3] = &unk_263FF1610;
    v31[4] = self;
    id v32 = v7;
    uint64_t v40 = v30;
    id v26 = v17;
    id v33 = v26;
    v37 = v41;
    id v34 = v9;
    long long v38 = &v48;
    long long v39 = &v42;
    uint64_t v18 = v10;
    id v35 = v10;
    id v19 = v16;
    id v36 = v19;
    [v15 enumerateObjectsUsingBlock:v31];
    v20 = [v11 objectForKeyedSubscript:kAVTEditingModelDefinitionsPairingKey];
    v21 = [(AVTEditingModelDefinitionsParser *)self pairingFromDictionary:v20];

    if (!v21)
    {
      v21 = -[AVTEditingModelDefinitionsParser pairingFromDictionary:](self, "pairingFromDictionary:", v11, v26);
    }
    v22 = objc_msgSend((id)objc_opt_class(), "sortedModelRows:forPlatform:", v19, -[AVTEditingModelDefinitionsParser platform](self, "platform"));
    unint64_t v23 = [AVTCoreModelCategory alloc];
    v24 = [(AVTCoreModelCategory *)v23 initWithPresetCategory:v30 presets:v49[5] tags:v43[5] rows:v22 pairing:v21];

    _Block_object_dispose(v41, 8);
    id v7 = v28;
  }
  else
  {
    uint64_t v18 = v10;
    v24 = 0;
  }

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v48, 8);

  return v24;
}

void __93__AVTEditingModelDefinitionsParser_coreModelCategoryFromCategoryDictionary_parsedPickerKeys___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [*(id *)(a1 + 32) multicolorPickersDefinitions];
  uint64_t v8 = [v7 objectForKeyedSubscript:v6];

  if (!v8)
  {
    uint64_t v12 = [*(id *)(a1 + 32) colorPickersDefinitions];
    id v13 = [v12 objectForKeyedSubscript:v6];

    uint64_t v14 = *(void **)(a1 + 32);
    if (!v13)
    {
      id v33 = [v14 presetPickersDefinitions];
      id v34 = [v33 objectForKeyedSubscript:v6];

      if (!v34) {
        goto LABEL_19;
      }
      if (!*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40))
      {
        uint64_t v35 = [*(id *)(a1 + 32) coreModelPresetsForCategory:*(void *)(a1 + 104)];
        uint64_t v36 = *(void *)(*(void *)(a1 + 88) + 8);
        v37 = *(void **)(v36 + 40);
        *(void *)(v36 + 40) = v35;

        uint64_t v38 = [*(id *)(a1 + 32) gatherAllTagsFromPresets:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
        uint64_t v39 = *(void *)(*(void *)(a1 + 96) + 8);
        uint64_t v40 = *(void **)(v39 + 40);
        *(void *)(v39 + 40) = v38;
      }
      long long v41 = [*(id *)(a1 + 32) presetPickersDefinitions];
      uint64_t v16 = [v41 objectForKeyedSubscript:v6];

      uint64_t v25 = [*(id *)(a1 + 32) coreModelRowFromRowDictionary:v16 availableTags:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) usedTags:*(void *)(a1 + 64) defaultOptions:*(void *)(a1 + 48)];
LABEL_17:

      if (v25)
      {
        [*(id *)(a1 + 72) addObject:v25];

        goto LABEL_26;
      }
LABEL_19:
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498], @"Can't find a picker for identifier '%@'", v6 format];
      goto LABEL_26;
    }
    id v15 = [v14 colorPickersDefinitions];
    uint64_t v16 = [v15 objectForKeyedSubscript:v6];

    uint64_t v17 = AVTAvatarSettingDestinationForColorPickerIndex(*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24));
    uint64_t v18 = [v16 objectForKeyedSubscript:kAVTEditingModelDefinitionsColorPickerPaletteKey];
    id v19 = +[AVTEditingModelMappings presetCategoryForColorPaletteName:v18];

    uint64_t v20 = [*(id *)(a1 + 56) integerValue];
    v21 = *(void **)(a1 + 32);
    id v42 = 0;
    char v22 = [v21 validateForColorPicker:v16 colorPaletteCategory:v19 error:&v42];
    id v23 = v42;
    v24 = v23;
    if (v22)
    {
      uint64_t v25 = [*(id *)(a1 + 32) coreModelColorsRowForColorPickerDictionary:v16 settingDestination:v17 inCategory:v20 defaultOptions:*(void *)(a1 + 48)];
      ++*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
      if (!v24)
      {
LABEL_12:

        goto LABEL_17;
      }
      [*(id *)(a1 + 32) setError:v24];
    }
    else
    {
      if (v23) {
        [*(id *)(a1 + 32) setError:v23];
      }
      *a4 = 1;
    }

    goto LABEL_25;
  }
  if (![*(id *)(a1 + 40) containsObject:v6])
  {
    uint64_t v16 = [*(id *)(a1 + 40) arrayByAddingObject:v6];
    id v26 = [*(id *)(a1 + 32) multicolorPickersDefinitions];
    id v19 = [v26 objectForKeyedSubscript:v6];

    v27 = [*(id *)(a1 + 32) applyPlatformOverrideForDictionary:v19];
    id v28 = *(void **)(a1 + 32);
    uint64_t v29 = *(void *)(a1 + 104);
    uint64_t v30 = *(void *)(a1 + 48);
    id v43 = 0;
    uint64_t v25 = [v28 coreModelMulticolorPickerForDictionary:v27 groupPickerCategory:v29 defaultOptions:v30 parsedPickerKeys:v16 error:&v43];
    id v31 = v43;
    id v32 = v31;
    if (!v25 && v31)
    {
      [*(id *)(a1 + 32) setError:v31];
      *a4 = 1;

LABEL_25:
      goto LABEL_26;
    }

    goto LABEL_12;
  }
  id v9 = objc_opt_class();
  id v10 = [NSString stringWithFormat:@"Recursion found in multicolor picker definition"];
  id v11 = [v9 errorWithDescription:v10 underlyingError:0];
  [*(id *)(a1 + 32) setError:v11];

  *a4 = 1;
  [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498], @"Recursion found in multicolor picker definition for identifier '%@'", v6 format];
LABEL_26:
}

- (id)pairingFromDictionary:(id)a3
{
  if (!a3)
  {
    id v23 = 0;
    goto LABEL_11;
  }
  uint64_t v3 = kAVTEditingModelDefinitionsPairedCategoryKey;
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:v3];
  id v6 = objc_opt_class();
  id v7 = [v4 objectForKeyedSubscript:kAVTEditingModelDefinitionsPairedTitleKey];
  uint64_t v8 = [v6 localizedString:v7];

  id v9 = objc_opt_class();
  id v10 = [v4 objectForKeyedSubscript:kAVTEditingModelDefinitionsPairTitleKey];
  id v11 = [v9 localizedString:v10];

  uint64_t v12 = objc_opt_class();
  id v13 = [v4 objectForKeyedSubscript:kAVTEditingModelDefinitionsUnpairTitleKey];
  uint64_t v14 = [v12 localizedString:v13];

  id v15 = objc_opt_class();
  uint64_t v16 = [v4 objectForKeyedSubscript:kAVTEditingModelDefinitionsPairedDescriptionKey];
  uint64_t v17 = [v15 localizedString:v16];

  uint64_t v18 = objc_opt_class();
  id v19 = [v4 objectForKeyedSubscript:kAVTEditingModelDefinitionsUnpairedDescriptionKey];

  uint64_t v20 = [v18 localizedString:v19];

  if (v5)
  {
    v21 = +[AVTEditingModelMappings presetCategoryFromCategoryName:v5];
    uint64_t v22 = [v21 integerValue];
  }
  else
  {
    uint64_t v22 = 40;
    if (!v8 && !v11 && !v14)
    {
      id v23 = 0;
      goto LABEL_10;
    }
  }
  id v23 = [[AVTCoreModelPairing alloc] initWithPairedCategory:v22 pairedTitle:v8 pairTitle:v11 unpairTitle:v14 pairedDescription:v17 unpairedDescription:v20];
LABEL_10:

LABEL_11:
  return v23;
}

- (id)coreModelColorsRowForColorPickerDictionary:(id)a3 settingDestination:(int64_t)a4 inCategory:(int64_t)a5 defaultOptions:(id)a6
{
  id v10 = a6;
  if (!a3)
  {
    id v19 = 0;
    goto LABEL_21;
  }
  id v29 = v10;
  id v11 = [(AVTEditingModelDefinitionsParser *)self applyPlatformOverrideForDictionary:a3];
  uint64_t v12 = [v11 objectForKeyedSubscript:kAVTEditingModelDefinitionsColorPickerPrimaryColorsKey];
  id v13 = [v11 objectForKeyedSubscript:kAVTEditingModelDefinitionsColorPickerExtendedColorsKey];
  uint64_t v14 = [v11 objectForKeyedSubscript:kAVTEditingModelDefinitionsColorPickerAlwaysExtendedKey];
  unsigned int v28 = [v14 BOOLValue];

  id v15 = objc_opt_class();
  uint64_t v16 = [v11 objectForKeyedSubscript:kAVTEditingModelDefinitionsTitleKey];
  uint64_t v17 = [v15 localizedString:v16];

  if (v12)
  {
    uint64_t v18 = -[AVTEditingModelDefinitionsParser coreModelColorsForColorDefinitions:paletteSettingKind:](self, "coreModelColorsForColorDefinitions:paletteSettingKind:", v12, a4, a5);
    if (!v13)
    {
LABEL_11:
      uint64_t v20 = 0;
      if (!v18) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else
  {
    if (!v13)
    {
      uint64_t v18 = -[AVTEditingModelDefinitionsParser coreModelColorsForPaletteSettingKind:](self, "coreModelColorsForPaletteSettingKind:", a4, a5);
      goto LABEL_11;
    }
    uint64_t v18 = 0;
  }
  uint64_t v20 = -[AVTEditingModelDefinitionsParser coreModelColorsForColorDefinitions:paletteSettingKind:](self, "coreModelColorsForColorDefinitions:paletteSettingKind:", v13, a4, a5);
  if (!v18) {
    goto LABEL_13;
  }
LABEL_12:
  if ([v18 count]) {
    goto LABEL_15;
  }
LABEL_13:
  if (v20 && [v20 count])
  {
LABEL_15:
    v27 = v12;
    v21 = [v11 objectForKeyedSubscript:kAVTEditingModelDefinitionsPairingKey];
    uint64_t v22 = [(AVTEditingModelDefinitionsParser *)self pairingFromDictionary:v21];

    id v23 = [v11 objectForKeyedSubscript:kAVTEditingModelDefinitionsOptionsKey];
    if (v23)
    {
      id v24 = [(AVTEditingModelDefinitionsParser *)self coreModelRowOptionsFromOptionsDictionary:v23];
    }
    else
    {
      id v24 = v29;
    }
    uint64_t v25 = v24;
    id v19 = [[AVTCoreModelColorsPicker alloc] initWithTitle:v17 primaryColors:v18 extendedColors:v20 alwaysShowExtended:v28 colorCategory:a5 destination:a4 pairing:v22 options:v24];

    uint64_t v12 = v27;
    goto LABEL_20;
  }
  id v19 = 0;
LABEL_20:

  id v10 = v29;
LABEL_21:

  return v19;
}

- (id)coreModelMulticolorPickerForDictionary:(id)a3 groupPickerCategory:(int64_t)a4 defaultOptions:(id)a5 parsedPickerKeys:(id)a6 error:(id *)a7
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v70 = a5;
  id v82 = a6;
  [(AVTEditingModelDefinitionsParser *)self initalizeColorCacheIfNeeded];
  uint64_t v12 = [v11 objectForKeyedSubscript:kAVTEditingModelDefinitionsMulticolorSubpickers];
  id v94 = 0;
  v68 = v11;
  LOBYTE(a6) = [(AVTEditingModelDefinitionsParser *)self validateForMulticolorPicker:v11 subpickers:v12 error:&v94];
  id v13 = v94;
  uint64_t v14 = v13;
  if ((a6 & 1) == 0)
  {
    id v47 = 0;
    if (a7 && v13)
    {
      id v47 = 0;
      *a7 = v13;
    }
    goto LABEL_66;
  }
  v71 = a7;
  v83 = self;
  id v66 = v13;
  v81 = [MEMORY[0x263EFF980] array];
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  v67 = v12;
  id v15 = v12;
  uint64_t v74 = [v15 countByEnumeratingWithState:&v90 objects:v96 count:16];
  if (v74)
  {
    uint64_t v16 = 0;
    uint64_t v72 = *(void *)v91;
    unint64_t v17 = 0x263FEF000uLL;
    obuint64_t j = v15;
    while (2)
    {
      for (uint64_t i = 0; i != v74; ++i)
      {
        if (*(void *)v91 != v72) {
          objc_enumerationMutation(obj);
        }
        id v19 = *(void **)(*((void *)&v90 + 1) + 8 * i);
        uint64_t v20 = [v19 objectForKeyedSubscript:kAVTEditingModelDefinitionsMulticolorPickerDestinationKey];
        uint64_t v21 = (uint64_t)v16;
        if (v20) {
          uint64_t v21 = [v20 integerValue];
        }
        v78 = v16;
        uint64_t v22 = AVTAvatarSettingDestinationForColorPickerIndex(v21);
        id v23 = [v19 objectForKeyedSubscript:kAVTEditingModelDefinitionsCategoryNameKey];
        int64_t v24 = a4;
        if (v23)
        {
          uint64_t v25 = [*(id *)(v17 + 1992) presetCategoryFromCategoryName:v23];
          int64_t v24 = [v25 integerValue];
        }
        id v26 = *(void **)(v17 + 1992);
        v27 = [v19 objectForKeyedSubscript:kAVTEditingModelDefinitionsColorPickerPaletteKey];
        unsigned int v28 = [v26 presetCategoryForColorPaletteName:v27];

        id v89 = 0;
        BOOL v29 = [(AVTEditingModelDefinitionsParser *)v83 validateForColorPicker:v19 colorPaletteCategory:v28 error:&v89];
        id v30 = v89;
        id v31 = v30;
        if (v29)
        {
          id v32 = [(AVTEditingModelDefinitionsParser *)v83 coreModelColorsRowForColorPickerDictionary:v19 settingDestination:v22 inCategory:v24 defaultOptions:v70];
          [v81 addObject:v32];
          uint64_t v16 = v78 + 1;
          BOOL v33 = v31 == 0;
        }
        else
        {
          BOOL v33 = 0;
          if (v71 && v30)
          {
            BOOL v33 = 0;
            id *v71 = v30;
          }
          uint64_t v16 = v78;
        }

        if (!v33)
        {
          id v47 = 0;
          uint64_t v14 = v66;
          uint64_t v12 = v67;
          goto LABEL_65;
        }
        unint64_t v17 = 0x263FEF000;
      }
      id v15 = obj;
      uint64_t v74 = [obj countByEnumeratingWithState:&v90 objects:v96 count:16];
      if (v74) {
        continue;
      }
      break;
    }
  }

  id v34 = v68;
  uint64_t v35 = [v68 objectForKeyedSubscript:kAVTEditingModelDefinitionsMulticolorNestedPresetPickers];
  obuint64_t j = v35;
  if ([v35 count])
  {
    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    id v79 = v35;
    uint64_t v36 = [v79 countByEnumeratingWithState:&v85 objects:v95 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      v77 = 0;
      uint64_t v38 = *(void *)v86;
      do
      {
        for (uint64_t j = 0; j != v37; ++j)
        {
          if (*(void *)v86 != v38) {
            objc_enumerationMutation(v79);
          }
          uint64_t v40 = *(void **)(*((void *)&v85 + 1) + 8 * j);
          long long v41 = [v40 objectForKeyedSubscript:kAVTEditingModelDefinitionsMulticolorNestedPresetPickersCategory];
          id v42 = [(AVTEditingModelDefinitionsParser *)v83 coreModelCategoryFromCategoryDictionary:v41 parsedPickerKeys:v82];
          id v43 = [v40 objectForKeyedSubscript:kAVTEditingModelDefinitionsMulticolorNestedPresetPickersIndex];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v44 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v43, "integerValue"));

            id v43 = (void *)v44;
          }
          if (v42) {
            BOOL v45 = v43 == 0;
          }
          else {
            BOOL v45 = 1;
          }
          if (!v45)
          {
            unint64_t v46 = [v43 integerValue];
            if (v46 < [v81 count])
            {
              if (v77)
              {
                [v77 setObject:v42 forKeyedSubscript:v43];
              }
              else
              {
                v77 = [MEMORY[0x263EFF9A0] dictionaryWithObject:v42 forKey:v43];
              }
            }
          }
        }
        uint64_t v37 = [v79 countByEnumeratingWithState:&v85 objects:v95 count:16];
      }
      while (v37);
    }
    else
    {
      v77 = 0;
    }

    id v34 = v68;
  }
  else
  {
    v77 = 0;
  }
  uint64_t v48 = [v34 objectForKeyedSubscript:kAVTEditingModelDefinitionsMulticolorAuxiliaryPicker];
  uint64_t v14 = v66;
  uint64_t v12 = v67;
  if (!v48)
  {
    uint64_t v50 = 0;
    goto LABEL_50;
  }
  id v84 = 0;
  id v47 = [(AVTEditingModelDefinitionsParser *)v83 multicolorAuxiliaryPickerForDictionary:v48 error:&v84];
  v49 = (AVTCoreModelMulticolorPicker *)v84;
  uint64_t v50 = v49;
  if (v47)
  {

    uint64_t v50 = v47;
LABEL_50:
    v51 = [v68 objectForKeyedSubscript:kAVTEditingModelDefinitionsMulticolorPickerInitialState];
    v75 = v51;
    if (v51) {
      uint64_t v73 = [v51 integerValue];
    }
    else {
      uint64_t v73 = 0;
    }
    v52 = [v68 objectForKeyedSubscript:kAVTEditingModelDefinitionsMulticolorAllowsRemoval];
    id v53 = v52;
    if (v52) {
      char v54 = [v52 BOOLValue];
    }
    else {
      char v54 = 1;
    }
    v55 = [v68 objectForKeyedSubscript:kAVTEditingModelDefinitionsOptionsKey];
    id v80 = v48;
    if (v55)
    {
      v56 = v83;
      id v57 = [(AVTEditingModelDefinitionsParser *)v83 coreModelRowOptionsFromOptionsDictionary:v55];
    }
    else
    {
      id v57 = v70;
      v56 = v83;
    }
    v58 = objc_opt_class();
    v59 = [v68 objectForKeyedSubscript:kAVTEditingModelDefinitionsTitleKey];
    v60 = [v58 localizedString:v59];

    v61 = [v68 objectForKeyedSubscript:kAVTEditingModelDefinitionsMulticolorSubtitles];
    v62 = -[AVTEditingModelDefinitionsParser localizedSubtitlesForSubtitles:subpickerCount:](v56, "localizedSubtitlesForSubtitles:subpickerCount:", v61, [v81 count]);
    LOBYTE(v65) = v54;
    v63 = v77;
    id v47 = [[AVTCoreModelMulticolorPicker alloc] initWithTitle:v60 subpickers:v81 subtitles:v62 nestedPresetPickers:v77 auxiliaryPicker:v50 initialState:v73 allowsRemoval:v65 options:v57];

    uint64_t v14 = v66;
    uint64_t v12 = v67;
    uint64_t v48 = v80;
    goto LABEL_64;
  }
  if (v71 && v49)
  {
    uint64_t v50 = v49;
    id v47 = 0;
    id *v71 = v50;
  }
  v63 = v77;
LABEL_64:

LABEL_65:
LABEL_66:

  return v47;
}

- (id)localizedSubtitlesForSubtitles:(id)a3 subpickerCount:(int64_t)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v29 = [MEMORY[0x263EFF980] array];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = v6;
  uint64_t v26 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v26)
  {
    uint64_t v7 = 0;
    uint64_t v25 = *(void *)v33;
    unint64_t v8 = 0x263F08000uLL;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v33 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = v9;
        id v31 = *(void **)(*((void *)&v32 + 1) + 8 * v9);
        id v30 = [MEMORY[0x263EFF9A0] dictionary];
        unint64_t v10 = 0x263F08000uLL;
        if (a4 >= 1)
        {
          uint64_t v11 = 0;
          uint64_t v28 = v7 - 1;
          do
          {
            uint64_t v12 = [*(id *)(v8 + 2584) numberWithInteger:v11];
            id v13 = objc_msgSend(*(id *)(v10 + 2880), "stringWithFormat:", @"%ld", v11);
            uint64_t v14 = [v31 objectForKeyedSubscript:v13];
            if (v14)
            {
              id v15 = [(id)objc_opt_class() localizedString:v14];
              if (!v15) {
                goto LABEL_17;
              }
            }
            else
            {
              if (v7 < 1) {
                goto LABEL_17;
              }
              uint64_t v16 = v7;
              int64_t v17 = a4;
              uint64_t v18 = self;
              id v19 = [v29 objectAtIndexedSubscript:v28];
              uint64_t v20 = [v19 objectForKeyedSubscript:v13];
              if (v20)
              {
                id v15 = [(id)objc_opt_class() localizedString:v20];
              }
              else
              {
                id v15 = 0;
              }

              self = v18;
              a4 = v17;
              uint64_t v7 = v16;
              unint64_t v8 = 0x263F08000;
              unint64_t v10 = 0x263F08000;
              if (!v15) {
                goto LABEL_17;
              }
            }
            [v30 setObject:v15 forKeyedSubscript:v12];

LABEL_17:
            ++v11;
          }
          while (a4 != v11);
        }
        uint64_t v21 = (void *)[v30 copy];
        [v29 addObject:v21];

        ++v7;
        uint64_t v9 = v27 + 1;
      }
      while (v27 + 1 != v26);
      uint64_t v26 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v26);
  }

  uint64_t v22 = (void *)[v29 copy];
  return v22;
}

- (id)multicolorAuxiliaryPickerForDictionary:(id)a3 error:(id *)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:kAVTEditingModelDefinitionsMulticolorAuxiliaryPickerItems];
  if ([v6 count])
  {
    BOOL v29 = a4;
    id v31 = v5;
    long long v33 = [MEMORY[0x263EFF980] array];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v30 = v6;
    obuint64_t j = v6;
    uint64_t v7 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v35;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v35 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v34 + 1) + 8 * v10);
        uint64_t v12 = [v11 objectForKeyedSubscript:kAVTEditingModelDefinitionsMulticolorAuxiliaryPickerItemIdentifier];
        id v13 = objc_opt_class();
        uint64_t v14 = [v11 objectForKeyedSubscript:kAVTEditingModelDefinitionsMulticolorAuxiliaryPickerItemTitle];
        id v15 = [v13 localizedString:v14];

        uint64_t v16 = objc_opt_class();
        int64_t v17 = [v11 objectForKeyedSubscript:kAVTEditingModelDefinitionsMulticolorAuxiliaryPickerItemMessage];
        uint64_t v18 = [v16 localizedString:v17];

        if (!v12 || ![v12 length]) {
          break;
        }
        if (!v15 || ![v15 length])
        {
          id v19 = objc_opt_class();
          uint64_t v20 = NSString;
          uint64_t v21 = kAVTEditingModelDefinitionsMulticolorAuxiliaryPickerItemTitle;
          goto LABEL_13;
        }
LABEL_14:
        int64_t v24 = [[AVTCoreModelMulticolorAuxilaryPickerItem alloc] initWithIdentifier:v12 title:v15 message:v18];
        [v33 addObject:v24];

        if (v8 == ++v10)
        {
          uint64_t v8 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
          if (v8) {
            goto LABEL_4;
          }
          goto LABEL_16;
        }
      }
      id v19 = objc_opt_class();
      uint64_t v20 = NSString;
      uint64_t v21 = kAVTEditingModelDefinitionsMulticolorAuxiliaryPickerItemIdentifier;
LABEL_13:
      uint64_t v22 = [v20 stringWithFormat:@"Multicolor auxiliary picker items require a valid %@", v21];
      id v23 = [v19 errorWithDescription:v22 underlyingError:0];

      if (v23)
      {
        if (v29) {
          *BOOL v29 = v23;
        }

        uint64_t v27 = 0;
        id v6 = v30;
        id v5 = v31;
        uint64_t v25 = obj;
        uint64_t v26 = v33;
        goto LABEL_20;
      }
      goto LABEL_14;
    }
LABEL_16:

    id v5 = v31;
    uint64_t v25 = [v31 objectForKeyedSubscript:kAVTEditingModelDefinitionsMulticolorAuxiliaryPickerType];
    uint64_t v26 = v33;
    uint64_t v27 = [[AVTCoreModelMulticolorAuxiliaryPicker alloc] initWithType:v25 items:v33];
    id v6 = v30;
LABEL_20:
  }
  else
  {
    uint64_t v27 = 0;
  }

  return v27;
}

- (BOOL)validateForCategoryWithEnumValue:(id)a3 pickers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (!v6)
  {
    uint64_t v10 = objc_opt_class();
    [NSString stringWithFormat:@"Category definitions require a valid %@", kAVTEditingModelDefinitionsCategoryNameKey];
    uint64_t v11 = LABEL_7:;
    uint64_t v12 = [v10 errorWithDescription:v11 underlyingError:0];
    [(AVTEditingModelDefinitionsParser *)self setError:v12];

    BOOL v9 = 0;
    goto LABEL_8;
  }
  if (!v7 || ![v7 count])
  {
    uint64_t v10 = objc_opt_class();
    [NSString stringWithFormat:@"Category definitions must contain at least one %@", kAVTEditingModelDefinitionsCategoryPickersKey];
    goto LABEL_7;
  }
  BOOL v9 = 1;
LABEL_8:

  return v9;
}

- (BOOL)validateForMulticolorPicker:(id)a3 subpickers:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = v8;
  if (v8 && [v8 count])
  {
    LOBYTE(a5) = 1;
  }
  else if (a5)
  {
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = [NSString stringWithFormat:@"Multicolor definitions must contain at least one %@", kAVTEditingModelDefinitionsMulticolorSubpickers];
    *a5 = [v10 errorWithDescription:v11 underlyingError:0];

    LOBYTE(a5) = 0;
  }

  return (char)a5;
}

- (BOOL)validateForColorPicker:(id)a3 colorPaletteCategory:(id)a4 error:(id *)a5
{
  if (a3) {
    BOOL v5 = a4 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  BOOL v6 = !v5;
  if (v5 && a5)
  {
    id v8 = objc_opt_class();
    BOOL v9 = [NSString stringWithFormat:@"colorPicker, %@ doesn't match a valid category", kAVTEditingModelDefinitionsColorPickerPaletteKey];
    *a5 = [v8 errorWithDescription:v9 underlyingError:0];
  }
  return v6;
}

- (id)neutralMemojiPresetIdentifierForCategory:(int64_t)a3
{
  BOOL v5 = [(AVTEditingModelDefinitionsParser *)self neutralMemojiPresetsIdentifierPerCategory];

  if (!v5)
  {
    BOOL v6 = [MEMORY[0x263F29698] neutralMemojiPresetsIdentifiersPerCategory];
    [(AVTEditingModelDefinitionsParser *)self setNeutralMemojiPresetsIdentifierPerCategory:v6];
  }
  id v7 = [(AVTEditingModelDefinitionsParser *)self neutralMemojiPresetsIdentifierPerCategory];
  id v8 = [NSNumber numberWithInteger:a3];
  BOOL v9 = [v7 objectForKey:v8];

  return v9;
}

- (id)coreModelPresetsForCategory:(int64_t)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  BOOL v5 = [MEMORY[0x263EFF980] array];
  BOOL v6 = [(AVTEditingModelDefinitionsParser *)self neutralMemojiPresetIdentifierForCategory:a3];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = objc_msgSend(MEMORY[0x263F296A8], "availablePresetsForCategory:", a3, 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        if (v6)
        {
          id v13 = [*(id *)(*((void *)&v18 + 1) + 8 * i) identifier];
          uint64_t v14 = [v13 isEqualToString:v6];
        }
        else
        {
          uint64_t v14 = 0;
        }
        id v15 = [[AVTCoreModelPreset alloc] initWithPreset:v12 isDefaultPreset:v14];
        [v5 addObject:v15];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  uint64_t v16 = (void *)[v5 copy];
  return v16;
}

- (id)coreModelColorsForPaletteSettingKind:(id)a3
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  BOOL v5 = [(AVTEditingModelDefinitionsParser *)self colorCache];
  BOOL v6 = objc_msgSend(v5, "colorsForSettingKind:", var0, var1);

  return v6;
}

- (id)coreModelColorsForColorDefinitions:(id)a3 paletteSettingKind:(id)a4
{
  int64_t var1 = a4.var1;
  int64_t var0 = a4.var0;
  id v7 = (void *)MEMORY[0x263EFF980];
  id v8 = a3;
  uint64_t v9 = [v7 array];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __90__AVTEditingModelDefinitionsParser_coreModelColorsForColorDefinitions_paletteSettingKind___block_invoke;
  v14[3] = &unk_263FF1638;
  v14[4] = self;
  int64_t v16 = var0;
  int64_t v17 = var1;
  id v10 = v9;
  id v15 = v10;
  [v8 enumerateObjectsUsingBlock:v14];

  uint64_t v11 = v15;
  id v12 = v10;

  return v12;
}

void __90__AVTEditingModelDefinitionsParser_coreModelColorsForColorDefinitions_paletteSettingKind___block_invoke(uint64_t a1, void *a2)
{
  id v22 = a2;
  uint64_t v3 = [v22 objectForKeyedSubscript:kAVTEditingModelDefinitionsColorNameKey];
  id v4 = [v22 objectForKeyedSubscript:kAVTEditingModelDefinitionsColorShowSliderKey];
  int v5 = [v4 BOOLValue];

  BOOL v6 = [*(id *)(a1 + 32) colorCache];
  id v7 = objc_msgSend(v6, "colorForSettingKind:identifier:", *(void *)(a1 + 48), *(void *)(a1 + 56), v3);

  if (!v7)
  {
    id v8 = (void *)MEMORY[0x263EFF940];
    uint64_t v9 = *MEMORY[0x263EFF498];
    id v10 = AVTAvatarSettingKindDescription(*(void *)(a1 + 48));
    [v8 raise:v9, @"Can't find matching color for name '%@' in color kind and category '%@'\nIs it missing from AvatarKit's palette plist?", v3, v10 format];

    if (!v5) {
      goto LABEL_9;
    }
LABEL_5:
    uint64_t v11 = [v22 objectForKeyedSubscript:kAVTEditingModelDefinitionsColorRangeKey];
    uint64_t v14 = v11;
    if (v11)
    {
      id v15 = [v11 objectForKeyedSubscript:kAVTEditingModelDefinitionsColorRangeMinKey];
      [v15 floatValue];
      float v17 = v16;

      long long v18 = [v14 objectForKeyedSubscript:kAVTEditingModelDefinitionsColorRangeMaxKey];
      [v18 floatValue];
      float v20 = v19;
    }
    else
    {
      float v20 = 1.0;
      float v17 = -1.0;
    }
    *(float *)&double v12 = v17;
    *(float *)&double v13 = v20;
    uint64_t v21 = [v7 copyWithRangeMin:1 rangeMax:v12 showSlider:v13];

    id v7 = (void *)v21;
    goto LABEL_9;
  }
  if (v5) {
    goto LABEL_5;
  }
LABEL_9:
  [*(id *)(a1 + 40) addObject:v7];
}

- (id)gatherAllTagsFromPresets:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v15 + 1) + 8 * i) tags];
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = __61__AVTEditingModelDefinitionsParser_gatherAllTagsFromPresets___block_invoke;
        v13[3] = &unk_263FF1660;
        id v14 = v4;
        [v10 enumerateKeysAndObjectsUsingBlock:v13];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  uint64_t v11 = (void *)[v4 copy];
  return v11;
}

void __61__AVTEditingModelDefinitionsParser_gatherAllTagsFromPresets___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
  if (!v6)
  {
    uint64_t v6 = [MEMORY[0x263EFF9B0] orderedSet];
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
  }
  [v6 unionOrderedSet:v5];
}

- (id)applyPlatformOverrideForDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"platformOverride"];
  if (v5
    && ([(AVTEditingModelDefinitionsParser *)self platformDictionaryKey],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        [v5 objectForKey:v6],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    uint64_t v8 = [(AVTEditingModelDefinitionsParser *)self platformDictionaryKey];
    uint64_t v9 = [v5 objectForKeyedSubscript:v8];
    id v10 = (void *)[v9 mutableCopy];

    id v11 = (id)[v4 mutableCopy];
    double v12 = [v11 objectForKeyedSubscript:kAVTEditingModelDefinitionsOptionsKey];
    double v13 = (void *)[v12 mutableCopy];

    if (v13)
    {
      id v14 = [v10 objectForKeyedSubscript:kAVTEditingModelDefinitionsOptionsKey];
      [v13 addEntriesFromDictionary:v14];

      [v11 setObject:v13 forKeyedSubscript:kAVTEditingModelDefinitionsOptionsKey];
      [v10 removeObjectForKey:kAVTEditingModelDefinitionsOptionsKey];
    }
    [v11 addEntriesFromDictionary:v10];
    [v11 removeObjectForKey:@"platformOverride"];
  }
  else
  {
    id v11 = v4;
  }

  return v11;
}

- (id)coreModelRowFromRowDictionary:(id)a3 availableTags:(id)a4 usedTags:(id)a5 defaultOptions:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  double v13 = [(AVTEditingModelDefinitionsParser *)self applyPlatformOverrideForDictionary:a3];
  id v14 = objc_opt_class();
  long long v15 = [v13 objectForKeyedSubscript:kAVTEditingModelDefinitionsTitleKey];
  long long v16 = [v14 localizedString:v15];

  long long v17 = [v13 objectForKeyedSubscript:kAVTEditingModelDefinitionsTagsKey];
  if (v17)
  {
    long long v18 = [MEMORY[0x263EFF9D8] orderedSetWithArray:v17];
  }
  else if ([v11 count])
  {
    float v19 = (void *)MEMORY[0x263EFF9B0];
    uint64_t v20 = [v10 allKeys];
    uint64_t v21 = [v19 orderedSetWithArray:v20];

    [v21 minusOrderedSet:v11];
    long long v18 = (void *)[v21 copy];
  }
  else
  {
    long long v18 = 0;
  }
  id v22 = [v13 objectForKeyedSubscript:kAVTEditingModelDefinitionsOptionsKey];
  if (v22)
  {
    id v23 = [(AVTEditingModelDefinitionsParser *)self coreModelRowOptionsFromOptionsDictionary:v22];
  }
  else
  {
    id v23 = v12;
  }
  int64_t v24 = v23;
  if (v23)
  {
    uint64_t v25 = [v13 objectForKeyedSubscript:kAVTEditingModelDefinitionsPairingKey];
    uint64_t v26 = self;
    uint64_t v27 = v18;
    uint64_t v28 = v16;
    id v29 = v11;
    id v30 = v10;
    id v31 = (void *)v25;
    [(AVTEditingModelDefinitionsParser *)v26 pairingFromDictionary:v25];
    long long v36 = v17;
    v33 = id v32 = v12;

    id v10 = v30;
    id v11 = v29;
    long long v16 = v28;
    long long v18 = v27;
    long long v34 = [[AVTCoreModelPresetsPicker alloc] initWithTitle:v16 representedTags:v27 pairing:v33 options:v24];

    id v12 = v32;
    long long v17 = v36;
  }
  else
  {
    long long v34 = 0;
  }

  return v34;
}

- (id)coreModelRowOptionsFromOptionsDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:kAVTEditingModelDefinitionsSeparatorKey];
  uint64_t v6 = [v4 objectForKeyedSubscript:kAVTEditingModelDefinitionsCameraKey];
  id v7 = +[AVTEditingModelMappings framingModeForCameraIdentifier:v6];

  uint64_t v8 = [MEMORY[0x263EFF980] array];
  uint64_t v47 = 0;
  uint64_t v48 = &v47;
  uint64_t v49 = 0x2020000000;
  char v50 = 1;
  uint64_t v9 = [v4 objectForKeyedSubscript:kAVTEditingModelDefinitionsPresetOverridesKey];
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __77__AVTEditingModelDefinitionsParser_coreModelRowOptionsFromOptionsDictionary___block_invoke;
  v44[3] = &unk_263FF1688;
  v44[4] = self;
  unint64_t v46 = &v47;
  id v10 = v8;
  id v45 = v10;
  [v9 enumerateKeysAndObjectsUsingBlock:v44];
  if (*((unsigned char *)v48 + 24))
  {
    id v11 = [v4 objectForKeyedSubscript:kAVTEditingModelDefinitionsPoseOverrideKey];
    if ([v11 count]) {
      id v12 = (void *)[objc_alloc(MEMORY[0x263F29670]) initWithDictionaryRepresentation:v11];
    }
    else {
      id v12 = 0;
    }
    uint64_t v14 = [v4 objectForKeyedSubscript:kAVTEditingModelDefinitionsCameraOverridesKey];
    long long v37 = (void *)v14;
    if (v14) {
      uint64_t v38 = [[AVTCoreModelFramingModeOverrides alloc] initWithCameraOverrides:v14];
    }
    else {
      uint64_t v38 = 0;
    }
    long long v15 = [v4 objectForKeyedSubscript:kAVTEditingModelDefinitionsDisplayModeKey];
    unint64_t v36 = +[AVTCoreModelPickerOptions displayModeFromString:v15];

    uint64_t v16 = [v4 objectForKeyedSubscript:kAVTEditingModelDefinitionsDisplayConditionKey];
    if (v16)
    {
      long long v35 = +[AVTCoreModelPickerDisplayCondition displayConditionFromDictionnary:v16];
    }
    else
    {
      long long v35 = 0;
    }
    long long v41 = [v4 objectForKeyedSubscript:kAVTEditingModelDefinitionsSortingKey];
    uint64_t v17 = objc_msgSend((id)objc_opt_class(), "defaultSortingOptionForPlatform:", -[AVTEditingModelDefinitionsParser platform](self, "platform"));
    if (v41) {
      uint64_t v17 = +[AVTCoreModelPickerOptions sortingOptionFromString:](AVTCoreModelPickerOptions, "sortingOptionFromString:");
    }
    uint64_t v18 = v17;
    id v40 = v10;
    long long v34 = v11;
    if (v5) {
      uint64_t v19 = [v5 BOOLValue];
    }
    else {
      uint64_t v19 = 1;
    }
    uint64_t v20 = [v4 objectForKeyedSubscript:kAVTEditingModelDefinitionsStickerConfigurationKey];
    long long v33 = (void *)v16;
    uint64_t v21 = [v20 objectForKeyedSubscript:kAVTEditingModelDefinitionsStickerConfigurationNameKey];
    uint64_t v22 = [v20 objectForKeyedSubscript:kAVTEditingModelDefinitionsStickerConfigurationPackKey];
    id v23 = (void *)v22;
    uint64_t v39 = v7;
    id v32 = v5;
    int64_t v24 = 0;
    if (v21 && v22)
    {
      uint64_t v25 = [MEMORY[0x263F296C8] stickerConfigurationsForMemojiInStickerPack:v22];
      v42[0] = MEMORY[0x263EF8330];
      v42[1] = 3221225472;
      v42[2] = __77__AVTEditingModelDefinitionsParser_coreModelRowOptionsFromOptionsDictionary___block_invoke_2;
      v42[3] = &unk_263FF16B0;
      id v43 = v21;
      int64_t v24 = objc_msgSend(v25, "avt_firstObjectPassingTest:", v42);
    }
    uint64_t v26 = [v4 objectForKeyedSubscript:kAVTEditingModelDefinitionsShowsLabelKey];
    id v31 = v20;
    if ((AVTUIEditorShowAssetsName_once() & 1) != 0 || v26 && [v26 BOOLValue])
    {
      uint64_t v27 = v18;
      char v28 = 1;
    }
    else
    {
      uint64_t v27 = v18;
      char v28 = 0;
    }
    LOBYTE(v30) = v28;
    double v13 = [[AVTCoreModelPickerOptions alloc] initWithFramingMode:v39 separatorFlag:v19 presetOverrides:v40 poseOverride:v12 framingModeOverrides:v38 displayMode:v36 displayCondition:v35 sortingOption:v27 stickerConfiguration:v24 showsLabel:v30];

    id v5 = v32;
    id v7 = v39;
    id v10 = v40;
  }
  else
  {
    double v13 = 0;
  }

  _Block_object_dispose(&v47, 8);
  return v13;
}

void __77__AVTEditingModelDefinitionsParser_coreModelRowOptionsFromOptionsDictionary___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v16 = a2;
  id v7 = a3;
  uint64_t v8 = +[AVTEditingModelMappings presetCategoryFromCategoryName:v16];
  uint64_t v9 = [v8 integerValue];

  id v10 = [MEMORY[0x263F296A8] presetWithCategory:v9 identifier:v7];
  if (v10)
  {
    id v11 = *(void **)(a1 + 40);
    id v12 = [[AVTCoreModelPreset alloc] initWithPreset:v10];
    [v11 addObject:v12];
  }
  else
  {
    double v13 = objc_opt_class();
    uint64_t v14 = [NSString stringWithFormat:@"Couldn't find a preset override for category %@, identifier %@", v16, v7];
    long long v15 = [v13 errorWithDescription:v14 underlyingError:0];
    [*(id *)(a1 + 32) setError:v15];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *a4 = 1;
  }
}

uint64_t __77__AVTEditingModelDefinitionsParser_coreModelRowOptionsFromOptionsDictionary___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 name];
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

- (unint64_t)platform
{
  return self->_platform;
}

- (NSString)platformDictionaryKey
{
  return self->_platformDictionaryKey;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (NSData)plistData
{
  return self->_plistData;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (AVTEditingModelColors)colorCache
{
  return self->_colorCache;
}

- (void)setColorCache:(id)a3
{
}

- (NSDictionary)neutralMemojiPresetsIdentifierPerCategory
{
  return self->_neutralMemojiPresetsIdentifierPerCategory;
}

- (void)setNeutralMemojiPresetsIdentifierPerCategory:(id)a3
{
}

- (NSDictionary)presetPickersDefinitions
{
  return self->_presetPickersDefinitions;
}

- (void)setPresetPickersDefinitions:(id)a3
{
}

- (NSDictionary)colorPickersDefinitions
{
  return self->_colorPickersDefinitions;
}

- (void)setColorPickersDefinitions:(id)a3
{
}

- (NSDictionary)multicolorPickersDefinitions
{
  return self->_multicolorPickersDefinitions;
}

- (void)setMulticolorPickersDefinitions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multicolorPickersDefinitions, 0);
  objc_storeStrong((id *)&self->_colorPickersDefinitions, 0);
  objc_storeStrong((id *)&self->_presetPickersDefinitions, 0);
  objc_storeStrong((id *)&self->_neutralMemojiPresetsIdentifierPerCategory, 0);
  objc_storeStrong((id *)&self->_colorCache, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_plistData, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_platformDictionaryKey, 0);
}

@end