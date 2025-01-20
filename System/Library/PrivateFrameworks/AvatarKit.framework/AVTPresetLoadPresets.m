@interface AVTPresetLoadPresets
@end

@implementation AVTPresetLoadPresets

void ____AVTPresetLoadPresets_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = AVTPresetCategoryFromString(a2);
  uint64_t v6 = AVTPresetCategoryToComponentType(v5);
  if (!gPresets[v5])
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
    v8 = (void *)gPresets[v5];
    gPresets[v5] = v7;
  }
  if (v5 != 40)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = ____AVTPresetLoadPresets_block_invoke_2;
    v9[3] = &__block_descriptor_48_e29_v32__0__NSDictionary_8Q16_B24l;
    v9[4] = v5;
    v9[5] = v6;
    [v4 enumerateObjectsUsingBlock:v9];
  }
}

void ____AVTPresetLoadPresets_block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  v60[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = objc_alloc_init(AVTPreset);
  uint64_t v7 = [v5 objectForKeyedSubscript:@"identifier"];
  identifier = v6->_identifier;
  v6->_identifier = (NSString *)v7;

  if (!v6->_identifier)
  {
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"preset %d", a3);
    v10 = v6->_identifier;
    v6->_identifier = (NSString *)v9;
  }
  v6->_category = *(void *)(a1 + 32);
  v51 = [v5 objectForKeyedSubscript:@"asset"];
  if (v51 && ([v51 isEqualToString:@"none"] & 1) == 0)
  {
    v11 = +[AVTAssetLibrary sharedAssetLibrary];
    v12 = [v11 assetWithType:*(void *)(a1 + 40) identifier:v51];

    if (v12)
    {
      v60[0] = v12;
      uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v60 count:1];
      assets = v6->_assets;
      v6->_assets = (NSArray *)v13;

      v6->_unint64_t editableColorCount = [v12 editableColorCount];
      [(AVTPreset *)v6 rebuildSpecializationSettings];
    }
    else
    {
      v15 = avt_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v59 = v51;
        _os_log_impl(&dword_20B819000, v15, OS_LOG_TYPE_DEFAULT, "failed to find asset named %@", buf, 0xCu);
      }
    }
  }
  v16 = [v5 objectForKeyedSubscript:@"assets"];
  v17 = v16;
  if (v16 && [v16 count])
  {
    v52 = v6;
    id v50 = v5;
    objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v17, "count"));
    v18 = (NSArray *)objc_claimAutoreleasedReturnValue();
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    v49 = v17;
    id v19 = v17;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v53 objects:v57 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v54 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v53 + 1) + 8 * i);
          v25 = +[AVTAssetLibrary sharedAssetLibrary];
          v26 = [v25 assetWithType:*(void *)(a1 + 40) identifier:v24];

          if (v26)
          {
            unint64_t editableColorCount = v52->_editableColorCount;
            unint64_t v28 = [v26 editableColorCount];
            if (editableColorCount <= v28) {
              unint64_t v29 = v28;
            }
            else {
              unint64_t v29 = editableColorCount;
            }
            v52->_unint64_t editableColorCount = v29;
            [(NSArray *)v18 addObject:v26];
          }
          else
          {
            v30 = avt_default_log();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v59 = v51;
              _os_log_impl(&dword_20B819000, v30, OS_LOG_TYPE_DEFAULT, "failed to find asset named %@", buf, 0xCu);
            }
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v53 objects:v57 count:16];
      }
      while (v21);
    }

    uint64_t v6 = v52;
    v31 = v52->_assets;
    v52->_assets = v18;

    [(AVTPreset *)v52 rebuildSpecializationSettings];
    v17 = v49;
    id v5 = v50;
  }
  uint64_t v32 = [v5 objectForKeyedSubscript:@"morphVariant"];
  morphVariant = v6->_morphVariant;
  v6->_morphVariant = (NSString *)v32;

  uint64_t v34 = [v5 objectForKeyedSubscript:@"imageVariant"];
  imageVariant = v6->_imageVariant;
  v6->_imageVariant = (NSString *)v34;

  uint64_t v36 = [v5 objectForKeyedSubscript:@"materialVariant"];
  materialVariant = v6->_materialVariant;
  v6->_materialVariant = (NSString *)v36;

  v38 = [v5 objectForKeyedSubscript:@"morphVariantIntensity"];
  v39 = v38;
  if (v38) {
    [v38 floatValue];
  }
  else {
    float v40 = 1.0;
  }
  v6->_morphVariantIntensity = v40;
  v41 = [v5 objectForKeyedSubscript:@"bodyPoseVariantIntensity"];
  v42 = v41;
  if (v41) {
    [v41 floatValue];
  }
  else {
    float v43 = 0.0;
  }
  v6->_bodyPoseVariantIntensity = v43;
  v44 = [v5 objectForKeyedSubscript:@"textureAssetPresence"];
  v45 = v44;
  if (v44) {
    [v44 floatValue];
  }
  else {
    float v46 = 1.0;
  }
  v6->_textureAssetPresence = v46;
  uint64_t v47 = [v5 objectForKeyedSubscript:@"tags"];
  tags = v6->_tags;
  v6->_tags = (NSDictionary *)v47;

  [(id)gPresets[*(void *)(a1 + 32)] addObject:v6];
}

