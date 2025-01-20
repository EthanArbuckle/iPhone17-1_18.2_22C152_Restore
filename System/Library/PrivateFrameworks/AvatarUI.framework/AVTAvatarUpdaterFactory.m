@interface AVTAvatarUpdaterFactory
+ (id)updaterForAggregatingUpdaters:(id)a3;
+ (id)updaterForClearingColorsForCategory:(int64_t)a3 destination:(int64_t)a4;
+ (id)updaterForColor:(id)a3 colorsState:(id)a4 pairedColors:(id)a5 additionalColor:(id)a6;
+ (id)updaterForColor:(id)a3 colorsState:(id)a4 pairedColors:(id)a5 additionalColor:(id)a6 saveToColorsState:(BOOL)a7;
+ (id)updaterForColor:(id)a3 variationOverride:(id)a4 colorsState:(id)a5 pairedColors:(id)a6 additionalColor:(id)a7 saveToColorsState:(BOOL)a8;
+ (id)updaterForPairingCategory:(id)a3 colorsState:(id)a4;
+ (id)updaterForPreset:(id)a3 pairedPreset:(id)a4;
@end

@implementation AVTAvatarUpdaterFactory

+ (id)updaterForPreset:(id)a3 pairedPreset:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __57__AVTAvatarUpdaterFactory_updaterForPreset_pairedPreset___block_invoke;
  v11[3] = &unk_263FF2270;
  id v12 = v5;
  id v13 = v6;
  id v7 = v6;
  id v8 = v5;
  v9 = (void *)[v11 copy];

  return v9;
}

void __57__AVTAvatarUpdaterFactory_updaterForPreset_pairedPreset___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 addPreset:*(void *)(a1 + 32)];
  if (*(void *)(a1 + 40)) {
    objc_msgSend(v3, "addPreset:");
  }
}

+ (id)updaterForColor:(id)a3 colorsState:(id)a4 pairedColors:(id)a5 additionalColor:(id)a6
{
  return (id)[a1 updaterForColor:a3 colorsState:a4 pairedColors:a5 additionalColor:a6 saveToColorsState:1];
}

+ (id)updaterForColor:(id)a3 colorsState:(id)a4 pairedColors:(id)a5 additionalColor:(id)a6 saveToColorsState:(BOOL)a7
{
  return (id)[a1 updaterForColor:a3 variationOverride:0 colorsState:a4 pairedColors:a5 additionalColor:a6 saveToColorsState:a7];
}

+ (id)updaterForColor:(id)a3 variationOverride:(id)a4 colorsState:(id)a5 pairedColors:(id)a6 additionalColor:(id)a7 saveToColorsState:(BOOL)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __120__AVTAvatarUpdaterFactory_updaterForColor_variationOverride_colorsState_pairedColors_additionalColor_saveToColorsState___block_invoke;
  v25[3] = &unk_263FF22C0;
  id v26 = v14;
  id v27 = v13;
  BOOL v31 = a8;
  id v28 = v15;
  id v29 = v16;
  id v30 = v17;
  id v18 = v17;
  id v19 = v16;
  id v20 = v15;
  id v21 = v13;
  id v22 = v14;
  v23 = (void *)[v25 copy];

  return v23;
}

void __120__AVTAvatarUpdaterFactory_updaterForColor_variationOverride_colorsState_pairedColors_additionalColor_saveToColorsState___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    v4 = [*(id *)(a1 + 40) baseColorPreset];
    [*(id *)(a1 + 32) floatValue];
    id v5 = objc_msgSend(v4, "colorPresetWithVariation:");

    id v6 = [[AVTCoreModelColorVariation alloc] initWithColor:*(void *)(a1 + 40) colorPreset:v5];
  }
  else
  {
    id v5 = [*(id *)(a1 + 48) variationStore];
    id v6 = [v5 colorVariationFromColor:*(void *)(a1 + 40)];
  }
  id v7 = v6;

  [v3 addColorPreset:v7];
  if (*(unsigned char *)(a1 + 72))
  {
    id v8 = *(void **)(a1 + 48);
    v9 = [(AVTCoreModelColorVariation *)v7 colorPreset];
    [v8 setSelectedColorPreset:v9 forCoreModelColor:*(void *)(a1 + 40)];
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = *(id *)(a1 + 56);
  uint64_t v10 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v38 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v37 + 1) + 8 * i);
        if (v14)
        {
          id v15 = v3;
          id v16 = [*(id *)(*((void *)&v37 + 1) + 8 * i) baseColorPreset];
          id v17 = v7;
          [(AVTCoreModelColorVariation *)v7 colorPreset];
          v19 = uint64_t v18 = a1;
          [v19 variation];
          id v20 = objc_msgSend(v16, "colorPresetWithVariation:");

          a1 = v18;
          if (*(unsigned char *)(v18 + 72)) {
            [*(id *)(v18 + 48) setSelectedColorPreset:v20 forCoreModelColor:v14];
          }
          id v21 = [[AVTCoreModelColorVariation alloc] initWithColor:v14 colorPreset:v20];
          id v3 = v15;
          [v15 addColorPreset:v21];

          id v7 = v17;
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v11);
  }

  id v22 = *(void **)(a1 + 64);
  if (v22)
  {
    v23 = [v22 baseColorPreset];
    v24 = [(AVTCoreModelColorVariation *)v7 colorPreset];
    [v24 variation];
    v25 = objc_msgSend(v23, "colorPresetWithVariation:");

    id v26 = [[AVTCoreModelColorVariation alloc] initWithColor:*(void *)(a1 + 64) colorPreset:v25];
    [v3 addColorPreset:v26];
  }
  id v27 = [*(id *)(a1 + 40) derivedColorsByCategories];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __120__AVTAvatarUpdaterFactory_updaterForColor_variationOverride_colorsState_pairedColors_additionalColor_saveToColorsState___block_invoke_2;
  v31[3] = &unk_263FF2298;
  id v32 = *(id *)(a1 + 40);
  v33 = v7;
  char v36 = *(unsigned char *)(a1 + 72);
  id v34 = *(id *)(a1 + 48);
  id v35 = v3;
  id v28 = v3;
  id v29 = v7;
  [v27 enumerateKeysAndObjectsUsingBlock:v31];
}

