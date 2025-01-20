@interface AVTComponentInstance
- ($3C463231000E010C6CB72584ADC5493D)uvRemappingInfo;
- (AVTComponentInstance)initWithComponent:(id)a3 assetResourceCache:(id)a4;
- (BOOL)has2DAsset;
- (BOOL)has3DAsset;
- (NSString)assetImage;
- (SCNNode)assetNode;
- (id)assetImageForAsset:(id)a3;
- (id)assetImageWithLayerNamed:(id)a3;
- (void)_initializeVariantSkinnerPairsIfNeeded;
- (void)setImageVariant:(id)a3;
- (void)setMaterialVariant:(id)a3;
- (void)setSkinnerVariantIntensity:(float)a3 skeleton:(id)a4;
- (void)setVisibilityRules:(id)a3 dictatedByCategory:(int64_t)a4;
- (void)updateMaterialsWithComponent:(id)a3;
@end

@implementation AVTComponentInstance

- (id)assetImageWithLayerNamed:(id)a3
{
  return [(NSDictionary *)self->_layers objectForKeyedSubscript:a3];
}

- ($3C463231000E010C6CB72584ADC5493D)uvRemappingInfo
{
  uint64_t v3 = v2;
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = self->_assets;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "is2DAsset", (void)v11))
        {
          if (v9)
          {
            [v9 uvRemappingInfo];
          }
          else
          {
            *(_OWORD *)uint64_t v3 = 0u;
            *(_OWORD *)(v3 + 16) = 0u;
          }

          return v10;
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  *(unsigned char *)uint64_t v3 = 0;
  *(void *)(v3 + 8) = 1065353216;
  *(void *)(v3 + 16) = 0x3F80000000000000;
  *(void *)(v3 + 24) = 0;
  return v10;
}

- (AVTComponentInstance)initWithComponent:(id)a3 assetResourceCache:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v40.receiver = self;
  v40.super_class = (Class)AVTComponentInstance;
  v8 = [(AVTComponentInstance *)&v40 init];
  if (!v8) {
    goto LABEL_30;
  }
  v9 = [MEMORY[0x263EFF980] arrayWithCapacity:1];
  uint64_t v10 = [v6 assets];
  assets = v8->_assets;
  v8->_assets = (NSArray *)v10;

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v12 = v8->_assets;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (!v13) {
    goto LABEL_17;
  }
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)v37;
  do
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v37 != v15) {
        objc_enumerationMutation(v12);
      }
      v17 = *(void **)(*((void *)&v36 + 1) + 8 * i);
      uint64_t v18 = [v17 layers];
      layers = v8->_layers;
      v8->_layers = (NSDictionary *)v18;

      if ([v17 is3DAsset])
      {
        uint64_t v20 = [v7 resourceForAsset:v17];
        if (v20)
        {
          assetImage = v20;
          [v9 addObject:v20];
        }
        else
        {
          assetImage = avt_default_log();
          if (os_log_type_enabled(assetImage, OS_LOG_TYPE_ERROR)) {
            -[AVTComponentInstance initWithComponent:assetResourceCache:](v42, &v43, assetImage);
          }
        }
      }
      else
      {
        if (![v17 is2DAsset]) {
          continue;
        }
        uint64_t v22 = [v7 resourceForAsset:v17];
        assetImage = v8->_assetImage;
        v8->_assetImage = (NSString *)v22;
      }
    }
    uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v36 objects:v44 count:16];
  }
  while (v14);
LABEL_17:

  if ([v9 count] == 1)
  {
    uint64_t v23 = [v9 objectAtIndexedSubscript:0];
    assetNode = v8->_assetNode;
    v8->_assetNode = (SCNNode *)v23;
  }
  else if ([v9 count])
  {
    uint64_t v25 = [MEMORY[0x263F16A98] node];
    v26 = v8->_assetNode;
    v8->_assetNode = (SCNNode *)v25;

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    assetNode = v9;
    uint64_t v27 = [(SCNNode *)assetNode countByEnumeratingWithState:&v32 objects:v41 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v33;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v33 != v29) {
            objc_enumerationMutation(assetNode);
          }
          -[SCNNode addChildNode:](v8->_assetNode, "addChildNode:", *(void *)(*((void *)&v32 + 1) + 8 * j), (void)v32);
        }
        uint64_t v28 = [(SCNNode *)assetNode countByEnumeratingWithState:&v32 objects:v41 count:16];
      }
      while (v28);
    }
  }
  else
  {
    assetNode = v8->_assetNode;
    v8->_assetNode = 0;
  }

LABEL_30:
  return v8;
}

- (void)updateMaterialsWithComponent:(id)a3
{
  id v4 = a3;
  assetNode = self->_assetNode;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__AVTComponentInstance_updateMaterialsWithComponent___block_invoke;
  v7[3] = &unk_26401F2B0;
  id v8 = v4;
  id v6 = v4;
  [(SCNNode *)assetNode enumerateHierarchyUsingBlock:v7];
}

