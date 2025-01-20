@interface AVTPreset
+ (AVTPreset)presetWithCategory:(int64_t)a3 identifier:(id)a4;
+ (id)availablePresetsForCategory:(int64_t)a3;
+ (id)colorPresetsForCategory:(int64_t)a3;
+ (id)colorPresetsForCategory:(int64_t)a3 colorIndex:(unint64_t)a4;
+ (id)secondaryColorPresetsForCategory:(int64_t)a3;
+ (unint64_t)editableColorCountForCategory:(int64_t)a3;
- (BOOL)hasComponent;
- (NSDictionary)specializationSettings;
- (NSDictionary)tags;
- (NSString)displayableName;
- (NSString)identifier;
- (NSString)localizedName;
- (NSString)localizedPairedName;
- (id)assets;
- (id)cache;
- (id)description;
- (int64_t)category;
- (unint64_t)editableColorCount;
- (void)applyPresetByChangingComponentsOfMemoji:(id)a3 animated:(BOOL)a4;
- (void)enumerateAssetSpecificVariantDependenciesOfKind:(unint64_t)a3 block:(id)a4;
- (void)enumeratePresetDependencies:(id)a3;
- (void)enumeratePresetSpecificPresetDependencies:(id)a3;
- (void)enumerateVariantDependenciesOfKind:(unint64_t)a3 block:(id)a4;
- (void)enumerateVisibilityDependencies:(id)a3;
- (void)rebuildSpecializationSettings;
@end

@implementation AVTPreset

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = AVTPresetCategoryToString(self->_category);
  v7 = [v3 stringWithFormat:@"<%@: %p category=%@ identifier=%@>", v5, self, v6, self->_identifier];

  return v7;
}

+ (id)availablePresetsForCategory:(int64_t)a3
{
  if (AVTPresetLoadPresetsIfNeeded_onceToken != -1) {
    dispatch_once(&AVTPresetLoadPresetsIfNeeded_onceToken, &__block_literal_global_316);
  }
  v4 = (void *)gPresets[a3];
  return v4;
}

+ (AVTPreset)presetWithCategory:(int64_t)a3 identifier:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a4;
  [a1 availablePresetsForCategory:a3];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "identifier", (void)v15);
        char v13 = [v12 isEqualToString:v6];

        if (v13)
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }
      id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (AVTPreset *)v8;
}

- (int64_t)category
{
  return self->_category;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)displayableName
{
  return self->_identifier;
}

- (NSString)localizedName
{
  return (NSString *)AVTLocalizedPresetString(self->_category, self->_identifier);
}

- (NSString)localizedPairedName
{
  return (NSString *)AVTLocalizedPresetPairString(self->_category, self->_identifier);
}

- (BOOL)hasComponent
{
  return [(NSArray *)self->_assets count]
      || self->_morphVariant
      || self->_imageVariant
      || self->_materialVariant != 0;
}

- (id)assets
{
  return self->_assets;
}

- (void)enumeratePresetDependencies:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = self->_dependencies;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        if (v10 && *(void *)(v10 + 24)) {
          (*((void (**)(id, void, void))v4 + 2))(v4, *(void *)(v10 + 16), *(void *)(v10 + 24));
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v11 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v7 = v11;
    }
    while (v11);
  }
}

- (void)enumerateVisibilityDependencies:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = self->_dependencies;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        if (v10 && *(void *)(v10 + 56)) {
          (*((void (**)(id, void, void))v4 + 2))(v4, *(void *)(v10 + 16), *(void *)(v10 + 56));
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v11 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v7 = v11;
    }
    while (v11);
  }
}

- (void)enumerateVariantDependenciesOfKind:(unint64_t)a3 block:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v6 = (void (**)(id, uint64_t, uint64_t, float))a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = self->_dependencies;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * v11);
        if (a3 == 2)
        {
          if (v12 && *(void *)(v12 + 48))
          {
            uint64_t v16 = *(void *)(v12 + 16);
            uint64_t v17 = *(void *)(v12 + 48);
            goto LABEL_18;
          }
        }
        else if (a3 == 1)
        {
          if (v12 && *(void *)(v12 + 40))
          {
            uint64_t v16 = *(void *)(v12 + 16);
            uint64_t v17 = *(void *)(v12 + 40);
LABEL_18:
            v6[2](v6, v16, v17, 1.0);
          }
        }
        else if (!a3 && v12 && *(void *)(v12 + 32))
        {
          uint64_t v13 = *(void *)(v12 + 16);
          id v14 = *(id *)(v12 + 32);
          v15.n128_u32[0] = *(_DWORD *)(v12 + 8);
          ((void (*)(void (**)(id, uint64_t, uint64_t, float), uint64_t, id, __n128))v6[2])(v6, v13, v14, v15);
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v18 = [(NSArray *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      uint64_t v9 = v18;
    }
    while (v18);
  }
}

- (void)enumeratePresetSpecificPresetDependencies:(id)a3
{
  id v4 = a3;
  presetSpecificPresetDependencies = self->_presetSpecificPresetDependencies;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__AVTPreset_enumeratePresetSpecificPresetDependencies___block_invoke;
  v7[3] = &unk_26401FA20;
  id v8 = v4;
  id v6 = v4;
  [(NSDictionary *)presetSpecificPresetDependencies enumerateKeysAndObjectsUsingBlock:v7];
}

