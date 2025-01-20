@interface AVTAvatarConfiguration
+ (id)configurationColorPresetWithColorPreset:(id)a3 settingKind:(id)a4 coreModel:(id)a5;
+ (id)configurationForRecord:(id)a3 coreModel:(id)a4;
+ (id)configurationFromAvatar:(id)a3;
+ (id)configurationFromAvatar:(id)a3 coreModel:(id)a4;
+ (id)configurationPresetWithPreset:(id)a3 settingKind:(id)a4;
+ (id)keyForSettingKind:(id)a3;
- (AVTAvatarConfiguration)init;
- (AVTAvatarConfiguration)initWithPresets:(id)a3 colorPresets:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresEncryption;
- (NSMutableDictionary)colorPresetsStorage;
- (NSMutableDictionary)presetsStorage;
- (NSString)description;
- (id)colorConfigurationPresets;
- (id)colorPresetForSettingKind:(id)a3;
- (id)colorPresets;
- (id)configurationPresetForSettingKind:(id)a3;
- (id)configurationPresets;
- (id)copyWithZone:(_NSZone *)a3;
- (id)persistentIdentifierForScope:(id)a3;
- (id)presetConfigurationPresets;
- (id)presetForCategory:(int64_t)a3;
- (id)presetForSettingKind:(id)a3 storage:(id)a4;
- (id)presets;
- (id)presetsForStorage:(id)a3;
- (id)volatileIdentifierForScope:(id)a3;
- (unint64_t)costForScope:(id)a3;
- (unint64_t)hash;
- (void)addColorPreset:(id)a3;
- (void)addConfigurationColorPreset:(id)a3;
- (void)addConfigurationPreset:(id)a3;
- (void)addPreset:(id)a3;
- (void)applyToAvatar:(id)a3 animated:(BOOL)a4;
- (void)removeColorPresetsForSettingKind:(id)a3;
- (void)removePresetsForCategory:(int64_t)a3;
- (void)removePresetsForSettingKind:(id)a3 storage:(id)a4;
@end

@implementation AVTAvatarConfiguration

- (id)volatileIdentifierForScope:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v37 = a3;
  v4 = [MEMORY[0x263F089D8] string];
  v5 = [(AVTAvatarConfiguration *)self presets];
  v6 = [v5 sortedArrayUsingComparator:&__block_literal_global_7];

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  obuint64_t j = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v45 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        v12 = [v11 preset];
        uint64_t v13 = [v12 category];
        v14 = [v11 preset];
        v15 = [v14 identifier];
        [v4 appendFormat:@"%ld_%@_", v13, v15];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v8);
  }

  v16 = [(AVTAvatarConfiguration *)self colorPresets];
  v17 = [v16 sortedArrayUsingComparator:&__block_literal_global_3];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v38 = v17;
  uint64_t v18 = [v38 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v41;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v41 != v20) {
          objc_enumerationMutation(v38);
        }
        v22 = *(void **)(*((void *)&v40 + 1) + 8 * j);
        v23 = [v22 color];
        unint64_t v24 = [v23 settingKind];
        v26 = AVTAvatarSettingKindIdentifier(v24, v25);
        v27 = [v22 color];
        v28 = [v27 identifier];
        [v4 appendFormat:@"%@_%@", v26, v28];

        v29 = [v22 colorPreset];
        [v29 variation];
        float v31 = v30;

        if (v31 != 0.0)
        {
          v32 = [v22 colorPreset];
          [v32 variation];
          [v4 appendFormat:@"_%.2f", v33];
        }
        [v4 appendString:@"_"];
      }
      uint64_t v19 = [v38 countByEnumeratingWithState:&v40 objects:v48 count:16];
    }
    while (v19);
  }

  objc_msgSend(v4, "appendFormat:", @"AK%lu", AVTAvatarKitSnapshotVersionNumber());
  if (v37)
  {
    v34 = [v37 cacheableResourceAssociatedIdentifier];
    [v4 appendString:v34];
  }
  v35 = (void *)[v4 copy];

  return v35;
}

- (id)persistentIdentifierForScope:(id)a3
{
  v3 = [(AVTAvatarConfiguration *)self volatileIdentifierForScope:a3];
  v4 = objc_msgSend(v3, "avt_MD5String");

  return v4;
}

- (unint64_t)costForScope:(id)a3
{
  return [a3 cacheableResourceAssociatedCost];
}