void ____AVTPresetLoadPresets_block_invoke_359(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = AVTPresetCategoryFromString(a2);
  if (v5 != 40)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = ____AVTPresetLoadPresets_block_invoke_2_362;
    v6[3] = &__block_descriptor_40_e29_v32__0__NSDictionary_8Q16_B24l;
    v6[4] = v5;
    [v4 enumerateObjectsUsingBlock:v6];
  }
}

void ____AVTPresetLoadPresets_block_invoke_2_362(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = (void *)gPresets[*(void *)(a1 + 32)];
  id v5 = a2;
  uint64_t v6 = [v4 objectAtIndex:a3];
  uint64_t v7 = [v5 objectForKeyedSubscript:@"variantDependencies-morph"];
  v8 = (void *)v6[11];
  v6[11] = v7;

  uint64_t v9 = [v5 objectForKeyedSubscript:@"variantDependencies-image"];
  v10 = (void *)v6[12];
  v6[12] = v9;

  uint64_t v11 = [v5 objectForKeyedSubscript:@"variantDependencies-material"];
  v12 = (void *)v6[13];
  v6[13] = v11;

  uint64_t v13 = [v5 objectForKeyedSubscript:@"dependencies"];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = ____AVTPresetLoadPresets_block_invoke_3;
  v15[3] = &unk_264020818;
  id v16 = v6;
  v14 = v6;
  [v13 enumerateKeysAndObjectsUsingBlock:v15];
}

void ____AVTPresetLoadPresets_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = AVTPresetCategoryFromString(v5);
  if (v7 == 40)
  {
    v8 = avt_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      ____AVTPresetLoadPresets_block_invoke_3_cold_1((uint64_t)v5, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  else
  {
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v33 = ____AVTPresetLoadPresets_block_invoke_375;
    uint64_t v34 = &unk_264020E98;
    uint64_t v37 = v7;
    v35 = *(id *)(a1 + 32);
    id v15 = v5;
    id v36 = v15;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v33(v32, v6);
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = v6;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v38 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v29;
          do
          {
            uint64_t v20 = 0;
            do
            {
              if (*(void *)v29 != v19) {
                objc_enumerationMutation(v16);
              }
              v33(v32, *(void **)(*((void *)&v28 + 1) + 8 * v20++));
            }
            while (v18 != v20);
            uint64_t v18 = [v16 countByEnumeratingWithState:&v28 objects:v38 count:16];
          }
          while (v18);
        }
      }
      else
      {
        uint64_t v21 = avt_default_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          ____AVTPresetLoadPresets_block_invoke_3_cold_2((uint64_t)v15, v21, v22, v23, v24, v25, v26, v27);
        }
      }
    }

    v8 = v35;
  }
}