void __120__AVTAvatarUpdaterFactory_updaterForColor_variationOverride_colorsState_pairedColors_additionalColor_saveToColorsState___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a3;
  [a2 integerValue];
  [*(id *)(a1 + 32) settingKind];
  id v5 = [v9 baseColorPreset];
  id v6 = [*(id *)(a1 + 40) colorPreset];
  [v6 variation];
  id v7 = objc_msgSend(v5, "colorPresetWithVariation:");

  if (*(unsigned char *)(a1 + 64)) {
    [*(id *)(a1 + 48) setSelectedColorPreset:v7 forCoreModelColor:v9];
  }
  id v8 = [[AVTCoreModelColorVariation alloc] initWithColor:v9 colorPreset:v7];
  [*(id *)(a1 + 56) addColorPreset:v8];
}

+ (id)updaterForPairingCategory:(id)a3 colorsState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __65__AVTAvatarUpdaterFactory_updaterForPairingCategory_colorsState___block_invoke;
  v12[3] = &unk_263FF22E8;
  id v14 = v7;
  id v15 = a1;
  id v13 = v6;
  id v8 = v7;
  id v9 = v6;
  uint64_t v10 = (void *)[v12 copy];

  return v10;
}

void __65__AVTAvatarUpdaterFactory_updaterForPairingCategory_colorsState___block_invoke(uint64_t a1, void *a2)
{
  v23[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) pairing];
  if (v4)
  {
    id v22 = v4;
    uint64_t v5 = [v4 pairedCategory];
    id v6 = objc_msgSend(v3, "presetForCategory:", objc_msgSend(*(id *)(a1 + 32), "presetCategory"));
    id v20 = (void *)[v6 copyForPairedCategory:v5];
    id v21 = v6;
    objc_msgSend(*(id *)(a1 + 48), "updaterForPreset:pairedPreset:", v6);
    id v7 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id))v7)[2](v7, v3);

    for (uint64_t i = 0; i != 3; ++i)
    {
      uint64_t v9 = AVTColorSettingKind([*(id *)(a1 + 32) presetCategory], i);
      uint64_t v11 = objc_msgSend(v3, "colorPresetForSettingKind:", v9, v10);
      uint64_t v12 = v11;
      if (v11)
      {
        id v13 = [v11 color];
        id v14 = (void *)[v13 copyForPairedCategory:v5];

        id v15 = *(void **)(a1 + 48);
        id v16 = [v12 color];
        uint64_t v17 = *(void *)(a1 + 40);
        v23[0] = v14;
        uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
        id v19 = [v15 updaterForColor:v16 colorsState:v17 pairedColors:v18 additionalColor:0];
        ((void (**)(void, id))v19)[2](v19, v3);
      }
    }

    v4 = v22;
  }
}

+ (id)updaterForClearingColorsForCategory:(int64_t)a3 destination:(int64_t)a4
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __75__AVTAvatarUpdaterFactory_updaterForClearingColorsForCategory_destination___block_invoke;
  v6[3] = &__block_descriptor_48_e32_v16__0__AVTAvatarConfiguration_8l;
  v6[4] = a3;
  v6[5] = a4;
  v4 = (void *)[v6 copy];
  return v4;
}

uint64_t __75__AVTAvatarUpdaterFactory_updaterForClearingColorsForCategory_destination___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeColorPresetsForSettingKind:", *(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (id)updaterForAggregatingUpdaters:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__AVTAvatarUpdaterFactory_updaterForAggregatingUpdaters___block_invoke;
  v7[3] = &unk_263FF2330;
  id v8 = v3;
  id v4 = v3;
  uint64_t v5 = (void *)[v7 copy];

  return v5;
}

void __57__AVTAvatarUpdaterFactory_updaterForAggregatingUpdaters___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v8) + 16))(*(void *)(*((void *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

@end