- (BOOL)requiresEncryption
{
  return 1;
}

+ (id)configurationPresetWithPreset:(id)a3 settingKind:(id)a4
{
  int64_t var1 = a4.var1;
  int64_t var0 = a4.var0;
  id v6 = a3;
  uint64_t v7 = [AVTConfigurationPreset alloc];
  uint64_t v8 = v7;
  if (v6)
  {
    uint64_t v9 = [[AVTCoreModelPreset alloc] initWithPreset:v6];
    v10 = -[AVTConfigurationPreset initWithPreset:settingKind:](v8, "initWithPreset:settingKind:", v9, var0, var1);
  }
  else
  {
    v10 = -[AVTConfigurationPreset initWithDefaultPresetForSettingKind:](v7, "initWithDefaultPresetForSettingKind:", var0, var1);
  }

  return v10;
}

+ (id)configurationColorPresetWithColorPreset:(id)a3 settingKind:(id)a4 coreModel:(id)a5
{
  int64_t var1 = a4.var1;
  int64_t var0 = a4.var0;
  id v8 = a3;
  if (v8)
  {
    uint64_t v9 = [a5 colors];
    v10 = [v8 name];
    objc_msgSend(v9, "colorForSettingKind:identifier:", var0, var1, v10);
    v11 = (AVTCoreModelColor *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v12 = [AVTCoreModelColor alloc];
      v11 = -[AVTCoreModelColor initWithColorPreset:settingKind:order:derivedColorsByCategories:](v12, "initWithColorPreset:settingKind:order:derivedColorsByCategories:", v8, var0, var1, 0x7FFFFFFFFFFFFFFFLL, MEMORY[0x263EFFA78]);
    }
    uint64_t v13 = [[AVTCoreModelColorVariation alloc] initWithColor:v11 colorPreset:v8];
    v14 = -[AVTConfigurationPreset initWithPreset:settingKind:]([AVTConfigurationPreset alloc], "initWithPreset:settingKind:", v13, var0, var1);
  }
  else
  {
    v14 = -[AVTConfigurationPreset initWithDefaultPresetForSettingKind:]([AVTConfigurationPreset alloc], "initWithDefaultPresetForSettingKind:", var0, var1);
  }

  return v14;
}

+ (id)configurationFromAvatar:(id)a3
{
  id v4 = a3;
  v5 = +[AVTUIEnvironment defaultEnvironment];
  id v6 = [v5 editorCoreModel];

  uint64_t v7 = [a1 configurationFromAvatar:v4 coreModel:v6];

  return v7;
}