void ____AVTPresetLoadPresets_block_invoke_375(void *a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:@"preset"];
  if (v4)
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v5 = (id)gPresets[a1[6]];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v42;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v42 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v41 + 1) + 8 * v9);
        uint64_t v11 = objc_msgSend(v10, "identifier", (void)v41);
        char v12 = [v11 isEqualToString:v4];

        if (v12) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v41 objects:v45 count:16];
          if (v7) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v13 = v10;

      if (v13) {
        goto LABEL_16;
      }
    }
    else
    {
LABEL_10:
    }
    uint64_t v14 = avt_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      ____AVTPresetLoadPresets_block_invoke_375_cold_2(v14, v15, v16, v17, v18, v19, v20, v21);
    }
  }
  id v13 = 0;
LABEL_16:
  uint64_t v22 = objc_msgSend(v3, "objectForKeyedSubscript:", @"morphVariant", (void)v41);
  uint64_t v23 = [v3 objectForKeyedSubscript:@"imageVariant"];
  uint64_t v24 = [v3 objectForKeyedSubscript:@"materialVariant"];
  uint64_t v25 = [v3 objectForKeyedSubscript:@"visibilityVariant"];
  uint64_t v26 = [v3 objectForKeyedSubscript:@"morphVariantIntensity"];
  uint64_t v27 = v26;
  if (v26)
  {
    [v26 floatValue];
    float v29 = v28;
    if (v13) {
      goto LABEL_24;
    }
LABEL_20:
    if (!v22 && !v23 && !v24 && !v25) {
      goto LABEL_29;
    }
    goto LABEL_24;
  }
  float v29 = 1.0;
  if (!v13) {
    goto LABEL_20;
  }
LABEL_24:
  long long v30 = objc_alloc_init(AVTPresetDependency);
  long long v31 = (float *)v30;
  if (v30)
  {
    v30->_category = a1[6];
    -[AVTPhysicsRig setChainRoot:]((uint64_t)v30, v13);
    -[AVTPhysicsRig setPhysicsBody:]((uint64_t)v31, v22);
    v31[2] = v29;
  }
  else
  {
    -[AVTPhysicsRig setChainRoot:](0, v13);
    -[AVTPhysicsRig setPhysicsBody:](0, v22);
  }
  -[AVTPhysicsRig setPhysicsBehavior:]((uint64_t)v31, v23);
  -[AVTPresetDependency setMaterialVariant:]((uint64_t)v31, v24);
  -[AVTPresetDependency setVisibilityRules:]((uint64_t)v31, v25);
  uint64_t v32 = *(void **)(a1[4] + 80);
  if (!v32)
  {
    id v33 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v34 = a1[4];
    v35 = *(void **)(v34 + 80);
    *(void *)(v34 + 80) = v33;

    uint64_t v32 = *(void **)(a1[4] + 80);
  }
  [v32 addObject:v31];

LABEL_29:
  id v36 = [v3 objectForKeyedSubscript:@"preset-per-identifier"];
  if (v36)
  {
    uint64_t v37 = *(void **)(a1[4] + 112);
    if (!v37)
    {
      id v38 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      uint64_t v39 = a1[4];
      float v40 = *(void **)(v39 + 112);
      *(void *)(v39 + 112) = v38;

      uint64_t v37 = *(void **)(a1[4] + 112);
    }
    [v37 objectForKeyedSubscript:a1[5]];
    if (objc_claimAutoreleasedReturnValue()) {
      ____AVTPresetLoadPresets_block_invoke_375_cold_1();
    }
    [*(id *)(a1[4] + 112) setObject:v36 forKeyedSubscript:a1[5]];
  }
}

void ____AVTPresetLoadPresets_block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ____AVTPresetLoadPresets_block_invoke_3_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ____AVTPresetLoadPresets_block_invoke_375_cold_1()
{
  __assert_rtn("__AVTPresetLoadPresets_block_invoke", "AVTPreset.m", 731, "preset->_presetSpecificPresetDependencies[dependencyCategoryString] == nil");
}

void ____AVTPresetLoadPresets_block_invoke_375_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end