void __53__AVTComponentInstance_updateMaterialsWithComponent___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v3 = [a2 geometry];
  id v4 = [v3 materials];

  obuint64_t j = v4;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v34 objects:v46 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v35;
    v31 = &v43;
    uint64_t v32 = a1;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v35 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "name", v31);
        int v11 = [v10 hasPrefix:@"color"];

        if (v11)
        {
          long long v12 = [v9 name];
          uint64_t v13 = [v12 rangeOfString:@"_variant_"];
          if (v13 != 0x7FFFFFFFFFFFFFFFLL
            || (uint64_t v13 = [v12 rangeOfString:@"_alias_"], v13 != 0x7FFFFFFFFFFFFFFFLL))
          {
            uint64_t v14 = [v12 substringToIndex:v13];

            long long v12 = (void *)v14;
          }
          uint64_t v15 = [v12 substringFromIndex:5];
          int v16 = [v15 intValue];

          if (v16)
          {
            uint64_t v17 = v16 - 1;
            uint64_t v18 = [*(id *)(a1 + 32) materialAtIndex:v17];
            if (!v18)
            {
              v19 = avt_default_log();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
                __53__AVTComponentInstance_updateMaterialsWithComponent___block_invoke_cold_1(v44, &v45, v19);
              }
            }
            [v18 applyToSceneKitMaterial:v9];
            uint64_t v20 = [v9 customMaterialAttributeNames];
            v21 = v20;
            if (v16 != 1)
            {
              if ([v20 containsObject:@"primary_color"])
              {
                uint64_t v22 = [*(id *)(a1 + 32) materialAtIndex:0];
                if (!v22)
                {
                  uint64_t v23 = avt_default_log();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
                    __53__AVTComponentInstance_updateMaterialsWithComponent___block_invoke_cold_1(v42, v31, v23);
                  }
                }
                v24 = [v22 baseColor];
                [v9 setValue:v24 forKey:@"primary_color"];

                a1 = v32;
              }
              if (v17 == 1) {
                goto LABEL_43;
              }
            }
            if ([v21 containsObject:@"secondary_color"])
            {
              uint64_t v25 = [*(id *)(a1 + 32) materialAtIndex:1];
              if (!v25)
              {
                v26 = avt_default_log();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
                  __53__AVTComponentInstance_updateMaterialsWithComponent___block_invoke_cold_1(v40, &v41, v26);
                }
              }
              uint64_t v27 = [v25 baseColor];
              [v9 setValue:v27 forKey:@"secondary_color"];

              a1 = v32;
            }
            if (v17 != 2)
            {
LABEL_43:
              if ([v21 containsObject:@"tertiary_color"])
              {
                uint64_t v28 = [*(id *)(a1 + 32) materialAtIndex:2];
                if (!v28)
                {
                  uint64_t v29 = avt_default_log();
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
                    __53__AVTComponentInstance_updateMaterialsWithComponent___block_invoke_cold_1(v38, &v39, v29);
                  }
                }
                v30 = [v28 baseColor];
                [v9 setValue:v30 forKey:@"tertiary_color"];
              }
            }
          }
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v34 objects:v46 count:16];
    }
    while (v6);
  }
}

- (BOOL)has2DAsset
{
  return self->_assetImage != 0;
}

- (NSString)assetImage
{
  assetImageVariant = self->_assetImageVariant;
  if (!assetImageVariant) {
    assetImageVariant = self->_assetImage;
  }
  return assetImageVariant;
}

- (void)setImageVariant:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = [(NSString *)self->_assetImage stringByDeletingLastPathComponent];
    uint64_t v7 = [v6 stringByAppendingPathComponent:v5];
  }
  else
  {
    uint64_t v7 = 0;
  }
  assetImageVariant = self->_assetImageVariant;
  self->_assetImageVariant = v7;
}

- (void)setMaterialVariant:(id)a3
{
  unint64_t v5 = (unint64_t)a3;
  if (self->_assetNode)
  {
    materialVariant = self->_materialVariant;
    if (v5 | (unint64_t)materialVariant)
    {
      if (![(NSString *)materialVariant isEqualToString:v5])
      {
        objc_storeStrong((id *)&self->_materialVariant, a3);
        assetNode = self->_assetNode;
        v8[0] = MEMORY[0x263EF8330];
        v8[1] = 3221225472;
        v8[2] = __43__AVTComponentInstance_setMaterialVariant___block_invoke;
        v8[3] = &unk_26401F2B0;
        id v9 = (id)v5;
        [(SCNNode *)assetNode enumerateHierarchyUsingBlock:v8];
      }
    }
  }
}