+ (id)configurationFromAvatar:(id)a3 coreModel:(id)a4
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)a1);
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  obuint64_t j = [v7 groups];
  uint64_t v55 = [obj countByEnumeratingWithState:&v83 objects:v91 count:16];
  if (v55)
  {
    uint64_t v54 = *(void *)v84;
    id v66 = v6;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v84 != v54) {
          objc_enumerationMutation(obj);
        }
        uint64_t v56 = v9;
        v10 = *(void **)(*((void *)&v83 + 1) + 8 * v9);
        long long v79 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        long long v82 = 0u;
        id v57 = [v10 categories];
        uint64_t v59 = [v57 countByEnumeratingWithState:&v79 objects:v90 count:16];
        if (v59)
        {
          uint64_t v58 = *(void *)v80;
          do
          {
            uint64_t v11 = 0;
            do
            {
              if (*(void *)v80 != v58) {
                objc_enumerationMutation(v57);
              }
              uint64_t v60 = v11;
              v12 = *(void **)(*((void *)&v79 + 1) + 8 * v11);
              uint64_t v13 = [v12 presetCategory];
              if ((AVTPrereleaseCategoriesEnabled() & 1) != 0 || (AVTPresetCategoryIsPrerelease() & 1) == 0)
              {
                v14 = [v6 presetForCategory:v13];
                uint64_t v15 = AVTPresetSettingKind();
                v17 = objc_msgSend(a1, "configurationPresetWithPreset:settingKind:", v14, v15, v16);
                [v8 addConfigurationPreset:v17];

                for (uint64_t i = 0; i != 3; ++i)
                {
                  uint64_t v19 = [v6 colorPresetForCategory:v13 colorIndex:i];
                  uint64_t v20 = AVTColorSettingKind(v13, i);
                  v22 = objc_msgSend(a1, "configurationColorPresetWithColorPreset:settingKind:coreModel:", v19, v20, v21, v7);
                  [v8 addConfigurationColorPreset:v22];

                  id v6 = v66;
                }
                long long v77 = 0u;
                long long v78 = 0u;
                long long v75 = 0u;
                long long v76 = 0u;
                id v63 = [v12 pickers];
                uint64_t v23 = [v63 countByEnumeratingWithState:&v75 objects:v89 count:16];
                if (v23)
                {
                  uint64_t v24 = v23;
                  uint64_t v25 = *(void *)v76;
                  uint64_t v61 = *(void *)v76;
                  do
                  {
                    uint64_t v26 = 0;
                    uint64_t v62 = v24;
                    do
                    {
                      if (*(void *)v76 != v25) {
                        objc_enumerationMutation(v63);
                      }
                      v27 = *(void **)(*((void *)&v75 + 1) + 8 * v26);
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        uint64_t v64 = v26;
                        id v28 = v7;
                        id v29 = v27;
                        long long v71 = 0u;
                        long long v72 = 0u;
                        long long v73 = 0u;
                        long long v74 = 0u;
                        id v65 = v29;
                        float v30 = [v29 subpickers];
                        uint64_t v31 = [v30 countByEnumeratingWithState:&v71 objects:v88 count:16];
                        if (v31)
                        {
                          uint64_t v32 = v31;
                          uint64_t v33 = *(void *)v72;
                          do
                          {
                            for (uint64_t j = 0; j != v32; ++j)
                            {
                              if (*(void *)v72 != v33) {
                                objc_enumerationMutation(v30);
                              }
                              v35 = *(void **)(*((void *)&v71 + 1) + 8 * j);
                              uint64_t v36 = [v35 colorCategory];
                              uint64_t v37 = [v35 destination] - 1;
                              id v38 = [v6 colorPresetForCategory:v36 colorIndex:v37];
                              uint64_t v39 = AVTColorSettingKind(v36, v37);
                              long long v41 = objc_msgSend(a1, "configurationColorPresetWithColorPreset:settingKind:coreModel:", v38, v39, v40, v28);
                              [v8 addConfigurationColorPreset:v41];

                              id v6 = v66;
                            }
                            uint64_t v32 = [v30 countByEnumeratingWithState:&v71 objects:v88 count:16];
                          }
                          while (v32);
                        }

                        long long v69 = 0u;
                        long long v70 = 0u;
                        long long v67 = 0u;
                        long long v68 = 0u;
                        long long v42 = [v65 nestedPresetPickers];
                        long long v43 = [v42 allValues];

                        uint64_t v44 = [v43 countByEnumeratingWithState:&v67 objects:v87 count:16];
                        if (v44)
                        {
                          uint64_t v45 = v44;
                          uint64_t v46 = *(void *)v68;
                          do
                          {
                            for (uint64_t k = 0; k != v45; ++k)
                            {
                              if (*(void *)v68 != v46) {
                                objc_enumerationMutation(v43);
                              }
                              v48 = objc_msgSend(v6, "presetForCategory:", objc_msgSend(*(id *)(*((void *)&v67 + 1) + 8 * k), "presetCategory"));
                              uint64_t v49 = AVTPresetSettingKind();
                              v51 = objc_msgSend(a1, "configurationPresetWithPreset:settingKind:", v48, v49, v50);
                              [v8 addConfigurationPreset:v51];
                            }
                            uint64_t v45 = [v43 countByEnumeratingWithState:&v67 objects:v87 count:16];
                          }
                          while (v45);
                        }

                        id v7 = v28;
                        uint64_t v25 = v61;
                        uint64_t v24 = v62;
                        uint64_t v26 = v64;
                      }
                      ++v26;
                    }
                    while (v26 != v24);
                    uint64_t v24 = [v63 countByEnumeratingWithState:&v75 objects:v89 count:16];
                  }
                  while (v24);
                }
              }
              uint64_t v11 = v60 + 1;
            }
            while (v60 + 1 != v59);
            uint64_t v59 = [v57 countByEnumeratingWithState:&v79 objects:v90 count:16];
          }
          while (v59);
        }

        uint64_t v9 = v56 + 1;
      }
      while (v56 + 1 != v55);
      uint64_t v55 = [obj countByEnumeratingWithState:&v83 objects:v91 count:16];
    }
    while (v55);
  }

  return v8;
}

