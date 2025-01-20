@interface AVTEditingModelColors
+ (id)buildAllColors;
+ (void)createColorsForPaletteCategory:(int64_t)a3 inCache:(id)a4 withDerivedPaletteCategories:(id)a5;
- (AVTAvatarColorVariationStore)variationStore;
- (AVTEditingModelColors)init;
- (AVTEditingModelColors)initWithStorage:(id)a3 variationStore:(id)a4;
- (BOOL)colorHasDerivedColorDependency:(id)a3;
- (NSDictionary)storage;
- (id)colorForSettingKind:(id)a3 identifier:(id)a4;
- (id)colorsForSettingKind:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setVariationStore:(id)a3;
@end

@implementation AVTEditingModelColors

- (AVTEditingModelColors)init
{
  v3 = objc_alloc_init(AVTAvatarColorVariationStore);
  v4 = [(AVTEditingModelColors *)self initWithStorage:MEMORY[0x263EFFA78] variationStore:v3];

  return v4;
}

- (AVTEditingModelColors)initWithStorage:(id)a3 variationStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVTEditingModelColors;
  v9 = [(AVTEditingModelColors *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_storage, a3);
    objc_storeStrong((id *)&v10->_variationStore, a4);
  }

  return v10;
}

- (id)colorForSettingKind:(id)a3 identifier:(id)a4
{
  int64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  id v7 = a4;
  id v8 = [(AVTEditingModelColors *)self storage];
  v9 = AVTAvatarSettingKindIdentifier(var0, var1);
  v10 = [v8 objectForKeyedSubscript:v9];
  v11 = [v10 objectForKeyedSubscript:v7];

  return v11;
}

- (id)colorsForSettingKind:(id)a3
{
  int64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  v5 = [(AVTEditingModelColors *)self storage];
  v6 = AVTAvatarSettingKindIdentifier(var0, var1);
  id v7 = [v5 objectForKeyedSubscript:v6];
  id v8 = [v7 allValues];
  v9 = [v8 sortedArrayUsingComparator:&__block_literal_global_32];
  v10 = (void *)[v9 copy];

  return v10;
}

uint64_t __46__AVTEditingModelColors_colorsForSettingKind___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = NSNumber;
  id v5 = a3;
  v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(a2, "order"));
  id v7 = NSNumber;
  uint64_t v8 = [v5 order];

  v9 = [v7 numberWithUnsignedInteger:v8];
  uint64_t v10 = [v6 compare:v9];

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [AVTEditingModelColors alloc];
  id v5 = [(AVTEditingModelColors *)self storage];
  v6 = objc_msgSend(v5, "_avtui_deepCopy");
  id v7 = [(AVTEditingModelColors *)self variationStore];
  uint64_t v8 = [(AVTEditingModelColors *)v4 initWithStorage:v6 variationStore:v7];

  return v8;
}

+ (id)buildAllColors
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = objc_alloc_init(AVTMutableEditingModelColors);
  v4 = +[AVTEditingModelMappings paletteCategories];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(a1, "createColorsForPaletteCategory:inCache:withDerivedPaletteCategories:", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "integerValue"), v3, v4);
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  v9 = (void *)[(AVTMutableEditingModelColors *)v3 copy];

  return v9;
}

+ (void)createColorsForPaletteCategory:(int64_t)a3 inCache:(id)a4 withDerivedPaletteCategories:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  v19 = __93__AVTEditingModelColors_createColorsForPaletteCategory_inCache_withDerivedPaletteCategories___block_invoke;
  v20 = &unk_263FF2F50;
  id v10 = v8;
  id v21 = v10;
  id v11 = v9;
  id v22 = v11;
  id v23 = a1;
  int64_t v24 = a3;
  long long v12 = (void (**)(void, void, void, void))MEMORY[0x210530210](&v17);
  for (uint64_t i = 0; i != 3; ++i)
  {
    long long v14 = objc_msgSend(MEMORY[0x263F296A8], "colorPresetsForCategory:colorIndex:", a3, i, v17, v18, v19, v20);
    uint64_t v15 = AVTColorSettingKind(a3, i);
    ((void (**)(void, void *, uint64_t, uint64_t))v12)[2](v12, v14, v15, v16);
  }
}