void __43__AVTComponentInstance_setMaterialVariant___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a2 geometry];
  id v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 materials];
    if ([v5 count] != 1)
    {
      v21 = v4;
      uint64_t v23 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v5, "count"));
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      uint64_t v20 = v5;
      id v6 = v5;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = 0;
        uint64_t v10 = *(void *)v27;
        uint64_t v22 = a1;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v27 != v10) {
              objc_enumerationMutation(v6);
            }
            long long v12 = *(void **)(*((void *)&v26 + 1) + 8 * v11);
            uint64_t v13 = [v12 name];
            uint64_t v14 = [v13 componentsSeparatedByString:@"_variant_"];

            uint64_t v15 = [v14 firstObject];
            if ((unint64_t)[v14 count] >= 2
              && ([v14 lastObject], (int v16 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              id v17 = v16;
              if ([v16 isEqualToString:*(void *)(a1 + 32)])
              {
                [v23 insertObject:v12 atIndex:v9++];
                a1 = v22;
              }
              else
              {
                [v23 addObject:v12];
              }
            }
            else
            {
              uint64_t v18 = [NSString stringWithFormat:@"%@_variant_%@", v15, *(void *)(a1 + 32)];
              v24[0] = MEMORY[0x263EF8330];
              v24[1] = 3221225472;
              v24[2] = __43__AVTComponentInstance_setMaterialVariant___block_invoke_2;
              v24[3] = &unk_264020288;
              id v25 = v18;
              id v17 = v18;
              if ([v6 indexOfObjectPassingTest:v24] == 0x7FFFFFFFFFFFFFFFLL)
              {
                [v23 insertObject:v12 atIndex:v9++];
                a1 = v22;
              }
              else
              {
                [v23 addObject:v12];
              }
            }
            ++v11;
          }
          while (v8 != v11);
          uint64_t v19 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
          uint64_t v8 = v19;
        }
        while (v19);
      }

      id v4 = v21;
      [v21 setMaterials:v23];

      unint64_t v5 = v20;
    }
  }
}

uint64_t __43__AVTComponentInstance_setMaterialVariant___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 name];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)_initializeVariantSkinnerPairsIfNeeded
{
  if (!self->_didInitializeVariantSkinnerPairs)
  {
    uint64_t v3 = self->_variantSkinnerPairs;
    objc_sync_enter(v3);
    if (!self->_didInitializeVariantSkinnerPairs)
    {
      assetNode = self->_assetNode;
      v5[0] = MEMORY[0x263EF8330];
      v5[1] = 3221225472;
      v5[2] = __62__AVTComponentInstance__initializeVariantSkinnerPairsIfNeeded__block_invoke;
      v5[3] = &unk_26401F2B0;
      v5[4] = self;
      [(SCNNode *)assetNode enumerateHierarchyUsingBlock:v5];
      self->_didInitializeVariantSkinnerPairs = 1;
    }
    objc_sync_exit(v3);
  }
}

void __62__AVTComponentInstance__initializeVariantSkinnerPairsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 valueForUndefinedKey:@"skinnerVariant"];
  if ([v4 count])
  {
    if (!*(void *)(*(void *)(a1 + 32) + 56))
    {
      uint64_t v5 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:512 valueOptions:512 capacity:0];
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void **)(v6 + 56);
      *(void *)(v6 + 56) = v5;
    }
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __62__AVTComponentInstance__initializeVariantSkinnerPairsIfNeeded__block_invoke_2;
    v10[3] = &unk_2640202B0;
    id v8 = v3;
    uint64_t v9 = *(void *)(a1 + 32);
    id v11 = v8;
    uint64_t v12 = v9;
    [v4 enumerateKeysAndObjectsUsingBlock:v10];
  }
}

void __62__AVTComponentInstance__initializeVariantSkinnerPairsIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) childNodeWithName:a2 recursively:1];
  if (!v6)
  {
    uint64_t v7 = avt_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __62__AVTComponentInstance__initializeVariantSkinnerPairsIfNeeded__block_invoke_2_cold_2(v7);
    }
  }
  id v8 = [v6 skinner];
  if (!v8)
  {
    uint64_t v9 = avt_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __62__AVTComponentInstance__initializeVariantSkinnerPairsIfNeeded__block_invoke_2_cold_1(v9);
    }
  }
  uint64_t v10 = (void *)MEMORY[0x263F16AE0];
  id v11 = [v8 baseGeometry];
  uint64_t v12 = [v5 bones];
  uint64_t v13 = [v5 boneInverseBindTransforms];
  uint64_t v14 = [v5 boneWeights];
  uint64_t v15 = [v5 boneIndices];
  int v16 = [v10 skinnerWithBaseGeometry:v11 bones:v12 boneInverseBindTransforms:v13 boneWeights:v14 boneIndices:v15];

  if (v5)
  {
    [v5 baseGeometryBindTransform];
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
  }
  v18[0] = v19;
  v18[1] = v20;
  v18[2] = v21;
  v18[3] = v22;
  [v16 setBaseGeometryBindTransform:v18];
  id v17 = objc_alloc_init(AVTSkinnerVariantPair);
  -[AVTSkinnerVariantPair setOriginalSkinner:]((uint64_t)v17, v8);
  -[AVTPhysicsRig setRig:]((uint64_t)v17, v16);
  [*(id *)(*(void *)(a1 + 40) + 56) setObject:v17 forKey:v6];
}