+ (id)configurationForRecord:(id)a3 coreModel:(id)a4
{
  id v6 = (void *)MEMORY[0x263F29730];
  id v7 = a4;
  id v8 = [v6 memojiForRecord:a3 usageIntent:0];
  uint64_t v9 = [a1 configurationFromAvatar:v8 coreModel:v7];

  return v9;
}

+ (id)keyForSettingKind:(id)a3
{
  return AVTAvatarSettingKindIdentifier(a3.var0, a3.var1);
}

- (AVTAvatarConfiguration)init
{
  return [(AVTAvatarConfiguration *)self initWithPresets:MEMORY[0x263EFFA78] colorPresets:MEMORY[0x263EFFA78]];
}

- (AVTAvatarConfiguration)initWithPresets:(id)a3 colorPresets:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AVTAvatarConfiguration;
  id v8 = [(AVTAvatarConfiguration *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 mutableCopy];
    presetsStorage = v8->_presetsStorage;
    v8->_presetsStorage = (NSMutableDictionary *)v9;

    uint64_t v11 = [v7 mutableCopy];
    colorPresetsStorage = v8->_colorPresetsStorage;
    v8->_colorPresetsStorage = (NSMutableDictionary *)v11;
  }
  return v8;
}

- (void)addPreset:(id)a3
{
  id v4 = a3;
  v5 = [AVTConfigurationPreset alloc];
  id v9 = [v4 preset];
  [v9 category];
  uint64_t v6 = AVTPresetSettingKind();
  id v8 = -[AVTConfigurationPreset initWithPreset:settingKind:](v5, "initWithPreset:settingKind:", v4, v6, v7);

  [(AVTAvatarConfiguration *)self addConfigurationPreset:v8];
}

- (void)addConfigurationPreset:(id)a3
{
  id v4 = a3;
  id v8 = [(AVTAvatarConfiguration *)self presetsStorage];
  uint64_t v5 = [v4 settingKind];
  uint64_t v7 = +[AVTAvatarConfiguration keyForSettingKind:](AVTAvatarConfiguration, "keyForSettingKind:", v5, v6);
  [v8 setObject:v4 forKey:v7];
}

- (void)addColorPreset:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [AVTConfigurationPreset alloc];
  id v9 = [v4 color];
  uint64_t v6 = [v9 settingKind];
  id v8 = -[AVTConfigurationPreset initWithPreset:settingKind:](v5, "initWithPreset:settingKind:", v4, v6, v7);

  [(AVTAvatarConfiguration *)self addConfigurationColorPreset:v8];
}

- (void)addConfigurationColorPreset:(id)a3
{
  id v4 = a3;
  id v8 = [(AVTAvatarConfiguration *)self colorPresetsStorage];
  uint64_t v5 = [v4 settingKind];
  uint64_t v7 = +[AVTAvatarConfiguration keyForSettingKind:](AVTAvatarConfiguration, "keyForSettingKind:", v5, v6);
  [v8 setObject:v4 forKey:v7];
}

- (void)removePresetsForCategory:(int64_t)a3
{
  uint64_t v4 = AVTPresetSettingKind();
  uint64_t v6 = v5;
  id v7 = [(AVTAvatarConfiguration *)self presetsStorage];
  -[AVTAvatarConfiguration removePresetsForSettingKind:storage:](self, "removePresetsForSettingKind:storage:", v4, v6, v7);
}

- (void)removeColorPresetsForSettingKind:(id)a3
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  id v6 = [(AVTAvatarConfiguration *)self colorPresetsStorage];
  -[AVTAvatarConfiguration removePresetsForSettingKind:storage:](self, "removePresetsForSettingKind:storage:", var0, var1, v6);
}

- (void)removePresetsForSettingKind:(id)a3 storage:(id)a4
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __62__AVTAvatarConfiguration_removePresetsForSettingKind_storage___block_invoke;
  v18[3] = &__block_descriptor_48_e49_B32__0__NSString_8__AVTConfigurationPreset_16_B24l;
  v18[4] = var0;
  v18[5] = var1;
  id v7 = [v6 keysOfEntriesPassingTest:v18];
  id v8 = -[AVTConfigurationPreset initWithDefaultPresetForSettingKind:]([AVTConfigurationPreset alloc], "initWithDefaultPresetForSettingKind:", var0, var1);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(v6, "setObject:forKey:", v8, *(void *)(*((void *)&v14 + 1) + 8 * v13++), (void)v14);
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v11);
  }
}