void __93__AVTEditingModelColors_createColorsForPaletteCategory_inCache_withDerivedPaletteCategories___block_invoke(id *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obj = a2;
  uint64_t v7 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v54;
    uint64_t v44 = *MEMORY[0x263EFF498];
    v46 = a1;
    uint64_t v38 = *(void *)v54;
    uint64_t v39 = a4;
    do
    {
      uint64_t v11 = 0;
      uint64_t v40 = v8;
      do
      {
        if (*(void *)v54 != v10) {
          objc_enumerationMutation(obj);
        }
        long long v12 = *(void **)(*((void *)&v53 + 1) + 8 * v11);
        id v13 = a1[4];
        long long v14 = [v12 name];
        uint64_t v15 = objc_msgSend(v13, "colorForSettingKind:identifier:", a3, a4, v14);

        if (!v15)
        {
          uint64_t v42 = v11;
          uint64_t v43 = v9;
          uint64_t v16 = [MEMORY[0x263EFF9A0] dictionary];
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          id v17 = a1[5];
          uint64_t v18 = v12;
          uint64_t v48 = [v17 countByEnumeratingWithState:&v49 objects:v57 count:16];
          if (v48)
          {
            uint64_t v47 = *(void *)v50;
            v45 = v16;
            do
            {
              for (uint64_t i = 0; i != v48; ++i)
              {
                if (*(void *)v50 != v47) {
                  objc_enumerationMutation(v17);
                }
                v20 = *(void **)(*((void *)&v49 + 1) + 8 * i);
                uint64_t v21 = [v20 integerValue];
                id v22 = [v18 derivedColorNameForPresetCategory:v21];
                if ([v22 length])
                {
                  id v23 = objc_msgSend(a1[4], "colorForSettingKind:identifier:", a3, v21, v22);

                  if (!v23) {
                    [a1[6] createColorsForPaletteCategory:v21 inCache:a1[4] withDerivedPaletteCategories:a1[5]];
                  }
                  int64_t v24 = objc_msgSend(a1[4], "colorForSettingKind:identifier:", a3, v21, v22);
                  if (!v24)
                  {
                    id v25 = v17;
                    v26 = v18;
                    uint64_t v27 = a3;
                    v28 = (void *)MEMORY[0x263EFF940];
                    v29 = [NSNumber numberWithInteger:v21];
                    v30 = [NSNumber numberWithInteger:v46[7]];
                    v31 = v28;
                    a3 = v27;
                    uint64_t v18 = v26;
                    id v17 = v25;
                    [v31 raise:v44, @"Couldn't create the derived color for name %@ in palette category %@ parent category %@", v22, v29, v30 format];

                    uint64_t v16 = v45;
                    a1 = v46;
                  }
                  [v16 setObject:v24 forKeyedSubscript:v20];
                }
              }
              uint64_t v48 = [v17 countByEnumeratingWithState:&v49 objects:v57 count:16];
            }
            while (v48);
          }

          v32 = [AVTCoreModelColor alloc];
          v33 = v18;
          a4 = v39;
          v34 = -[AVTCoreModelColor initWithColorPreset:settingKind:order:derivedColorsByCategories:](v32, "initWithColorPreset:settingKind:order:derivedColorsByCategories:", v33, a3, v39, v43, v16);
          v35 = v16;
          id v36 = v46[4];
          v37 = [(AVTCoreModelColor *)v34 identifier];
          objc_msgSend(v36, "setColor:forSettingKind:identifier:", v34, a3, v39, v37);

          uint64_t v9 = v43 + 1;
          a1 = v46;
          uint64_t v10 = v38;
          uint64_t v8 = v40;
          uint64_t v11 = v42;
        }
        ++v11;
      }
      while (v11 != v8);
      uint64_t v8 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
    }
    while (v8);
  }
}