void __55__AVTPreset_enumeratePresetSpecificPresetDependencies___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = AVTPresetCategoryFromString(a2);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__AVTPreset_enumeratePresetSpecificPresetDependencies___block_invoke_2;
  v7[3] = &unk_26401F9F8;
  uint64_t v9 = v6;
  id v8 = *(id *)(a1 + 32);
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

void __55__AVTPreset_enumeratePresetSpecificPresetDependencies___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = a2;
  id v7 = +[AVTPreset presetWithCategory:v5 identifier:a3];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateAssetSpecificVariantDependenciesOfKind:(unint64_t)a3 block:(id)a4
{
  v25[3] = *MEMORY[0x263EF8340];
  id v6 = a4;
  v25[0] = self->_assetSpecificMorphVariantDependencies;
  v25[1] = self->_assetSpecificImageVariantDependencies;
  v25[2] = self->_assetSpecificMaterialVariantDependencies;
  id v7 = (id)v25[a3];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __67__AVTPreset_enumerateAssetSpecificVariantDependenciesOfKind_block___block_invoke;
  v22[3] = &unk_26401FA20;
  id v8 = v6;
  id v23 = v8;
  [v7 enumerateKeysAndObjectsUsingBlock:v22];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v9 = self->_assets;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __67__AVTPreset_enumerateAssetSpecificVariantDependenciesOfKind_block___block_invoke_3;
        v16[3] = &unk_264020E30;
        id v17 = v8;
        [v14 enumerateVariantDependenciesOfKind:a3 block:v16];
      }
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v11);
  }

  for (uint64_t j = 2; j != -1; --j)
}

void __67__AVTPreset_enumerateAssetSpecificVariantDependenciesOfKind_block___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = AVTComponentTypeFromString(a2);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__AVTPreset_enumerateAssetSpecificVariantDependenciesOfKind_block___block_invoke_2;
  v7[3] = &unk_26401F9F8;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

uint64_t __67__AVTPreset_enumerateAssetSpecificVariantDependenciesOfKind_block___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), a2, a3);
}

uint64_t __67__AVTPreset_enumerateAssetSpecificVariantDependenciesOfKind_block___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (unint64_t)editableColorCountForCategory:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = [a1 availablePresetsForCategory:a3];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        unint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) editableColorCount];
        if (v6 <= v9) {
          unint64_t v6 = v9;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

+ (id)colorPresetsForCategory:(int64_t)a3 colorIndex:(unint64_t)a4
{
  return +[AVTColorPreset colorPresetsForCategory:a3 colorIndex:a4];
}

+ (id)colorPresetsForCategory:(int64_t)a3
{
  return +[AVTColorPreset colorPresetsForCategory:a3];
}

+ (id)secondaryColorPresetsForCategory:(int64_t)a3
{
  return +[AVTColorPreset secondaryColorPresetsForCategory:a3];
}

- (void)applyPresetByChangingComponentsOfMemoji:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v13 = a3;
  uint64_t v6 = AVTPresetCategoryToComponentType(self->_category);
  if ([(NSArray *)self->_assets count] || self->_morphVariant || self->_imageVariant || self->_materialVariant)
  {
    uint64_t v7 = [AVTComponent alloc];
    *(float *)&double v8 = self->_morphVariantIntensity;
    *(float *)&double v9 = self->_bodyPoseVariantIntensity;
    *(float *)&double v10 = self->_textureAssetPresence;
    long long v11 = [(AVTComponent *)v7 initWithType:v6 assets:self->_assets morphVariant:self->_morphVariant imageVariant:self->_imageVariant materialVariant:self->_materialVariant morphVariantIntensity:v8 bodyPoseVariantIntensity:v9 textureAssetPresence:v10];
    [v13 addComponent:v11 animated:v4];

LABEL_6:
    long long v12 = v13;
    goto LABEL_7;
  }
  long long v12 = v13;
  if ((v6 & 0x37) != 0x22)
  {
    [v13 removeComponentWithType:v6];
    goto LABEL_6;
  }
LABEL_7:
}

- (id)cache
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (self->_assets)
  {
    v3 = objc_alloc_init(AVTAssetResourceCache);
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    BOOL v4 = self->_assets;
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          -[AVTAssetResourceCache resourceForAsset:](v3, "resourceForAsset:", *(void *)(*((void *)&v10 + 1) + 8 * v8), (void)v10);

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
  else
  {
    [MEMORY[0x263EFF9D0] null];
    return (id)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)rebuildSpecializationSettings
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  specializationSettings = self->_specializationSettings;
  self->_specializationSettings = 0;

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v4 = self->_assets;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = self->_specializationSettings;
        long long v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v8), "specializationSettings", (void)v13);
        AVTMergeSpecializationSettings(v9, v10);
        long long v11 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        long long v12 = self->_specializationSettings;
        self->_specializationSettings = v11;

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (NSDictionary)tags
{
  return self->_tags;
}

- (NSDictionary)specializationSettings
{
  return (NSDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (unint64_t)editableColorCount
{
  return self->_editableColorCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specializationSettings, 0);
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_presetSpecificPresetDependencies, 0);
  objc_storeStrong((id *)&self->_assetSpecificMaterialVariantDependencies, 0);
  objc_storeStrong((id *)&self->_assetSpecificImageVariantDependencies, 0);
  objc_storeStrong((id *)&self->_assetSpecificMorphVariantDependencies, 0);
  objc_storeStrong((id *)&self->_dependencies, 0);
  objc_storeStrong((id *)&self->_materialVariant, 0);
  objc_storeStrong((id *)&self->_imageVariant, 0);
  objc_storeStrong((id *)&self->_morphVariant, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end