BOOL __62__AVTAvatarConfiguration_removePresetsForSettingKind_storage___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = [a3 settingKind];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  return AVTAvatarSettingKindEqual(v4, v5, v6, v7);
}

- (id)presets
{
  v3 = [(AVTAvatarConfiguration *)self presetsStorage];
  uint64_t v4 = [(AVTAvatarConfiguration *)self presetsForStorage:v3];

  return v4;
}

- (id)colorPresets
{
  v3 = [(AVTAvatarConfiguration *)self colorPresetsStorage];
  uint64_t v4 = [(AVTAvatarConfiguration *)self presetsForStorage:v3];

  return v4;
}

- (id)presetsForStorage:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263EFF980] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = objc_msgSend(v3, "allValues", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (([v10 isDefaultPreset] & 1) == 0)
        {
          uint64_t v11 = [v10 preset];
          [v4 addObject:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  uint64_t v12 = (void *)[v4 copy];
  return v12;
}

- (id)presetForCategory:(int64_t)a3
{
  uint64_t v4 = AVTPresetSettingKind();
  uint64_t v6 = v5;
  uint64_t v7 = [(AVTAvatarConfiguration *)self presetsStorage];
  uint64_t v8 = -[AVTAvatarConfiguration presetForSettingKind:storage:](self, "presetForSettingKind:storage:", v4, v6, v7);
  id v9 = [v8 preset];

  return v9;
}

- (id)colorPresetForSettingKind:(id)a3
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  uint64_t v6 = [(AVTAvatarConfiguration *)self colorPresetsStorage];
  uint64_t v7 = -[AVTAvatarConfiguration presetForSettingKind:storage:](self, "presetForSettingKind:storage:", var0, var1, v6);
  uint64_t v8 = [v7 preset];

  return v8;
}

- (id)presetForSettingKind:(id)a3 storage:(id)a4
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  id v6 = a4;
  uint64_t v7 = objc_msgSend((id)objc_opt_class(), "keyForSettingKind:", var0, var1);
  uint64_t v8 = [v6 objectForKeyedSubscript:v7];

  return v8;
}

- (id)colorConfigurationPresets
{
  v2 = [(AVTAvatarConfiguration *)self colorPresetsStorage];
  id v3 = [v2 allValues];

  return v3;
}

- (id)presetConfigurationPresets
{
  v2 = [(AVTAvatarConfiguration *)self presetsStorage];
  id v3 = [v2 allValues];

  return v3;
}

- (id)configurationPresets
{
  id v3 = [MEMORY[0x263EFF980] array];
  uint64_t v4 = [(AVTAvatarConfiguration *)self presetConfigurationPresets];
  [v3 addObjectsFromArray:v4];

  uint64_t v5 = [(AVTAvatarConfiguration *)self colorConfigurationPresets];
  [v3 addObjectsFromArray:v5];

  id v6 = (void *)[v3 copy];
  return v6;
}

- (id)configurationPresetForSettingKind:(id)a3
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  if (a3.var0) {
    [(AVTAvatarConfiguration *)self colorPresetsStorage];
  }
  else {
  id v6 = [(AVTAvatarConfiguration *)self presetsStorage];
  }
  uint64_t v7 = -[AVTAvatarConfiguration presetForSettingKind:storage:](self, "presetForSettingKind:storage:", var0, var1, v6);

  return v7;
}

- (void)applyToAvatar:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = [(AVTAvatarConfiguration *)self presetsStorage];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __49__AVTAvatarConfiguration_applyToAvatar_animated___block_invoke;
  v13[3] = &unk_263FF1B18;
  id v8 = v6;
  id v14 = v8;
  BOOL v15 = a4;
  [v7 enumerateKeysAndObjectsUsingBlock:v13];

  id v9 = [(AVTAvatarConfiguration *)self colorPresetsStorage];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __49__AVTAvatarConfiguration_applyToAvatar_animated___block_invoke_2;
  v11[3] = &unk_263FF1B40;
  id v12 = v8;
  id v10 = v8;
  [v9 enumerateKeysAndObjectsUsingBlock:v11];
}

void __49__AVTAvatarConfiguration_applyToAvatar_animated___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v11 = a3;
  if ([v11 isDefaultPreset])
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v5 = [v11 preset];
    uint64_t v4 = [v5 preset];
  }
  id v6 = *(void **)(a1 + 32);
  [v11 settingKind];
  id v8 = [v6 presetForCategory:v7];
  if (v8 != v4)
  {
    id v9 = *(void **)(a1 + 32);
    [v11 settingKind];
    [v9 setPreset:v4 forCategory:v10 animated:*(unsigned __int8 *)(a1 + 40)];
  }
}