- (BOOL)colorHasDerivedColorDependency:(id)a3
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  uint64_t v5 = [(AVTEditingModelColors *)self storage];
  uint64_t v6 = [v5 allKeys];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v52;
    uint64_t v39 = v6;
    id v36 = self;
    uint64_t v34 = *(void *)v52;
    do
    {
      uint64_t v9 = 0;
      uint64_t v35 = v7;
      do
      {
        if (*(void *)v52 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v40 = v9;
        uint64_t v10 = *(void *)(*((void *)&v51 + 1) + 8 * v9);
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        uint64_t v11 = [(AVTEditingModelColors *)self storage];
        long long v12 = [v11 objectForKeyedSubscript:v10];
        id v13 = [v12 allKeys];

        uint64_t v41 = [v13 countByEnumeratingWithState:&v47 objects:v56 count:16];
        if (v41)
        {
          uint64_t v14 = *(void *)v48;
          uint64_t v37 = *(void *)v48;
          uint64_t v38 = v10;
          uint64_t v42 = v13;
          do
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v48 != v14) {
                objc_enumerationMutation(v13);
              }
              uint64_t v16 = *(void *)(*((void *)&v47 + 1) + 8 * v15);
              id v17 = [(AVTEditingModelColors *)self storage];
              uint64_t v18 = [v17 objectForKeyedSubscript:v10];
              v19 = [v18 objectForKeyedSubscript:v16];

              v20 = (void *)MEMORY[0x21052FFD0]();
              long long v43 = 0u;
              long long v44 = 0u;
              long long v45 = 0u;
              long long v46 = 0u;
              uint64_t v21 = [v19 derivedColorsByCategories];
              id v22 = [v21 allValues];

              uint64_t v23 = [v22 countByEnumeratingWithState:&v43 objects:v55 count:16];
              if (v23)
              {
                uint64_t v24 = v23;
                uint64_t v25 = *(void *)v44;
                while (2)
                {
                  for (uint64_t i = 0; i != v24; ++i)
                  {
                    if (*(void *)v44 != v25) {
                      objc_enumerationMutation(v22);
                    }
                    uint64_t v27 = *(void **)(*((void *)&v43 + 1) + 8 * i);
                    [v27 settingKind];
                    uint64_t v29 = v28;
                    [v4 settingKind];
                    if (v29 == v30)
                    {
                      uint64_t v31 = [v27 settingKind];
                      if (v31 == [v4 settingKind])
                      {

                        BOOL v32 = 1;
                        uint64_t v6 = v39;
                        goto LABEL_27;
                      }
                    }
                  }
                  uint64_t v24 = [v22 countByEnumeratingWithState:&v43 objects:v55 count:16];
                  if (v24) {
                    continue;
                  }
                  break;
                }
              }

              ++v15;
              id v13 = v42;
              self = v36;
              uint64_t v14 = v37;
              uint64_t v10 = v38;
            }
            while (v15 != v41);
            uint64_t v6 = v39;
            uint64_t v8 = v34;
            uint64_t v41 = [v42 countByEnumeratingWithState:&v47 objects:v56 count:16];
          }
          while (v41);
        }

        uint64_t v9 = v40 + 1;
      }
      while (v40 + 1 != v35);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v51 objects:v57 count:16];
      BOOL v32 = 0;
    }
    while (v7);
  }
  else
  {
    BOOL v32 = 0;
  }
LABEL_27:

  return v32;
}

- (AVTAvatarColorVariationStore)variationStore
{
  return self->_variationStore;
}

- (void)setVariationStore:(id)a3
{
}

- (NSDictionary)storage
{
  return self->_storage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_variationStore, 0);
}

@end