- (void)setSkinnerVariantIntensity:(float)a3 skeleton:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (self->_assetNode && self->_skinnerVariantIntensity != a3)
  {
    self->_skinnerVariantIntensity = a3;
    [(AVTComponentInstance *)self _initializeVariantSkinnerPairsIfNeeded];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    obuint64_t j = self->_variantSkinnerPairs;
    uint64_t v7 = [(NSMapTable *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v22;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v21 + 1) + 8 * v10);
          uint64_t v12 = [(NSMapTable *)self->_variantSkinnerPairs objectForKey:v11];
          uint64_t v14 = (void *)v12;
          uint64_t v15 = (void *)MEMORY[0x263F16AE0];
          if (v12)
          {
            id v16 = *(id *)(v12 + 8);
            uint64_t v17 = v14[2];
          }
          else
          {
            id v16 = 0;
            uint64_t v17 = 0;
          }
          *(float *)&double v13 = a3;
          uint64_t v18 = objc_msgSend(v15, "avt_skinnerByInterpolatingFromSkinner:toSkinner:factor:skeleton:", v16, v17, v6, v13);

          [v11 setSkinner:v18];
          ++v10;
        }
        while (v8 != v10);
        uint64_t v19 = [(NSMapTable *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
        uint64_t v8 = v19;
      }
      while (v19);
    }
  }
}

- (void)setVisibilityRules:(id)a3 dictatedByCategory:(int64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (self->_assetNode)
  {
    uint64_t v14 = v6;
    uint64_t v8 = [NSNumber numberWithInteger:a4];
    uint64_t v9 = [(NSMutableDictionary *)self->_visibilityRules objectForKeyedSubscript:v8];
    if (v9 != v14)
    {
      AVTEvaluateNameMatchingRules(v9, self->_assetNode, &__block_literal_global_9);
      visibilityRules = self->_visibilityRules;
      id v11 = v14;
      if (v14)
      {
        if (!visibilityRules)
        {
          uint64_t v12 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:1];
          double v13 = self->_visibilityRules;
          self->_visibilityRules = v12;

          id v11 = v14;
          visibilityRules = self->_visibilityRules;
        }
        [(NSMutableDictionary *)visibilityRules setObject:v11 forKeyedSubscript:v8];
        AVTEvaluateNameMatchingRules(v14, self->_assetNode, &__block_literal_global_62_0);
      }
      else
      {
        [(NSMutableDictionary *)visibilityRules removeObjectForKey:v8];
      }
    }

    id v7 = v14;
  }
  MEMORY[0x270F9A758](v6, v7);
}

uint64_t __62__AVTComponentInstance_setVisibilityRules_dictatedByCategory___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setHidden:0];
}

uint64_t __62__AVTComponentInstance_setVisibilityRules_dictatedByCategory___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setHidden:1];
}

- (BOOL)has3DAsset
{
  return self->_assetNode != 0;
}

- (id)assetImageForAsset:(id)a3
{
  assets = self->_assets;
  id v4 = a3;
  id v5 = [(NSArray *)assets firstObject];
  id v6 = [v5 assetImageForAsset:v4];

  return v6;
}

- (SCNNode)assetNode
{
  return (SCNNode *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layers, 0);
  objc_storeStrong((id *)&self->_visibilityRules, 0);
  objc_storeStrong((id *)&self->_variantSkinnerPairs, 0);
  objc_storeStrong((id *)&self->_assetImageVariant, 0);
  objc_storeStrong((id *)&self->_assetImage, 0);
  objc_storeStrong((id *)&self->_materialVariant, 0);
  objc_storeStrong((id *)&self->_assetNode, 0);
  objc_storeStrong((id *)&self->_assets, 0);
}

- (void)initWithComponent:(NSObject *)a3 assetResourceCache:.cold.1(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "node";
}

void __53__AVTComponentInstance_updateMaterialsWithComponent___block_invoke_cold_1(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "avtMaterial";
}

void __62__AVTComponentInstance__initializeVariantSkinnerPairsIfNeeded__block_invoke_2_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "originalSkinner";
}

void __62__AVTComponentInstance__initializeVariantSkinnerPairsIfNeeded__block_invoke_2_cold_2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "nodeWithSkinnerVariant";
}

@end