void __49__AVTAvatarConfiguration_applyToAvatar_animated___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v19 = a3;
  if ([v19 isDefaultPreset])
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v5 = [v19 preset];
    uint64_t v4 = [v5 colorPreset];
  }
  uint64_t v6 = AVTAvatarSettingColorIndexForColorDestination([v19 settingKind]);
  uint64_t v7 = *(void **)(a1 + 32);
  [v19 settingKind];
  uint64_t v9 = [v7 colorPresetForCategory:v8 colorIndex:v6];
  uint64_t v10 = (void *)v9;
  if (v9 | v4)
  {
    id v11 = [(id)v9 name];
    id v12 = [(id)v4 name];
    if ([v11 isEqualToString:v12])
    {
      [v10 variation];
      float v14 = v13;
      [(id)v4 variation];
      float v16 = v15;

      if (v14 == v16) {
        goto LABEL_10;
      }
    }
    else
    {
    }
    long long v17 = *(void **)(a1 + 32);
    [v19 settingKind];
    [v17 setColorPreset:v4 forCategory:v18 colorIndex:v6];
  }
LABEL_10:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  uint64_t v5 = [(AVTAvatarConfiguration *)self presetsStorage];
  uint64_t v6 = [(AVTAvatarConfiguration *)self colorPresetsStorage];
  uint64_t v7 = (void *)[v4 initWithPresets:v5 colorPresets:v6];

  return v7;
}

- (NSString)description
{
  v9.receiver = self;
  v9.super_class = (Class)AVTAvatarConfiguration;
  id v3 = [(AVTAvatarConfiguration *)&v9 description];
  id v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = [(AVTAvatarConfiguration *)self presetsStorage];
  [v4 appendFormat:@" presets: %@", v5];

  uint64_t v6 = [(AVTAvatarConfiguration *)self colorPresetsStorage];
  [v4 appendFormat:@" colorPresets: %@", v6];

  uint64_t v7 = (void *)[v4 copy];
  return (NSString *)v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (AVTAvatarConfiguration *)a3;
  if (v5 == self)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [(AVTAvatarConfiguration *)self presetsStorage];
      if (!v6)
      {
        id v3 = [(AVTAvatarConfiguration *)v5 presetsStorage];
        if (!v3)
        {
LABEL_7:
          uint64_t v10 = [(AVTAvatarConfiguration *)self colorPresetsStorage];
          if (v10
            || ([(AVTAvatarConfiguration *)v5 colorPresetsStorage],
                (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            id v11 = [(AVTAvatarConfiguration *)self colorPresetsStorage];
            id v12 = [(AVTAvatarConfiguration *)v5 colorPresetsStorage];
            char v13 = [v11 isEqual:v12];

            if (v10)
            {
LABEL_16:

              goto LABEL_17;
            }
          }
          else
          {
            char v13 = 1;
          }

          goto LABEL_16;
        }
      }
      uint64_t v7 = [(AVTAvatarConfiguration *)self presetsStorage];
      uint64_t v8 = [(AVTAvatarConfiguration *)v5 presetsStorage];
      int v9 = [v7 isEqual:v8];

      if (v6)
      {

        if (v9) {
          goto LABEL_7;
        }
      }
      else
      {

        if (v9) {
          goto LABEL_7;
        }
      }
    }
    char v13 = 0;
  }
LABEL_17:

  return v13;
}

- (unint64_t)hash
{
  id v3 = [(AVTAvatarConfiguration *)self presetsStorage];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(AVTAvatarConfiguration *)self presetsStorage];
  *((void *)&v6 + 1) = v4;
  *(void *)&long long v6 = [v5 hash];
  uint64_t v7 = [(AVTAvatarConfiguration *)self colorPresetsStorage];
  unint64_t v8 = [v7 hash] ^ (v6 >> 32);

  return v8;
}

- (NSMutableDictionary)presetsStorage
{
  return self->_presetsStorage;
}

- (NSMutableDictionary)colorPresetsStorage
{
  return self->_colorPresetsStorage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorPresetsStorage, 0);
  objc_storeStrong((id *)&self->_presetsStorage, 0);
}

@end