@interface AVTAvatarMemoryOptimizer
+ (void)optimizeMemoji:(uint64_t)a1;
- (AVTAvatarMemoryOptimizer)initWithMemoji:(id)a3;
- (BOOL)shouldClearCPUDataAfterUpload;
- (BOOL)shouldKeepCreasesAndCorners;
- (id)flattenTarget0:(id)a3 weight0:(float)a4 target1:(id)a5 weight1:(float)a6 inMorphTarget:(id)a7 originalMorphTarget:(id)a8;
- (void)applyMorphTarget:(id)a3 weight:(float)a4 toBaseGeometryBuffer:(void *)a5 vertexCount:(unint64_t)a6;
- (void)applyMorphTarget:(id)a3 weight:(float)a4 toMorphTargetBuffer:(id *)a5 vertexCount:(unint64_t)a6;
- (void)classifyTargetsOfMorpher:(id)a3 node:(id)a4;
- (void)flattenCorrectiveAtIndex:(unint64_t)a3 inBaseGeometryUsingWeight:(float)a4;
- (void)flattenCorrectiveAtIndex:(unint64_t)a3 inCorrectiveAtIndex:(unint64_t)a4 weight:(float)a5;
- (void)flattenCorrectiveAtIndex:(unint64_t)a3 inTargetAtIndex:(unint64_t)a4 weight:(float)a5;
- (void)flattenCorrectivesAtIndices:(id)a3 inCorrective:(id)a4 weight:(float)a5 morpher:(id)a6;
- (void)flattenCorrectivesAtIndices:(id)a3 inCorrectiveAtIndex:(unint64_t)a4 morpher:(id)a5;
- (void)flattenRelevantTargetsInOtherTargetsOfMorpher:(id)a3;
- (void)flattenRelevantTargetsOfMorpher:(id)a3 inBaseGeometryOfNode:(id)a4;
- (void)flattenTargetAtIndex:(unint64_t)a3 inBaseGeometryUsingWeight:(float)a4;
- (void)flattenTargetAtIndex:(unint64_t)a3 inTargetAtIndex:(unint64_t)a4 weight:(float)a5;
- (void)flattenTargetsAtIndices:(id)a3 correctivesAtIndices:(id)a4 inTarget:(id)a5 weight:(float)a6 morpher:(id)a7;
- (void)flattenTargetsAtIndices:(id)a3 correctivesAtIndices:(id)a4 inTargetAtIndex:(unint64_t)a5 morpher:(id)a6;
- (void)flattenTargetsOfMorpher:(id)a3 node:(id)a4;
- (void)keepCorrectiveAtIndex:(unint64_t)a3 morpher:(id)a4;
- (void)keepCorrectiveAtIndex:(unint64_t)a3 withDriverIndices:(id)a4 morpher:(id)a5;
- (void)keepTargetAtIndex:(unint64_t)a3 morpher:(id)a4;
- (void)optimizeMemoji;
- (void)optimizeNode:(id)a3;
- (void)optimizeNodeHierarchy:(id)a3;
- (void)preprocessMemoji;
- (void)registerRequiredVariant:(id)a3 weight:(float)a4 inHierarchy:(id)a5;
- (void)resolveInBetweensForTarget:(id)a3 weight:(float)a4 inBetweenWeights:(id)a5 inBetweenTargets:(id)a6 block:(id)a7;
@end

@implementation AVTAvatarMemoryOptimizer

+ (void)optimizeMemoji:(uint64_t)a1
{
  id v3 = a2;
  self;
  if ([v3 usageIntent] == 2)
  {
    v2 = [[AVTAvatarMemoryOptimizer alloc] initWithMemoji:v3];
    [(AVTAvatarMemoryOptimizer *)v2 preprocessMemoji];
    [(AVTAvatarMemoryOptimizer *)v2 optimizeMemoji];
  }
}

- (AVTAvatarMemoryOptimizer)initWithMemoji:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVTAvatarMemoryOptimizer;
  v6 = [(AVTAvatarMemoryOptimizer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_memoji, a3);
  }

  return v7;
}

- (BOOL)shouldKeepCreasesAndCorners
{
  return [(AVTMemoji *)self->_memoji usageIntent] != 2;
}

- (BOOL)shouldClearCPUDataAfterUpload
{
  return [(AVTMemoji *)self->_memoji usageIntent] == 2;
}

- (void)registerRequiredVariant:(id)a3 weight:(float)a4 inHierarchy:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!v9) {
    -[AVTAvatarMemoryOptimizer registerRequiredVariant:weight:inHierarchy:]();
  }
  v10 = v9;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __71__AVTAvatarMemoryOptimizer_registerRequiredVariant_weight_inHierarchy___block_invoke;
  v12[3] = &unk_26401F238;
  float v15 = a4;
  id v13 = v8;
  v14 = self;
  id v11 = v8;
  [v10 enumerateHierarchyUsingBlock:v12];
}

void __71__AVTAvatarMemoryOptimizer_registerRequiredVariant_weight_inHierarchy___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 morpher];
  if (v3)
  {
    id v6 = v3;
    uint64_t v4 = [v3 _weightIndexForTargetNamed:*(void *)(a1 + 32)];
    id v3 = v6;
    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v6, "setWeight:forTargetAtIndex:", *(float *)(a1 + 48));
      id v5 = [*(id *)(*(void *)(a1 + 40) + 16) objectForKey:v6];
      if (!v5)
      {
        id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
        [*(id *)(*(void *)(a1 + 40) + 16) setObject:v5 forKey:v6];
      }
      [v5 addObject:*(void *)(a1 + 32)];

      id v3 = v6;
    }
  }
}

- (void)preprocessMemoji
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v3 = (NSMapTable *)[objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:2 valueOptions:0 capacity:0];
  requiredVariantsPerMorpher = self->_requiredVariantsPerMorpher;
  self->_requiredVariantsPerMorpher = v3;

  id v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  requiredMorphVariantComponents = self->_requiredMorphVariantComponents;
  self->_requiredMorphVariantComponents = v5;

  v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
  presetVariantPrefixes = self->_presetVariantPrefixes;
  self->_presetVariantPrefixes = v7;

  v33 = [(AVTMemoji *)self->_memoji allBuiltinAssetNodes];
  for (unint64_t i = 0; i != 42; ++i)
  {
    if (i)
    {
      v35 = AVTComponentTypeToString(i);
      v34 = objc_msgSend(@"variant_", "stringByAppendingString:");
      -[NSMutableSet addObject:](self->_presetVariantPrefixes, "addObject:");
      unint64_t v36 = i;
      v37 = [(AVTMemoji *)self->_memoji componentForType:i];
      v10 = [v37 morphVariant];
      id v11 = v10;
      if (v10 && ([v10 isEqualToString:@"variant_none"] & 1) == 0)
      {
        [v37 morphVariantIntensity];
        int v13 = v12;
        [(NSMutableArray *)self->_requiredMorphVariantComponents addObject:v37];
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v14 = v33;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v44 objects:v49 count:16];
        if (v15)
        {
          uint64_t v17 = v15;
          uint64_t v18 = *(void *)v45;
          do
          {
            for (uint64_t j = 0; j != v17; ++j)
            {
              if (*(void *)v45 != v18) {
                objc_enumerationMutation(v14);
              }
              LODWORD(v16) = v13;
              [(AVTAvatarMemoryOptimizer *)self registerRequiredVariant:v11 weight:*(void *)(*((void *)&v44 + 1) + 8 * j) inHierarchy:v16];
            }
            uint64_t v17 = [v14 countByEnumeratingWithState:&v44 objects:v49 count:16];
          }
          while (v17);
        }

        for (uint64_t k = 0; k != 42; ++k)
        {
          if (k)
          {
            v21 = [(AVTMemoji *)self->_memoji componentForType:k];
            long long v40 = 0u;
            long long v41 = 0u;
            long long v42 = 0u;
            long long v43 = 0u;
            v22 = [v21 assets];
            uint64_t v23 = [v22 countByEnumeratingWithState:&v40 objects:v48 count:16];
            if (v23)
            {
              uint64_t v24 = v23;
              uint64_t v25 = *(void *)v41;
              do
              {
                for (uint64_t m = 0; m != v24; ++m)
                {
                  if (*(void *)v41 != v25) {
                    objc_enumerationMutation(v22);
                  }
                  v27 = *(void **)(*((void *)&v40 + 1) + 8 * m);
                  if ([v27 is3DAsset])
                  {
                    v28 = [(AVTMemoji *)self->_memoji assetResourceCache];
                    v29 = [v28 resourceForAsset:v27];

                    LODWORD(v30) = v13;
                    [(AVTAvatarMemoryOptimizer *)self registerRequiredVariant:v11 weight:v29 inHierarchy:v30];
                  }
                }
                uint64_t v24 = [v22 countByEnumeratingWithState:&v40 objects:v48 count:16];
              }
              while (v24);
            }
          }
        }
      }

      unint64_t i = v36;
    }
  }
  for (uint64_t n = 0; n != 40; ++n)
  {
    v32 = [(AVTMemoji *)self->_memoji resolvedPresetForCategory:n];
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __44__AVTAvatarMemoryOptimizer_preprocessMemoji__block_invoke;
    v39[3] = &unk_26401F260;
    v39[4] = self;
    [v32 enumerateVariantDependenciesOfKind:0 block:v39];
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __44__AVTAvatarMemoryOptimizer_preprocessMemoji__block_invoke_2;
    v38[3] = &unk_26401F288;
    v38[4] = self;
    [v32 enumerateAssetSpecificVariantDependenciesOfKind:0 block:v38];
  }
}

void __44__AVTAvatarMemoryOptimizer_preprocessMemoji__block_invoke(uint64_t a1, unint64_t a2, void *a3, float a4)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v8 = AVTPresetCategoryToComponentType(a2);
  id v9 = [*(id *)(*(void *)(a1 + 32) + 8) componentForType:v8];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v10 = [v9 assets];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if ([v15 is3DAsset])
        {
          double v16 = [*(id *)(*(void *)(a1 + 32) + 8) assetResourceCache];
          uint64_t v17 = [v16 resourceForAsset:v15];

          *(float *)&double v18 = a4;
          [*(id *)(a1 + 32) registerRequiredVariant:v7 weight:v17 inHierarchy:v18];
          [*(id *)(*(void *)(a1 + 32) + 32) addObject:v7];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v12);
  }

  v19 = [*(id *)(*(void *)(a1 + 32) + 8) builtinAssetNodesForComponentType:v8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v20)
  {
    uint64_t v22 = v20;
    uint64_t v23 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(v19);
        }
        *(float *)&double v21 = a4;
        [*(id *)(a1 + 32) registerRequiredVariant:v7 weight:*(void *)(*((void *)&v25 + 1) + 8 * j) inHierarchy:v21];
        [*(id *)(*(void *)(a1 + 32) + 32) addObject:v7];
      }
      uint64_t v22 = [v19 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v22);
  }
}

void __44__AVTAvatarMemoryOptimizer_preprocessMemoji__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v26 = a2;
  [*(id *)(*(void *)(a1 + 32) + 8) componentForType:a2];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v27 = v35 = 0u;
  id v9 = [v27 assets];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if ([v14 is3DAsset])
        {
          uint64_t v15 = [v14 identifier];
          int v16 = [v15 isEqualToString:v7];

          if (v16)
          {
            uint64_t v17 = [*(id *)(*(void *)(a1 + 32) + 8) assetResourceCache];
            double v18 = [v17 resourceForAsset:v14];

            LODWORD(v19) = 1.0;
            [*(id *)(a1 + 32) registerRequiredVariant:v8 weight:v18 inHierarchy:v19];
            [*(id *)(*(void *)(a1 + 32) + 32) addObject:v8];
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v11);
  }

  uint64_t v20 = [*(id *)(*(void *)(a1 + 32) + 8) builtinAssetNodesForComponentType:v26];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v21)
  {
    uint64_t v23 = v21;
    uint64_t v24 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v29 != v24) {
          objc_enumerationMutation(v20);
        }
        LODWORD(v22) = 1.0;
        [*(id *)(a1 + 32) registerRequiredVariant:v8 weight:*(void *)(*((void *)&v28 + 1) + 8 * j) inHierarchy:v22];
        [*(id *)(*(void *)(a1 + 32) + 32) addObject:v8];
      }
      uint64_t v23 = [v20 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v23);
  }
}

- (void)optimizeMemoji
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = [(AVTMemoji *)self->_memoji allBuiltinAssetNodes];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(v3);
        }
        [(AVTAvatarMemoryOptimizer *)self optimizeNodeHierarchy:*(void *)(*((void *)&v22 + 1) + 8 * i)];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v5);
  }
  for (uint64_t j = 0; j != 42; ++j)
  {
    if (j)
    {
      id v9 = [(AVTMemoji *)self->_memoji componentForType:j];
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      uint64_t v10 = objc_msgSend(v9, "assets", 0);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v19;
        do
        {
          for (uint64_t k = 0; k != v12; ++k)
          {
            if (*(void *)v19 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void **)(*((void *)&v18 + 1) + 8 * k);
            if ([v15 is3DAsset])
            {
              int v16 = [(AVTMemoji *)self->_memoji assetResourceCache];
              uint64_t v17 = [v16 resourceForAsset:v15];

              [(AVTAvatarMemoryOptimizer *)self optimizeNodeHierarchy:v17];
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
        }
        while (v12);
      }
    }
  }
}

- (void)optimizeNodeHierarchy:(id)a3
{
  id v4 = a3;
  if (!v4) {
    -[AVTAvatarMemoryOptimizer optimizeNodeHierarchy:]();
  }
  uint64_t v5 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__AVTAvatarMemoryOptimizer_optimizeNodeHierarchy___block_invoke;
  v6[3] = &unk_26401F2B0;
  v6[4] = self;
  [v4 enumerateHierarchyUsingBlock:v6];
}

uint64_t __50__AVTAvatarMemoryOptimizer_optimizeNodeHierarchy___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) optimizeNode:a2];
}

- (void)optimizeNode:(id)a3
{
  id v52 = a3;
  id v4 = [v52 morpher];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 weights];
    oldWeights = self->_oldWeights;
    self->_oldWeights = v6;

    id v8 = [v5 targets];
    oldMainTargets = self->_oldMainTargets;
    self->_oldMainTargets = v8;

    uint64_t v10 = [v5 inBetweenCounts];
    self->_hasInBetweens = [v10 count] != 0;

    uint64_t v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    newWeights = self->_newWeights;
    self->_newWeights = v11;

    uint64_t v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    newTargetsAndInBetweens = self->_newTargetsAndInBetweens;
    self->_newTargetsAndInBetweens = v13;

    if (self->_hasInBetweens)
    {
      uint64_t v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      newInBetweenCounts = self->_newInBetweenCounts;
      self->_newInBetweenCounts = v15;
    }
    else
    {
      newInBetweenCounts = self->_newInBetweenCounts;
      self->_newInBetweenCounts = 0;
    }

    if (self->_hasInBetweens)
    {
      uint64_t v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      newInBetweenWeights = self->_newInBetweenWeights;
      self->_newInBetweenWeights = v17;
    }
    else
    {
      newInBetweenWeights = self->_newInBetweenWeights;
      self->_newInBetweenWeights = 0;
    }

    long long v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    indicesOfTargetsToFlattenInBaseGeometry = self->_indicesOfTargetsToFlattenInBaseGeometry;
    self->_indicesOfTargetsToFlattenInBaseGeometry = v19;

    long long v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    indicesOfTargetsToFlattenInOtherTarget = self->_indicesOfTargetsToFlattenInOtherTarget;
    self->_indicesOfTargetsToFlattenInOtherTarget = v21;

    long long v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    nonOneWeightsOfTargetsToFlatteuint64_t n = self->_nonOneWeightsOfTargetsToFlatten;
    self->_nonOneWeightsOfTargetsToFlatteuint64_t n = v23;

    long long v25 = [v5 correctives];
    oldCorrectives = self->_oldCorrectives;
    self->_oldCorrectives = v25;

    long long v27 = [v5 correctiveDriverCounts];
    oldCorrectiveDriverCounts = self->_oldCorrectiveDriverCounts;
    self->_oldCorrectiveDriverCounts = v27;

    long long v29 = [v5 correctiveDriverIndices];
    oldCorrectiveDriverIndices = self->_oldCorrectiveDriverIndices;
    self->_oldCorrectiveDriverIndices = v29;

    NSUInteger v31 = [(NSArray *)self->_oldCorrectiveDriverCounts count];
    self->_hasCorrectives = v31 != 0;
    if (v31)
    {
      long long v32 = [v5 correctiveInBetweenCounts];
      self->_hasCorrectiveInBetweens = [v32 count] != 0;
      p_hasCorrectiveInBetweens = &self->_hasCorrectiveInBetweens;
    }
    else
    {
      self->_hasCorrectiveInBetweens = 0;
      p_hasCorrectiveInBetweens = &self->_hasCorrectiveInBetweens;
    }
    long long v34 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    newCorrectivesAndInBetweens = self->_newCorrectivesAndInBetweens;
    self->_newCorrectivesAndInBetweens = v34;

    if (self->_hasCorrectives)
    {
      unint64_t v36 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      newCorrectiveDriverCounts = self->_newCorrectiveDriverCounts;
      self->_newCorrectiveDriverCounts = v36;
    }
    else
    {
      newCorrectiveDriverCounts = self->_newCorrectiveDriverCounts;
      self->_newCorrectiveDriverCounts = 0;
    }

    if (self->_hasCorrectives)
    {
      uint64_t v38 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      newCorrectiveDriverIndices = self->_newCorrectiveDriverIndices;
      self->_newCorrectiveDriverIndices = v38;
    }
    else
    {
      newCorrectiveDriverIndices = self->_newCorrectiveDriverIndices;
      self->_newCorrectiveDriverIndices = 0;
    }

    if (*p_hasCorrectiveInBetweens)
    {
      long long v40 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      newCorrectiveInBetweenCounts = self->_newCorrectiveInBetweenCounts;
      self->_newCorrectiveInBetweenCounts = v40;
    }
    else
    {
      newCorrectiveInBetweenCounts = self->_newCorrectiveInBetweenCounts;
      self->_newCorrectiveInBetweenCounts = 0;
    }

    if (*p_hasCorrectiveInBetweens)
    {
      long long v42 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      newCorrectiveInBetweenWeights = self->_newCorrectiveInBetweenWeights;
      self->_newCorrectiveInBetweenWeights = v42;
    }
    else
    {
      newCorrectiveInBetweenWeights = self->_newCorrectiveInBetweenWeights;
      self->_newCorrectiveInBetweenWeights = 0;
    }

    if (self->_hasCorrectives)
    {
      long long v44 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      indicesOfCorrectivesToFlattenInBaseGeometry = self->_indicesOfCorrectivesToFlattenInBaseGeometry;
      self->_indicesOfCorrectivesToFlattenInBaseGeometry = v44;
    }
    else
    {
      indicesOfCorrectivesToFlattenInBaseGeometry = self->_indicesOfCorrectivesToFlattenInBaseGeometry;
      self->_indicesOfCorrectivesToFlattenInBaseGeometry = 0;
    }

    if (self->_hasCorrectives)
    {
      long long v46 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      indicesOfCorrectivesToFlattenInMainTarget = self->_indicesOfCorrectivesToFlattenInMainTarget;
      self->_indicesOfCorrectivesToFlattenInMainTarget = v46;
    }
    else
    {
      indicesOfCorrectivesToFlattenInMainTarget = self->_indicesOfCorrectivesToFlattenInMainTarget;
      self->_indicesOfCorrectivesToFlattenInMainTarget = 0;
    }

    if (self->_hasCorrectives)
    {
      v48 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      indicesOfCorrectivesToFlattenInOtherCorrective = self->_indicesOfCorrectivesToFlattenInOtherCorrective;
      self->_indicesOfCorrectivesToFlattenInOtherCorrective = v48;
    }
    else
    {
      indicesOfCorrectivesToFlattenInOtherCorrective = self->_indicesOfCorrectivesToFlattenInOtherCorrective;
      self->_indicesOfCorrectivesToFlattenInOtherCorrective = 0;
    }

    if (self->_hasCorrectives)
    {
      uint64_t v50 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      nonOneWeightsOfCorrectivesToFlatteuint64_t n = self->_nonOneWeightsOfCorrectivesToFlatten;
      self->_nonOneWeightsOfCorrectivesToFlatteuint64_t n = v50;
    }
    else
    {
      nonOneWeightsOfCorrectivesToFlatteuint64_t n = self->_nonOneWeightsOfCorrectivesToFlatten;
      self->_nonOneWeightsOfCorrectivesToFlatteuint64_t n = 0;
    }

    [(AVTAvatarMemoryOptimizer *)self classifyTargetsOfMorpher:v5 node:v52];
    [(AVTAvatarMemoryOptimizer *)self flattenTargetsOfMorpher:v5 node:v52];
  }
}

- (void)classifyTargetsOfMorpher:(id)a3 node:(id)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v28 = a4;
  id v7 = [(NSMapTable *)self->_requiredVariantsPerMorpher objectForKey:v6];
  oldMainTargets = self->_oldMainTargets;
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __58__AVTAvatarMemoryOptimizer_classifyTargetsOfMorpher_node___block_invoke;
  v40[3] = &unk_26401F300;
  v40[4] = self;
  id v9 = v6;
  id v41 = v9;
  id v10 = v7;
  id v42 = v10;
  [(NSArray *)oldMainTargets enumerateObjectsUsingBlock:v40];
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v39[3] = 0;
  oldCorrectives = self->_oldCorrectives;
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __58__AVTAvatarMemoryOptimizer_classifyTargetsOfMorpher_node___block_invoke_2;
  v35[3] = &unk_26401F350;
  v35[4] = self;
  uint64_t v38 = v39;
  id v27 = v10;
  id v36 = v27;
  id v26 = v9;
  id v37 = v26;
  [(NSArray *)oldCorrectives enumerateObjectsUsingBlock:v35];
  for (unint64_t i = 0; i < [(NSMutableArray *)self->_newCorrectiveDriverIndices count]; unint64_t i = v30 + 1)
  {
    uint64_t v13 = [(NSMutableArray *)self->_newCorrectiveDriverIndices objectAtIndexedSubscript:i];
    id v14 = -[NSArray objectAtIndexedSubscript:](self->_oldMainTargets, "objectAtIndexedSubscript:", [v13 unsignedIntegerValue]);
    unint64_t v30 = i;
    if ([(NSMutableArray *)self->_newInBetweenCounts count])
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      uint64_t v15 = self->_newInBetweenCounts;
      uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v31 objects:v45 count:16];
      if (v16)
      {
        uint64_t v17 = 0;
        uint64_t v18 = 0;
        uint64_t v19 = *(void *)v32;
        while (2)
        {
          uint64_t v20 = 0;
          uint64_t v29 = v18 + v16;
          do
          {
            if (*(void *)v32 != v19) {
              objc_enumerationMutation(v15);
            }
            v17 += [*(id *)(*((void *)&v31 + 1) + 8 * v20) unsignedIntegerValue];
            long long v21 = [(NSMutableArray *)self->_newTargetsAndInBetweens objectAtIndexedSubscript:v17 - 1];
            BOOL v22 = v21 == v14;

            if (v22)
            {
              uint64_t v23 = v18 + v20;
              goto LABEL_14;
            }
            ++v20;
          }
          while (v16 != v20);
          uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v31 objects:v45 count:16];
          uint64_t v18 = v29;
          if (v16) {
            continue;
          }
          break;
        }
      }
      uint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_14:
    }
    else
    {
      uint64_t v23 = [(NSMutableArray *)self->_newTargetsAndInBetweens indexOfObject:v14];
    }
    if (v23 == 0x7FFFFFFFFFFFFFFFLL)
    {
      long long v24 = avt_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[AVTAvatarMemoryOptimizer classifyTargetsOfMorpher:node:](buf, &v44, v24);
      }
    }
    long long v25 = [NSNumber numberWithUnsignedInteger:v23];
    [(NSMutableArray *)self->_newCorrectiveDriverIndices setObject:v25 atIndexedSubscript:v30];
  }
  _Block_object_dispose(v39, 8);
}

void __58__AVTAvatarMemoryOptimizer_classifyTargetsOfMorpher_node___block_invoke(id *a1, void *a2, uint64_t a3)
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = [v5 name];
  if (AVTMorphTargetNameIsUsedForFaceAnimation(v6) || AVTMorphTargetNameIsUsedForDynamics(v6, v7))
  {
LABEL_3:
    [a1[4] keepTargetAtIndex:a3 morpher:a1[5]];
    goto LABEL_4;
  }
  if ([v6 isEqualToString:@"Emoji"]) {
    goto LABEL_4;
  }
  if ([v6 containsString:@"__"])
  {
    id v8 = [v6 componentsSeparatedByString:@"__"];
    unint64_t v9 = [v8 count];
    if (v9 < 6)
    {
      unint64_t v11 = v9;
      char v61 = 0;
      int v60 = 0;
      if (v9)
      {
        uint64_t v12 = 0;
        uint64_t v13 = 0;
        uint64_t v14 = 0;
        float v15 = 1.0;
        unint64_t v52 = v9;
        v51 = v8;
        do
        {
          uint64_t v16 = [v8 objectAtIndexedSubscript:v14];
          if (AVTMorphTargetNameIsUsedForFaceAnimation(v16))
          {
            ++v13;
          }
          else
          {
            uint64_t v17 = v12;
            uint64_t v53 = v13;
            uint64_t v18 = (void *)*((void *)a1[4] + 3);
            v58[0] = MEMORY[0x263EF8330];
            v58[1] = 3221225472;
            v58[2] = __58__AVTAvatarMemoryOptimizer_classifyTargetsOfMorpher_node___block_invoke_40;
            v58[3] = &unk_26401F2D8;
            id v19 = v16;
            id v59 = v19;
            uint64_t v20 = [v18 indexOfObjectPassingTest:v58];
            float v21 = 0.0;
            if (v20 != 0x7FFFFFFFFFFFFFFFLL)
            {
              BOOL v22 = [*((id *)a1[4] + 3) objectAtIndexedSubscript:v20];
              [v22 morphVariantIntensity];
              float v21 = v23;
            }
            int v24 = [a1[6] containsObject:v19];
            int v25 = v24;
            if (v20 == 0x7FFFFFFFFFFFFFFFLL && v24 != 0)
            {
              uint64_t v27 = [a1[5] _weightIndexForTargetNamed:v19];
              if (v27 == 0x7FFFFFFFFFFFFFFFLL) {
                __58__AVTAvatarMemoryOptimizer_classifyTargetsOfMorpher_node___block_invoke_cold_4();
              }
              [a1[5] weightForTargetAtIndex:v27];
              float v21 = v28;
            }
            if (v20 == 0x7FFFFFFFFFFFFFFFLL) {
              int v29 = v25;
            }
            else {
              int v29 = 1;
            }
            if (v29 != 1)
            {

              id v8 = v51;
              goto LABEL_74;
            }
            float v15 = fminf(v15, v21);
            *((unsigned char *)&v60 + v14) = 1;
            uint64_t v12 = v17 + 1;

            id v8 = v51;
            unint64_t v11 = v52;
            uint64_t v13 = v53;
          }

          ++v14;
        }
        while (v11 != v14);
        if (v13 == v11) {
          goto LABEL_33;
        }
        if (v12 == v11)
        {
          *(float *)&double v30 = v15;
          [a1[4] flattenTargetAtIndex:a3 inBaseGeometryUsingWeight:v30];
        }
        else
        {
          if (v12 + v13 != v11) {
            __58__AVTAvatarMemoryOptimizer_classifyTargetsOfMorpher_node___block_invoke_cold_3();
          }
          if (v13 == 1)
          {
            uint64_t v37 = 0;
            while (*((unsigned char *)&v60 + v37))
            {
              if (v11 == ++v37)
              {
                uint64_t v38 = 0;
                goto LABEL_66;
              }
            }
            uint64_t v38 = objc_msgSend(v8, "objectAtIndexedSubscript:");
LABEL_66:
            uint64_t v47 = [a1[5] _weightIndexForTargetNamed:v38];
            if (v47 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v49 = v8;
              uint64_t v50 = avt_default_log();
              if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
                __58__AVTAvatarMemoryOptimizer_classifyTargetsOfMorpher_node___block_invoke_cold_2();
              }

              [v5 setName:v38];
              [a1[4] keepTargetAtIndex:a3 morpher:a1[5]];
              id v8 = v49;
            }
            else
            {
              *(float *)&double v48 = v15;
              [a1[4] flattenTargetAtIndex:a3 inTargetAtIndex:v47 weight:v48];
            }
          }
          else
          {
            uint64_t v39 = 0;
            id v40 = 0;
            do
            {
              if (!*((unsigned char *)&v60 + v39))
              {
                id v41 = [v8 objectAtIndexedSubscript:v39];
                id v42 = v41;
                if (v40)
                {
                  [v40 stringByAppendingFormat:@"__%@", v41];
                  v44 = long long v43 = v8;

                  id v40 = (id)v44;
                  id v8 = v43;
                  unint64_t v11 = v52;
                }
                else
                {
                  id v40 = v41;
                }
              }
              ++v39;
            }
            while (v11 != v39);
            uint64_t v45 = [a1[5] _weightIndexForTargetNamed:v40];
            if (v45 == 0x7FFFFFFFFFFFFFFFLL)
            {
              [v5 setName:v40];
              [a1[4] keepTargetAtIndex:a3 morpher:a1[5]];
            }
            else
            {
              *(float *)&double v46 = v15;
              [a1[4] flattenTargetAtIndex:a3 inTargetAtIndex:v45 weight:v46];
            }
          }
        }
      }
      else
      {
LABEL_33:
        [a1[4] keepTargetAtIndex:a3 morpher:a1[5]];
      }
    }
    else
    {
      id v10 = avt_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __58__AVTAvatarMemoryOptimizer_classifyTargetsOfMorpher_node___block_invoke_cold_1();
      }
    }
LABEL_74:
  }
  else
  {
    if ([v6 hasPrefix:@"variant_sticker"])
    {
      if ([*((id *)a1[4] + 1) usageIntent] != 1) {
        goto LABEL_4;
      }
      goto LABEL_3;
    }
    if ([a1[6] containsObject:v6])
    {
      [a1[5] weightForTargetAtIndex:a3];
      *(float *)&double v31 = v31;
      [a1[4] flattenTargetAtIndex:a3 inBaseGeometryUsingWeight:v31];
    }
    else
    {
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v32 = *((id *)a1[4] + 4);
      uint64_t v33 = [v32 countByEnumeratingWithState:&v54 objects:v62 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v55;
        while (2)
        {
          for (uint64_t i = 0; i != v34; ++i)
          {
            if (*(void *)v55 != v35) {
              objc_enumerationMutation(v32);
            }
            if ([v6 hasPrefix:*(void *)(*((void *)&v54 + 1) + 8 * i)])
            {

              goto LABEL_4;
            }
          }
          uint64_t v34 = [v32 countByEnumeratingWithState:&v54 objects:v62 count:16];
          if (v34) {
            continue;
          }
          break;
        }
      }

      if (([v6 hasPrefix:@"variant_"] & 1) == 0) {
        __58__AVTAvatarMemoryOptimizer_classifyTargetsOfMorpher_node___block_invoke_cold_5();
      }
    }
  }
LABEL_4:
}

uint64_t __58__AVTAvatarMemoryOptimizer_classifyTargetsOfMorpher_node___block_invoke_40(uint64_t a1, void *a2)
{
  id v3 = [a2 morphVariant];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void __58__AVTAvatarMemoryOptimizer_classifyTargetsOfMorpher_node___block_invoke_2(id *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [v5 name];
  v65 = a1;
  id v8 = (id *)a1[4];
  id v7 = a1 + 4;
  unint64_t v9 = [v8[16] objectAtIndexedSubscript:a3];
  unint64_t v10 = [v9 unsignedIntegerValue];

  uint64_t v11 = *((void *)v7[3] + 1);
  uint64_t v12 = *(void *)(v11 + 24);
  *(void *)(v11 + 24) = v12 + v10;
  if (v10 < 6)
  {
    char v71 = 0;
    int v70 = 0;
    if (v10)
    {
      uint64_t v61 = a3;
      v62 = v6;
      uint64_t v63 = v5;
      uint64_t v14 = 0;
      uint64_t v15 = 0;
      uint64_t v16 = 0;
      float v17 = 1.0;
      unint64_t v64 = v10;
      do
      {
        uint64_t v18 = [*((id *)*v7 + 17) objectAtIndexedSubscript:v12 + v15];
        uint64_t v19 = [v18 unsignedIntegerValue];

        uint64_t v20 = [*((id *)*v7 + 6) objectAtIndexedSubscript:v19];
        float v21 = [v20 name];

        if (AVTMorphTargetNameIsUsedForFaceAnimation(v21))
        {
          ++v16;
        }
        else
        {
          uint64_t v22 = v12;
          uint64_t v23 = v16;
          uint64_t v24 = v14;
          int v25 = v7;
          id v26 = (void *)*((void *)*v7 + 3);
          v68[0] = MEMORY[0x263EF8330];
          v68[1] = 3221225472;
          v68[2] = __58__AVTAvatarMemoryOptimizer_classifyTargetsOfMorpher_node___block_invoke_53;
          v68[3] = &unk_26401F2D8;
          id v27 = v21;
          id v69 = v27;
          uint64_t v28 = [v26 indexOfObjectPassingTest:v68];
          float v29 = 0.0;
          if (v28 != 0x7FFFFFFFFFFFFFFFLL)
          {
            double v30 = [*((id *)*v25 + 3) objectAtIndexedSubscript:v28];
            [v30 morphVariantIntensity];
            float v29 = v31;
          }
          int v32 = [v65[5] containsObject:v27];
          int v33 = v32;
          if (v28 == 0x7FFFFFFFFFFFFFFFLL && v32 != 0)
          {
            [v65[6] weightForTargetAtIndex:v19];
            float v29 = v35;
          }
          if (v28 == 0x7FFFFFFFFFFFFFFFLL) {
            int v36 = v33;
          }
          else {
            int v36 = 1;
          }
          if (v36 != 1)
          {

            id v5 = v63;
LABEL_25:
            id v6 = v62;
            goto LABEL_51;
          }
          float v17 = fminf(v17, v29);
          *((unsigned char *)&v70 + v15) = 1;
          uint64_t v14 = v24 + 1;

          uint64_t v16 = v23;
          uint64_t v12 = v22;
          unint64_t v10 = v64;
          id v7 = v25;
        }

        ++v15;
      }
      while (v10 != v15);
      id v6 = v62;
      id v5 = v63;
      a3 = v61;
      if (v16 == v10) {
        goto LABEL_23;
      }
      if (v14 == v10)
      {
        *(float *)&double v37 = v17;
        [*v7 flattenCorrectiveAtIndex:v61 inBaseGeometryUsingWeight:v37];
      }
      else
      {
        if (v14 + v16 != v10) {
          __58__AVTAvatarMemoryOptimizer_classifyTargetsOfMorpher_node___block_invoke_2_cold_3();
        }
        if (v16 != 1)
        {
          id v41 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v10];
          id v42 = 0;
          long long v43 = (unsigned __int8 *)&v70;
          do
          {
            if (!*v43++)
            {
              uint64_t v45 = [*((id *)*v7 + 17) objectAtIndexedSubscript:v12];
              double v46 = v7;
              uint64_t v47 = v45;
              double v48 = v46;
              v49 = objc_msgSend(*((id *)*v46 + 6), "objectAtIndexedSubscript:", objc_msgSend(v45, "unsignedIntegerValue"));
              uint64_t v50 = [v49 name];

              [v41 addObject:v47];
              if (v42)
              {
                uint64_t v51 = [v42 stringByAppendingFormat:@"__%@", v50];

                id v42 = (id)v51;
              }
              else
              {
                id v42 = v50;
              }

              id v7 = v48;
            }
            ++v12;
            --v10;
          }
          while (v10);
          unint64_t v52 = (void *)*((void *)*v7 + 15);
          v66[0] = MEMORY[0x263EF8330];
          v66[1] = 3221225472;
          v66[2] = __58__AVTAvatarMemoryOptimizer_classifyTargetsOfMorpher_node___block_invoke_54;
          v66[3] = &unk_26401F328;
          id v67 = v42;
          id v53 = v42;
          uint64_t v54 = [v52 indexOfObjectPassingTest:v66];
          if (v54 == 0x7FFFFFFFFFFFFFFFLL)
          {
            [v63 setName:v53];
            [v65[4] keepCorrectiveAtIndex:v61 withDriverIndices:v41 morpher:v65[6]];
          }
          else
          {
            *(float *)&double v55 = v17;
            [*v7 flattenCorrectiveAtIndex:v61 inCorrectiveAtIndex:v54 weight:v55];
          }

          goto LABEL_25;
        }
        uint64_t v38 = (unsigned __int8 *)&v70;
        while (*v38++)
        {
          ++v12;
          if (!--v10)
          {
            id v40 = 0;
            goto LABEL_44;
          }
        }
        long long v56 = [*((id *)*v7 + 17) objectAtIndexedSubscript:v12];
        uint64_t v57 = [v56 unsignedIntegerValue];

        v58 = [*((id *)*v7 + 6) objectAtIndexedSubscript:v57];
        id v40 = [v58 name];

        if (v57 != 0x7FFFFFFFFFFFFFFFLL)
        {
          *(float *)&double v59 = v17;
          [*v7 flattenCorrectiveAtIndex:v61 inTargetAtIndex:v57 weight:v59];
          goto LABEL_50;
        }
LABEL_44:
        int v60 = avt_default_log();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
          __58__AVTAvatarMemoryOptimizer_classifyTargetsOfMorpher_node___block_invoke_cold_2();
        }

LABEL_50:
        id v5 = v63;
      }
    }
    else
    {
LABEL_23:
      [v65[4] keepCorrectiveAtIndex:a3 morpher:v65[6]];
    }
  }
  else
  {
    uint64_t v13 = avt_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __58__AVTAvatarMemoryOptimizer_classifyTargetsOfMorpher_node___block_invoke_2_cold_1((uint64_t)v7, a3, v13);
    }
  }
LABEL_51:
}

uint64_t __58__AVTAvatarMemoryOptimizer_classifyTargetsOfMorpher_node___block_invoke_53(uint64_t a1, void *a2)
{
  id v3 = [a2 morphVariant];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __58__AVTAvatarMemoryOptimizer_classifyTargetsOfMorpher_node___block_invoke_54(uint64_t a1, void *a2)
{
  id v3 = [a2 name];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)flattenTargetsOfMorpher:(id)a3 node:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(AVTAvatarMemoryOptimizer *)self flattenRelevantTargetsOfMorpher:v7 inBaseGeometryOfNode:v6];
  [(AVTAvatarMemoryOptimizer *)self flattenRelevantTargetsInOtherTargetsOfMorpher:v7];

  if ([(NSMutableArray *)self->_newTargetsAndInBetweens count])
  {
    id v9 = [v6 morpher];

    if ([(AVTAvatarMemoryOptimizer *)self shouldClearCPUDataAfterUpload]) {
      [v9 setShouldClearCPUDataAfterUpload:1];
    }
    if ([(NSMutableArray *)self->_newInBetweenCounts count]
      && [(NSMutableArray *)self->_newInBetweenWeights count])
    {
      [v9 setTargetsAndInBetweens:self->_newTargetsAndInBetweens inBetweenCounts:self->_newInBetweenCounts inBetweenWeights:self->_newInBetweenWeights correctives:self->_newCorrectivesAndInBetweens driverCounts:self->_newCorrectiveDriverCounts driverIndices:self->_newCorrectiveDriverIndices inBetweenCounts:self->_newCorrectiveInBetweenCounts inBetweenWeights:self->_newCorrectiveInBetweenWeights];
    }
    else
    {
      [v9 setTargets:self->_newTargetsAndInBetweens];
    }
    [v9 setWeights:self->_newWeights];
    id v8 = v9;
  }
  else
  {
    [v6 setMorpher:0];
    id v8 = v6;
  }
}

- (void)keepTargetAtIndex:(unint64_t)a3 morpher:(id)a4
{
  id v6 = a4;
  id v14 = v6;
  if (self->_hasInBetweens)
  {
    id v7 = [v6 inBetweenTargetsForTargetAtIndex:a3];
    id v8 = [v14 inBetweenWeightsForTargetAtIndex:a3];
    newInBetweenCounts = self->_newInBetweenCounts;
    unint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "count") + 1);
    [(NSMutableArray *)newInBetweenCounts addObject:v10];

    [(NSMutableArray *)self->_newInBetweenWeights addObjectsFromArray:v8];
    uint64_t v11 = [(NSArray *)self->_oldMainTargets objectAtIndexedSubscript:a3];
    [(NSMutableArray *)self->_newTargetsAndInBetweens addObjectsFromArray:v7];
    [(NSMutableArray *)self->_newTargetsAndInBetweens addObject:v11];
  }
  else
  {
    id v7 = [(NSArray *)self->_oldMainTargets objectAtIndexedSubscript:a3];
    [(NSMutableArray *)self->_newTargetsAndInBetweens addObject:v7];
  }

  newWeights = self->_newWeights;
  uint64_t v13 = [(NSArray *)self->_oldWeights objectAtIndexedSubscript:a3];
  [(NSMutableArray *)newWeights addObject:v13];
}

- (void)keepCorrectiveAtIndex:(unint64_t)a3 morpher:(id)a4
{
  id v13 = a4;
  id v6 = [(NSArray *)self->_oldCorrectiveDriverCounts objectAtIndexedSubscript:a3];
  id v7 = [v13 correctiveDriverIndicesForCorrectiveAtIndex:a3];
  [(NSMutableArray *)self->_newCorrectiveDriverCounts addObject:v6];
  [(NSMutableArray *)self->_newCorrectiveDriverIndices addObjectsFromArray:v7];
  if (self->_hasInBetweens)
  {
    id v8 = [v13 inBetweenTargetsForCorrectiveAtIndex:a3];
    id v9 = [v13 inBetweenWeightsForCorrectiveAtIndex:a3];
    newCorrectiveInBetweenCounts = self->_newCorrectiveInBetweenCounts;
    uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "count") + 1);
    [(NSMutableArray *)newCorrectiveInBetweenCounts addObject:v11];

    [(NSMutableArray *)self->_newCorrectiveInBetweenWeights addObjectsFromArray:v9];
    uint64_t v12 = [(NSArray *)self->_oldCorrectives objectAtIndexedSubscript:a3];
    [(NSMutableArray *)self->_newCorrectivesAndInBetweens addObjectsFromArray:v8];
    [(NSMutableArray *)self->_newCorrectivesAndInBetweens addObject:v12];
  }
  else
  {
    id v8 = [(NSArray *)self->_oldCorrectives objectAtIndexedSubscript:a3];
    [(NSMutableArray *)self->_newCorrectivesAndInBetweens addObject:v8];
  }
}

- (void)keepCorrectiveAtIndex:(unint64_t)a3 withDriverIndices:(id)a4 morpher:(id)a5
{
  id v17 = a5;
  newCorrectiveDriverCounts = self->_newCorrectiveDriverCounts;
  id v9 = NSNumber;
  id v10 = a4;
  uint64_t v11 = objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
  [(NSMutableArray *)newCorrectiveDriverCounts addObject:v11];

  [(NSMutableArray *)self->_newCorrectiveDriverIndices addObjectsFromArray:v10];
  if (self->_hasInBetweens)
  {
    uint64_t v12 = [v17 inBetweenTargetsForCorrectiveAtIndex:a3];
    id v13 = [v17 inBetweenWeightsForCorrectiveAtIndex:a3];
    newCorrectiveInBetweenCounts = self->_newCorrectiveInBetweenCounts;
    uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "count") + 1);
    [(NSMutableArray *)newCorrectiveInBetweenCounts addObject:v15];

    [(NSMutableArray *)self->_newCorrectiveInBetweenWeights addObjectsFromArray:v13];
    uint64_t v16 = [(NSArray *)self->_oldCorrectives objectAtIndexedSubscript:a3];
    [(NSMutableArray *)self->_newCorrectivesAndInBetweens addObjectsFromArray:v12];
    [(NSMutableArray *)self->_newCorrectivesAndInBetweens addObject:v16];
  }
  else
  {
    uint64_t v12 = [(NSArray *)self->_oldCorrectives objectAtIndexedSubscript:a3];
    [(NSMutableArray *)self->_newCorrectivesAndInBetweens addObject:v12];
  }
}

- (void)flattenTargetAtIndex:(unint64_t)a3 inBaseGeometryUsingWeight:(float)a4
{
  if (a4 != 0.0)
  {
    if (a4 < 1.0)
    {
      id v7 = objc_msgSend(NSNumber, "numberWithFloat:");
      nonOneWeightsOfTargetsToFlatteuint64_t n = self->_nonOneWeightsOfTargetsToFlatten;
      id v9 = [NSNumber numberWithUnsignedInteger:a3];
      [(NSMutableDictionary *)nonOneWeightsOfTargetsToFlatten setObject:v7 forKeyedSubscript:v9];
    }
    indicesOfTargetsToFlattenInBaseGeometry = self->_indicesOfTargetsToFlattenInBaseGeometry;
    id v11 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableArray *)indicesOfTargetsToFlattenInBaseGeometry addObject:v11];
  }
}

- (void)flattenTargetAtIndex:(unint64_t)a3 inTargetAtIndex:(unint64_t)a4 weight:(float)a5
{
  if (a5 != 0.0)
  {
    if (a5 < 1.0)
    {
      id v9 = objc_msgSend(NSNumber, "numberWithFloat:");
      nonOneWeightsOfTargetsToFlatteuint64_t n = self->_nonOneWeightsOfTargetsToFlatten;
      id v11 = [NSNumber numberWithUnsignedInteger:a3];
      [(NSMutableDictionary *)nonOneWeightsOfTargetsToFlatten setObject:v9 forKeyedSubscript:v11];
    }
    indicesOfTargetsToFlattenInOtherTarget = self->_indicesOfTargetsToFlattenInOtherTarget;
    id v13 = [NSNumber numberWithUnsignedInteger:a4];
    id v17 = [(NSMutableDictionary *)indicesOfTargetsToFlattenInOtherTarget objectForKeyedSubscript:v13];

    if (!v17)
    {
      id v17 = objc_alloc_init(MEMORY[0x263EFF980]);
      id v14 = self->_indicesOfTargetsToFlattenInOtherTarget;
      uint64_t v15 = [NSNumber numberWithUnsignedInteger:a4];
      [(NSMutableDictionary *)v14 setObject:v17 forKeyedSubscript:v15];
    }
    uint64_t v16 = [NSNumber numberWithUnsignedInteger:a3];
    [v17 addObject:v16];
  }
}

- (void)flattenCorrectiveAtIndex:(unint64_t)a3 inBaseGeometryUsingWeight:(float)a4
{
  if (a4 != 0.0)
  {
    if (a4 < 1.0)
    {
      id v7 = objc_msgSend(NSNumber, "numberWithFloat:");
      nonOneWeightsOfCorrectivesToFlatteuint64_t n = self->_nonOneWeightsOfCorrectivesToFlatten;
      id v9 = [NSNumber numberWithUnsignedInteger:a3];
      [(NSMutableDictionary *)nonOneWeightsOfCorrectivesToFlatten setObject:v7 forKeyedSubscript:v9];
    }
    indicesOfCorrectivesToFlattenInBaseGeometry = self->_indicesOfCorrectivesToFlattenInBaseGeometry;
    id v11 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableArray *)indicesOfCorrectivesToFlattenInBaseGeometry addObject:v11];
  }
}

- (void)flattenCorrectiveAtIndex:(unint64_t)a3 inTargetAtIndex:(unint64_t)a4 weight:(float)a5
{
  if (a5 != 0.0)
  {
    if (a5 < 1.0)
    {
      id v9 = objc_msgSend(NSNumber, "numberWithFloat:");
      nonOneWeightsOfCorrectivesToFlatteuint64_t n = self->_nonOneWeightsOfCorrectivesToFlatten;
      id v11 = [NSNumber numberWithUnsignedInteger:a3];
      [(NSMutableDictionary *)nonOneWeightsOfCorrectivesToFlatten setObject:v9 forKeyedSubscript:v11];
    }
    indicesOfCorrectivesToFlattenInMainTarget = self->_indicesOfCorrectivesToFlattenInMainTarget;
    id v13 = [NSNumber numberWithUnsignedInteger:a4];
    id v17 = [(NSMutableDictionary *)indicesOfCorrectivesToFlattenInMainTarget objectForKeyedSubscript:v13];

    if (!v17)
    {
      id v17 = objc_alloc_init(MEMORY[0x263EFF980]);
      id v14 = self->_indicesOfCorrectivesToFlattenInMainTarget;
      uint64_t v15 = [NSNumber numberWithUnsignedInteger:a4];
      [(NSMutableDictionary *)v14 setObject:v17 forKeyedSubscript:v15];
    }
    uint64_t v16 = [NSNumber numberWithUnsignedInteger:a3];
    [v17 addObject:v16];
  }
}

- (void)flattenCorrectiveAtIndex:(unint64_t)a3 inCorrectiveAtIndex:(unint64_t)a4 weight:(float)a5
{
  if (a5 != 0.0)
  {
    if (a5 < 1.0)
    {
      id v9 = objc_msgSend(NSNumber, "numberWithFloat:");
      nonOneWeightsOfCorrectivesToFlatteuint64_t n = self->_nonOneWeightsOfCorrectivesToFlatten;
      id v11 = [NSNumber numberWithUnsignedInteger:a3];
      [(NSMutableDictionary *)nonOneWeightsOfCorrectivesToFlatten setObject:v9 forKeyedSubscript:v11];
    }
    indicesOfCorrectivesToFlattenInOtherCorrective = self->_indicesOfCorrectivesToFlattenInOtherCorrective;
    id v13 = [NSNumber numberWithUnsignedInteger:a4];
    id v17 = [(NSMutableDictionary *)indicesOfCorrectivesToFlattenInOtherCorrective objectForKeyedSubscript:v13];

    if (!v17)
    {
      id v17 = objc_alloc_init(MEMORY[0x263EFF980]);
      id v14 = self->_indicesOfCorrectivesToFlattenInOtherCorrective;
      uint64_t v15 = [NSNumber numberWithUnsignedInteger:a4];
      [(NSMutableDictionary *)v14 setObject:v17 forKeyedSubscript:v15];
    }
    uint64_t v16 = [NSNumber numberWithUnsignedInteger:a3];
    [v17 addObject:v16];
  }
}

- (void)flattenRelevantTargetsOfMorpher:(id)a3 inBaseGeometryOfNode:(id)a4
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([(NSMutableArray *)self->_indicesOfTargetsToFlattenInBaseGeometry count]
    || [(NSMutableArray *)self->_indicesOfCorrectivesToFlattenInBaseGeometry count])
  {
    int v60 = [v7 geometry];
    id v8 = [v60 geometrySources];
    unint64_t v64 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v8, "count"));
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    obuint64_t j = v8;
    uint64_t v9 = [obj countByEnumeratingWithState:&v77 objects:v83 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v65 = 0;
      uint64_t v66 = 0;
      uint64_t v11 = *(void *)v78;
      uint64_t v12 = *MEMORY[0x263F16B50];
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v78 != v11) {
            objc_enumerationMutation(obj);
          }
          id v14 = *(void **)(*((void *)&v77 + 1) + 8 * i);
          uint64_t v15 = [v14 semantic];
          int v16 = [v15 isEqualToString:v12];

          if (v16)
          {
            uint64_t v17 = [v14 vectorCount];
            uint64_t v18 = [v14 data];
            uint64_t v19 = (void *)[v18 mutableCopy];

            id v20 = v19;
            uint64_t v65 = [v20 mutableBytes];
            uint64_t v66 = v17;
            float v21 = [MEMORY[0x263F16A30] geometrySourceWithData:v20 semantic:v12 vectorCount:v17 floatComponents:1 componentsPerVector:3 bytesPerComponent:2 dataOffset:0 dataStride:8];
            [v64 addObject:v21];
          }
          else
          {
            [v64 addObject:v14];
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v77 objects:v83 count:16];
      }
      while (v10);
    }
    else
    {
      uint64_t v65 = 0;
      uint64_t v66 = 0;
    }

    uint64_t v22 = (void *)MEMORY[0x263F16A10];
    uint64_t v23 = [v60 geometryElements];
    uint64_t v24 = [v60 geometrySourceChannels];
    int v25 = [v22 geometryWithSources:v64 elements:v23 sourceChannels:v24];

    id v26 = [v60 name];
    [v25 setName:v26];

    id v27 = [v60 materials];
    [v25 setMaterials:v27];

    uint64_t v28 = [v60 edgeCreasesSource];
    [v25 setEdgeCreasesSource:v28];

    float v29 = [v60 edgeCreasesElement];
    [v25 setEdgeCreasesElement:v29];

    double v30 = [v60 tessellator];
    [v25 setTessellator:v30];

    objc_msgSend(v25, "setSubdivisionLevel:", objc_msgSend(v60, "subdivisionLevel"));
    id v59 = v7;
    [v7 setGeometry:v25];
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    uint64_t v61 = self->_indicesOfTargetsToFlattenInBaseGeometry;
    uint64_t v31 = [(NSMutableArray *)v61 countByEnumeratingWithState:&v73 objects:v82 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v74;
      do
      {
        for (uint64_t j = 0; j != v32; ++j)
        {
          if (*(void *)v74 != v33) {
            objc_enumerationMutation(v61);
          }
          double v35 = *(void **)(*((void *)&v73 + 1) + 8 * j);
          uint64_t v36 = [v35 unsignedIntegerValue];
          double v37 = [(NSArray *)self->_oldMainTargets objectAtIndexedSubscript:v36];
          uint64_t v38 = [(NSMutableDictionary *)self->_nonOneWeightsOfTargetsToFlatten objectForKeyedSubscript:v35];
          uint64_t v39 = v38;
          if (v38)
          {
            [v38 floatValue];
            float v41 = v40;
          }
          else
          {
            float v41 = 1.0;
          }
          id v42 = [v6 inBetweenWeightsForTargetAtIndex:v36];
          long long v43 = [v6 inBetweenTargetsForTargetAtIndex:v36];
          v72[0] = MEMORY[0x263EF8330];
          v72[1] = 3221225472;
          v72[2] = __81__AVTAvatarMemoryOptimizer_flattenRelevantTargetsOfMorpher_inBaseGeometryOfNode___block_invoke;
          v72[3] = &unk_26401F378;
          v72[4] = self;
          v72[5] = v65;
          v72[6] = v66;
          *(float *)&double v44 = v41;
          [(AVTAvatarMemoryOptimizer *)self resolveInBetweensForTarget:v37 weight:v42 inBetweenWeights:v43 inBetweenTargets:v72 block:v44];
        }
        uint64_t v32 = [(NSMutableArray *)v61 countByEnumeratingWithState:&v73 objects:v82 count:16];
      }
      while (v32);
    }

    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    v62 = self->_indicesOfCorrectivesToFlattenInBaseGeometry;
    uint64_t v45 = [(NSMutableArray *)v62 countByEnumeratingWithState:&v68 objects:v81 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v69;
      do
      {
        for (uint64_t k = 0; k != v46; ++k)
        {
          if (*(void *)v69 != v47) {
            objc_enumerationMutation(v62);
          }
          v49 = *(void **)(*((void *)&v68 + 1) + 8 * k);
          uint64_t v50 = [v49 unsignedIntegerValue];
          uint64_t v51 = [(NSArray *)self->_oldCorrectives objectAtIndexedSubscript:v50];
          unint64_t v52 = [(NSMutableDictionary *)self->_nonOneWeightsOfCorrectivesToFlatten objectForKeyedSubscript:v49];
          id v53 = v52;
          if (v52)
          {
            [v52 floatValue];
            float v55 = v54;
          }
          else
          {
            float v55 = 1.0;
          }
          long long v56 = [v6 inBetweenWeightsForCorrectiveAtIndex:v50];
          uint64_t v57 = [v6 inBetweenTargetsForCorrectiveAtIndex:v50];
          v67[0] = MEMORY[0x263EF8330];
          v67[1] = 3221225472;
          v67[2] = __81__AVTAvatarMemoryOptimizer_flattenRelevantTargetsOfMorpher_inBaseGeometryOfNode___block_invoke_2;
          v67[3] = &unk_26401F378;
          v67[4] = self;
          v67[5] = v65;
          v67[6] = v66;
          *(float *)&double v58 = v55;
          [(AVTAvatarMemoryOptimizer *)self resolveInBetweensForTarget:v51 weight:v56 inBetweenWeights:v57 inBetweenTargets:v67 block:v58];
        }
        uint64_t v46 = [(NSMutableArray *)v62 countByEnumeratingWithState:&v68 objects:v81 count:16];
      }
      while (v46);
    }

    id v7 = v59;
  }
}

void __81__AVTAvatarMemoryOptimizer_flattenRelevantTargetsOfMorpher_inBaseGeometryOfNode___block_invoke(uint64_t a1, uint64_t a2, void *a3, float a4, float a5)
{
  id v12 = a3;
  *(float *)&double v9 = a4;
  [*(id *)(a1 + 32) applyMorphTarget:a2 weight:*(void *)(a1 + 40) toBaseGeometryBuffer:*(void *)(a1 + 48) vertexCount:v9];
  uint64_t v11 = v12;
  if (v12)
  {
    *(float *)&double v10 = a5;
    [*(id *)(a1 + 32) applyMorphTarget:v12 weight:*(void *)(a1 + 40) toBaseGeometryBuffer:*(void *)(a1 + 48) vertexCount:v10];
    uint64_t v11 = v12;
  }
}

void __81__AVTAvatarMemoryOptimizer_flattenRelevantTargetsOfMorpher_inBaseGeometryOfNode___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, float a4, float a5)
{
  id v12 = a3;
  *(float *)&double v9 = a4;
  [*(id *)(a1 + 32) applyMorphTarget:a2 weight:*(void *)(a1 + 40) toBaseGeometryBuffer:*(void *)(a1 + 48) vertexCount:v9];
  uint64_t v11 = v12;
  if (v12)
  {
    *(float *)&double v10 = a5;
    [*(id *)(a1 + 32) applyMorphTarget:v12 weight:*(void *)(a1 + 40) toBaseGeometryBuffer:*(void *)(a1 + 48) vertexCount:v10];
    uint64_t v11 = v12;
  }
}

- (void)flattenRelevantTargetsInOtherTargetsOfMorpher:(id)a3
{
  id v4 = a3;
  if ([(NSMutableDictionary *)self->_indicesOfTargetsToFlattenInOtherTarget count]
    && self->_indicesOfCorrectivesToFlattenInMainTarget)
  {
    if ([(NSArray *)self->_oldMainTargets count])
    {
      unint64_t v5 = 0;
      do
      {
        id v6 = [NSNumber numberWithUnsignedInteger:v5];
        uint64_t v7 = [(NSMutableDictionary *)self->_indicesOfTargetsToFlattenInOtherTarget objectForKeyedSubscript:v6];
        uint64_t v8 = [(NSMutableDictionary *)self->_indicesOfCorrectivesToFlattenInMainTarget objectForKeyedSubscript:v6];
        if (v7 | v8) {
          [(AVTAvatarMemoryOptimizer *)self flattenTargetsAtIndices:v7 correctivesAtIndices:v8 inTargetAtIndex:v5 morpher:v4];
        }

        ++v5;
      }
      while (v5 < [(NSArray *)self->_oldMainTargets count]);
    }
  }
  else
  {
    indicesOfTargetsToFlattenInOtherTarget = self->_indicesOfTargetsToFlattenInOtherTarget;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __74__AVTAvatarMemoryOptimizer_flattenRelevantTargetsInOtherTargetsOfMorpher___block_invoke;
    v18[3] = &unk_26401F3A0;
    v18[4] = self;
    id v10 = v4;
    id v19 = v10;
    [(NSMutableDictionary *)indicesOfTargetsToFlattenInOtherTarget enumerateKeysAndObjectsUsingBlock:v18];
    indicesOfCorrectivesToFlattenInMainTarget = self->_indicesOfCorrectivesToFlattenInMainTarget;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __74__AVTAvatarMemoryOptimizer_flattenRelevantTargetsInOtherTargetsOfMorpher___block_invoke_2;
    v16[3] = &unk_26401F3A0;
    v16[4] = self;
    id v17 = v10;
    [(NSMutableDictionary *)indicesOfCorrectivesToFlattenInMainTarget enumerateKeysAndObjectsUsingBlock:v16];
  }
  indicesOfCorrectivesToFlattenInOtherCorrective = self->_indicesOfCorrectivesToFlattenInOtherCorrective;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __74__AVTAvatarMemoryOptimizer_flattenRelevantTargetsInOtherTargetsOfMorpher___block_invoke_3;
  v14[3] = &unk_26401F3A0;
  v14[4] = self;
  id v15 = v4;
  id v13 = v4;
  [(NSMutableDictionary *)indicesOfCorrectivesToFlattenInOtherCorrective enumerateKeysAndObjectsUsingBlock:v14];
}

void __74__AVTAvatarMemoryOptimizer_flattenRelevantTargetsInOtherTargetsOfMorpher___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "flattenTargetsAtIndices:correctivesAtIndices:inTargetAtIndex:morpher:", v5, 0, objc_msgSend(a2, "unsignedIntegerValue"), *(void *)(a1 + 40));
}

void __74__AVTAvatarMemoryOptimizer_flattenRelevantTargetsInOtherTargetsOfMorpher___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "flattenTargetsAtIndices:correctivesAtIndices:inTargetAtIndex:morpher:", 0, v5, objc_msgSend(a2, "unsignedIntegerValue"), *(void *)(a1 + 40));
}

void __74__AVTAvatarMemoryOptimizer_flattenRelevantTargetsInOtherTargetsOfMorpher___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "flattenCorrectivesAtIndices:inCorrectiveAtIndex:morpher:", v5, objc_msgSend(a2, "unsignedIntegerValue"), *(void *)(a1 + 40));
}

- (void)flattenTargetsAtIndices:(id)a3 correctivesAtIndices:(id)a4 inTargetAtIndex:(unint64_t)a5 morpher:(id)a6
{
  id v24 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = [(NSArray *)self->_oldMainTargets objectAtIndexedSubscript:a5];
  LODWORD(v13) = 1.0;
  [(AVTAvatarMemoryOptimizer *)self flattenTargetsAtIndices:v24 correctivesAtIndices:v10 inTarget:v12 weight:v11 morpher:v13];
  id v14 = [v11 inBetweenWeightsForTargetAtIndex:a5];
  id v15 = [v11 inBetweenTargetsForTargetAtIndex:a5];
  uint64_t v16 = [v15 count];
  if (v16)
  {
    uint64_t v17 = v16;
    for (uint64_t i = 0; i != v17; ++i)
    {
      id v19 = [v15 objectAtIndexedSubscript:i];
      id v20 = [v14 objectAtIndexedSubscript:i];
      [v20 floatValue];
      int v22 = v21;

      LODWORD(v23) = v22;
      [(AVTAvatarMemoryOptimizer *)self flattenTargetsAtIndices:v24 correctivesAtIndices:v10 inTarget:v19 weight:v11 morpher:v23];
    }
  }
}

- (void)flattenTargetsAtIndices:(id)a3 correctivesAtIndices:(id)a4 inTarget:(id)a5 weight:(float)a6 morpher:(id)a7
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v43 = a4;
  id v13 = a5;
  id v14 = a7;
  uint64_t v46 = v13;
  uint64_t v15 = [(NSMutableArray *)self->_newTargetsAndInBetweens indexOfObjectIdenticalTo:v13];
  if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
    -[AVTAvatarMemoryOptimizer flattenTargetsAtIndices:correctivesAtIndices:inTarget:weight:morpher:]();
  }
  uint64_t v42 = v15;
  uint64_t v63 = 0;
  unint64_t v64 = &v63;
  uint64_t v65 = 0x3032000000;
  uint64_t v66 = __Block_byref_object_copy_;
  id v67 = __Block_byref_object_dispose_;
  id v68 = 0;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  obuint64_t j = v12;
  uint64_t v16 = [obj countByEnumeratingWithState:&v59 objects:v70 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v60 != v17) {
          objc_enumerationMutation(obj);
        }
        id v19 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        uint64_t v20 = objc_msgSend(v19, "unsignedIntegerValue", v42, v43);
        int v21 = [(NSArray *)self->_oldMainTargets objectAtIndexedSubscript:v20];
        int v22 = [(NSMutableDictionary *)self->_nonOneWeightsOfTargetsToFlatten objectForKeyedSubscript:v19];
        double v23 = v22;
        if (v22)
        {
          [v22 floatValue];
          float v25 = v24;
        }
        else
        {
          float v25 = 1.0;
        }
        id v26 = [v14 inBetweenWeightsForTargetAtIndex:v20];
        id v27 = [v14 inBetweenTargetsForTargetAtIndex:v20];
        v55[0] = MEMORY[0x263EF8330];
        v55[1] = 3221225472;
        v55[2] = __97__AVTAvatarMemoryOptimizer_flattenTargetsAtIndices_correctivesAtIndices_inTarget_weight_morpher___block_invoke;
        v55[3] = &unk_26401F3C8;
        uint64_t v57 = &v63;
        v55[4] = self;
        float v58 = a6;
        id v56 = v46;
        *(float *)&double v28 = v25;
        [(AVTAvatarMemoryOptimizer *)self resolveInBetweensForTarget:v21 weight:v26 inBetweenWeights:v27 inBetweenTargets:v55 block:v28];
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v59 objects:v70 count:16];
    }
    while (v16);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v44 = v43;
  uint64_t v29 = [v44 countByEnumeratingWithState:&v51 objects:v69 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v52;
    do
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v52 != v30) {
          objc_enumerationMutation(v44);
        }
        uint64_t v32 = *(void **)(*((void *)&v51 + 1) + 8 * j);
        uint64_t v33 = objc_msgSend(v32, "unsignedIntegerValue", v42);
        uint64_t v34 = [(NSArray *)self->_oldCorrectives objectAtIndexedSubscript:v33];
        double v35 = [(NSMutableDictionary *)self->_nonOneWeightsOfCorrectivesToFlatten objectForKeyedSubscript:v32];
        uint64_t v36 = v35;
        if (v35)
        {
          [v35 floatValue];
          float v38 = v37;
        }
        else
        {
          float v38 = 1.0;
        }
        uint64_t v39 = [v14 inBetweenWeightsForCorrectiveAtIndex:v33];
        float v40 = [v14 inBetweenTargetsForCorrectiveAtIndex:v33];
        v47[0] = MEMORY[0x263EF8330];
        v47[1] = 3221225472;
        v47[2] = __97__AVTAvatarMemoryOptimizer_flattenTargetsAtIndices_correctivesAtIndices_inTarget_weight_morpher___block_invoke_2;
        v47[3] = &unk_26401F3C8;
        v49 = &v63;
        v47[4] = self;
        float v50 = a6;
        id v48 = v46;
        *(float *)&double v41 = v38;
        [(AVTAvatarMemoryOptimizer *)self resolveInBetweensForTarget:v34 weight:v39 inBetweenWeights:v40 inBetweenTargets:v47 block:v41];
      }
      uint64_t v29 = [v44 countByEnumeratingWithState:&v51 objects:v69 count:16];
    }
    while (v29);
  }

  if (!v64[5]) {
    __assert_rtn("-[AVTAvatarMemoryOptimizer flattenTargetsAtIndices:correctivesAtIndices:inTarget:weight:morpher:]", "AVTAvatarMemoryOptimizer.m", 1219, "newTargetWithFlattenedTargets != nil");
  }
  -[NSMutableArray replaceObjectAtIndex:withObject:](self->_newTargetsAndInBetweens, "replaceObjectAtIndex:withObject:", v42);
  _Block_object_dispose(&v63, 8);
}

uint64_t __97__AVTAvatarMemoryOptimizer_flattenTargetsAtIndices_correctivesAtIndices_inTarget_weight_morpher___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  float v6 = *(float *)(a1 + 56);
  *(float *)&a4 = v6 * *(float *)&a4;
  *(float *)&a5 = v6 * *(float *)&a5;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) flattenTarget0:a2 weight0:a3 target1:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) weight1:*(void *)(a1 + 40) inMorphTarget:a4 originalMorphTarget:a5];
  return MEMORY[0x270F9A758]();
}

uint64_t __97__AVTAvatarMemoryOptimizer_flattenTargetsAtIndices_correctivesAtIndices_inTarget_weight_morpher___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  float v6 = *(float *)(a1 + 56);
  *(float *)&a4 = v6 * *(float *)&a4;
  *(float *)&a5 = v6 * *(float *)&a5;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) flattenTarget0:a2 weight0:a3 target1:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) weight1:*(void *)(a1 + 40) inMorphTarget:a4 originalMorphTarget:a5];
  return MEMORY[0x270F9A758]();
}

- (void)flattenCorrectivesAtIndices:(id)a3 inCorrectiveAtIndex:(unint64_t)a4 morpher:(id)a5
{
  id v21 = a3;
  id v8 = a5;
  double v9 = [(NSArray *)self->_oldCorrectives objectAtIndexedSubscript:a4];
  LODWORD(v10) = 1.0;
  [(AVTAvatarMemoryOptimizer *)self flattenCorrectivesAtIndices:v21 inCorrective:v9 weight:v8 morpher:v10];
  id v11 = [v8 inBetweenWeightsForCorrectiveAtIndex:a4];
  id v12 = [v8 inBetweenTargetsForCorrectiveAtIndex:a4];
  uint64_t v13 = [v12 count];
  if (v13)
  {
    uint64_t v14 = v13;
    for (uint64_t i = 0; i != v14; ++i)
    {
      uint64_t v16 = [v12 objectAtIndexedSubscript:i];
      uint64_t v17 = [v11 objectAtIndexedSubscript:i];
      [v17 floatValue];
      int v19 = v18;

      LODWORD(v20) = v19;
      [(AVTAvatarMemoryOptimizer *)self flattenCorrectivesAtIndices:v21 inCorrective:v16 weight:v8 morpher:v20];
    }
  }
}

- (void)flattenCorrectivesAtIndices:(id)a3 inCorrective:(id)a4 weight:(float)a5 morpher:(id)a6
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v29 = v11;
  uint64_t v13 = [(NSMutableArray *)self->_newCorrectivesAndInBetweens indexOfObjectIdenticalTo:v11];
  if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
    -[AVTAvatarMemoryOptimizer flattenCorrectivesAtIndices:inCorrective:weight:morpher:]();
  }
  uint64_t v27 = v13;
  uint64_t v38 = 0;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x3032000000;
  double v41 = __Block_byref_object_copy_;
  uint64_t v42 = __Block_byref_object_dispose_;
  id v43 = 0;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obuint64_t j = v10;
  uint64_t v14 = [obj countByEnumeratingWithState:&v34 objects:v44 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v35 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v18 = [v17 unsignedIntegerValue];
        int v19 = [(NSArray *)self->_oldCorrectives objectAtIndexedSubscript:v18];
        double v20 = [(NSMutableDictionary *)self->_nonOneWeightsOfCorrectivesToFlatten objectForKeyedSubscript:v17];
        id v21 = v20;
        if (v20)
        {
          [v20 floatValue];
          float v23 = v22;
        }
        else
        {
          float v23 = 1.0;
        }
        float v24 = [v12 inBetweenWeightsForCorrectiveAtIndex:v18];
        float v25 = [v12 inBetweenTargetsForCorrectiveAtIndex:v18];
        v30[0] = MEMORY[0x263EF8330];
        v30[1] = 3221225472;
        v30[2] = __84__AVTAvatarMemoryOptimizer_flattenCorrectivesAtIndices_inCorrective_weight_morpher___block_invoke;
        v30[3] = &unk_26401F3C8;
        uint64_t v32 = &v38;
        v30[4] = self;
        float v33 = a5;
        id v31 = v29;
        *(float *)&double v26 = v23;
        [(AVTAvatarMemoryOptimizer *)self resolveInBetweensForTarget:v19 weight:v24 inBetweenWeights:v25 inBetweenTargets:v30 block:v26];
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v34 objects:v44 count:16];
    }
    while (v14);
  }

  if (!v39[5]) {
    __assert_rtn("-[AVTAvatarMemoryOptimizer flattenCorrectivesAtIndices:inCorrective:weight:morpher:]", "AVTAvatarMemoryOptimizer.m", 1281, "newCorrectiveWithFlattenedCorrectives != nil");
  }
  -[NSMutableArray replaceObjectAtIndex:withObject:](self->_newCorrectivesAndInBetweens, "replaceObjectAtIndex:withObject:", v27);
  _Block_object_dispose(&v38, 8);
}

uint64_t __84__AVTAvatarMemoryOptimizer_flattenCorrectivesAtIndices_inCorrective_weight_morpher___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  float v6 = *(float *)(a1 + 56);
  *(float *)&a4 = v6 * *(float *)&a4;
  *(float *)&a5 = v6 * *(float *)&a5;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) flattenTarget0:a2 weight0:a3 target1:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) weight1:*(void *)(a1 + 40) inMorphTarget:a4 originalMorphTarget:a5];
  return MEMORY[0x270F9A758]();
}

- (void)resolveInBetweensForTarget:(id)a3 weight:(float)a4 inBetweenWeights:(id)a5 inBetweenTargets:(id)a6 block:(id)a7
{
  id v28 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = (void (**)(id, id, void, float, double))a7;
  uint64_t v14 = [v12 count];
  if (!v14)
  {
    v13[2](v13, v28, 0, a4, 0.0);
    goto LABEL_18;
  }
  unint64_t v15 = v14;
  uint64_t v16 = 0;
  while (v15 != v16)
  {
    id v17 = [v12 objectAtIndexedSubscript:v16];
    if (a4 < 1.0)
    {
      id v21 = [v11 objectAtIndexedSubscript:v16];
      [v21 floatValue];
      float v20 = v22;

      goto LABEL_8;
    }
LABEL_9:

    if (++v16 > v15) {
      goto LABEL_18;
    }
  }
  id v17 = v28;
  float v20 = 1.0;
  if (a4 >= 1.0) {
    goto LABEL_15;
  }
LABEL_8:
  if (v20 < a4) {
    goto LABEL_9;
  }
  if (v16)
  {
    uint64_t v23 = v16 - 1;
    float v24 = [v11 objectAtIndexedSubscript:v23];
    [v24 floatValue];
    float v26 = v25;

    a4 = (float)(a4 - v26) / (float)(v20 - v26);
    if (a4 < 1.0)
    {
      uint64_t v27 = [v12 objectAtIndexedSubscript:v23];
      ((void (**)(id, id, id, float, double))v13)[2](v13, v27, v17, 1.0 - a4, a4);

      goto LABEL_17;
    }
LABEL_15:
    v19.n128_u64[0] = 0;
    v18.n128_f32[0] = a4;
    ((void (*)(void (**)(id, id, void, float, double), id, void, __n128, __n128))v13[2])(v13, v17, 0, v18, v19);
    goto LABEL_17;
  }
  v18.n128_f32[0] = a4 / v20;
  v19.n128_u64[0] = 0;
  ((void (*)(void (**)(id, id, void, float, double), id, void, __n128, __n128))v13[2])(v13, v17, 0, v18, v19);
LABEL_17:

LABEL_18:
}

- (id)flattenTarget0:(id)a3 weight0:(float)a4 target1:(id)a5 weight1:(float)a6 inMorphTarget:(id)a7 originalMorphTarget:(id)a8
{
  v36[1] = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  __n128 v18 = v17;
  if (v16)
  {
    __n128 v19 = [v16 geometrySources];
    float v20 = [v19 firstObject];

    uint64_t v21 = [v20 vectorCount];
    id v22 = [v20 data];
    uint64_t v23 = [v22 mutableBytes];
  }
  else
  {
    float v24 = [v17 geometrySources];
    float v20 = [v24 firstObject];

    uint64_t v21 = [v20 vectorCount];
    float v25 = [v20 data];
    float v26 = (void *)[v25 mutableCopy];

    long long v35 = self;
    id v27 = v26;
    uint64_t v23 = [v27 mutableBytes];
    id v28 = [MEMORY[0x263F16A30] geometrySourceWithData:v27 semantic:*MEMORY[0x263F16B50] vectorCount:v21 floatComponents:1 componentsPerVector:3 bytesPerComponent:4 dataOffset:0 dataStride:12];
    uint64_t v29 = (void *)MEMORY[0x263F16A10];
    v36[0] = v28;
    uint64_t v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:1];
    id v16 = [v29 geometryWithSources:v30 elements:0];

    id v31 = [v18 name];
    [v16 setName:v31];

    self = v35;
  }

  *(float *)&double v32 = a4;
  [(AVTAvatarMemoryOptimizer *)self applyMorphTarget:v14 weight:v23 toMorphTargetBuffer:v21 vertexCount:v32];
  if (v15)
  {
    *(float *)&double v33 = a6;
    [(AVTAvatarMemoryOptimizer *)self applyMorphTarget:v15 weight:v23 toMorphTargetBuffer:v21 vertexCount:v33];
  }

  return v16;
}

- (void)applyMorphTarget:(id)a3 weight:(float)a4 toBaseGeometryBuffer:(void *)a5 vertexCount:(unint64_t)a6
{
  id v9 = a3;
  if (a4 <= 0.0) {
    -[AVTAvatarMemoryOptimizer applyMorphTarget:weight:toBaseGeometryBuffer:vertexCount:]();
  }
  id v45 = v9;
  id v10 = [v9 geometrySources];
  id v11 = [v10 firstObject];

  id v12 = [v11 data];
  uint64_t v13 = [v12 bytes];

  if (a6)
  {
    id v14 = (float *)(v13 + 8);
    id v15 = (char *)a5 + 4;
    do
    {
      unsigned int v16 = (unsigned __int16)*(v15 - 2);
      int v17 = (v16 >> 10) & 0x1F;
      if (v17 == 31) {
        int v18 = 2139095040;
      }
      else {
        int v18 = (v16 >> 10) & 0x1F;
      }
      if (v17) {
        BOOL v19 = v17 == 31;
      }
      else {
        BOOL v19 = 1;
      }
      if (v19) {
        int v20 = v18;
      }
      else {
        int v20 = (v17 << 23) + 939524096;
      }
      float v21 = COERCE_FLOAT(v20 | (v16 << 16) & 0x80000000 | (v16 >> 7) & 7 | (8 * (v16 & 0x3FF)) & 0x1FFF | ((v16 & 0x3FF) << 13))
          + (float)(a4 * *(v14 - 2));
      int v22 = HIWORD(LODWORD(v21)) & 0x8000;
      unsigned int v23 = (LODWORD(v21) >> 23);
      if (v23 - 113 > 0x1D)
      {
        if (v23 >= 0x71)
        {
          if (v23 == 255) {
            LOWORD(v22) = HIWORD(v21) & 0x8000 | ((LODWORD(v21) & 0x7FFFFF) != 0) | 0x7C00;
          }
          else {
            LOWORD(v22) = v22 | 0x7BFF;
          }
        }
      }
      else
      {
        int v22 = HIWORD(LODWORD(v21)) & 0x8000 | (LODWORD(v21) >> 13) & 0x3FF | ((v23 - 112) << 10);
      }
      *(v15 - 2) = v22;
      unsigned int v24 = (unsigned __int16)*(v15 - 1);
      int v25 = (v24 >> 10) & 0x1F;
      if (v25 && v25 != 31)
      {
        int v25 = (v25 << 23) + 939524096;
      }
      else if (v25 == 31)
      {
        int v25 = 2139095040;
      }
      float v26 = COERCE_FLOAT(v25 | (v24 << 16) & 0x80000000 | (v24 >> 7) & 7 | (8 * (v24 & 0x3FF)) & 0x1FFF | ((v24 & 0x3FF) << 13))
          + (float)(a4 * *(v14 - 1));
      int v27 = HIWORD(LODWORD(v26)) & 0x8000;
      unsigned int v28 = (LODWORD(v26) >> 23);
      unsigned int v29 = v28 - 112;
      unsigned int v30 = v28 - 113;
      __int16 v31 = v27 | 0x7BFF;
      if (v28 == 255) {
        __int16 v31 = v27 | ((LODWORD(v26) & 0x7FFFFF) != 0) | 0x7C00;
      }
      if (v28 >= 0x71) {
        __int16 v32 = v31;
      }
      else {
        __int16 v32 = HIWORD(v26) & 0x8000;
      }
      int v33 = HIWORD(LODWORD(v26)) & 0x8000 | (LODWORD(v26) >> 13) & 0x3FF | (v29 << 10);
      if (v30 > 0x1D) {
        LOWORD(v33) = v32;
      }
      *(v15 - 1) = v33;
      unsigned int v34 = (unsigned __int16)*v15;
      int v35 = (v34 >> 10) & 0x1F;
      if (v35 && v35 != 31)
      {
        int v35 = (v35 << 23) + 939524096;
      }
      else if (v35 == 31)
      {
        int v35 = 2139095040;
      }
      float v36 = *v14;
      v14 += 3;
      float v37 = COERCE_FLOAT(v35 | (v34 << 16) & 0x80000000 | (v34 >> 7) & 7 | (8 * (v34 & 0x3FF)) & 0x1FFF | ((v34 & 0x3FF) << 13))
          + (float)(a4 * v36);
      int v38 = HIWORD(LODWORD(v37)) & 0x8000;
      unsigned int v39 = (LODWORD(v37) >> 23);
      unsigned int v40 = v39 - 112;
      unsigned int v41 = v39 - 113;
      __int16 v42 = v38 | 0x7BFF;
      if (v39 == 255) {
        __int16 v42 = v38 | ((LODWORD(v37) & 0x7FFFFF) != 0) | 0x7C00;
      }
      if (v39 >= 0x71) {
        __int16 v43 = v42;
      }
      else {
        __int16 v43 = HIWORD(v37) & 0x8000;
      }
      int v44 = HIWORD(LODWORD(v37)) & 0x8000 | (LODWORD(v37) >> 13) & 0x3FF | (v40 << 10);
      if (v41 > 0x1D) {
        LOWORD(v44) = v43;
      }
      *id v15 = v44;
      v15 += 4;
      --a6;
    }
    while (a6);
  }
}

- (void)applyMorphTarget:(id)a3 weight:(float)a4 toMorphTargetBuffer:(id *)a5 vertexCount:(unint64_t)a6
{
  double v18 = *(double *)&a4;
  id v8 = a3;
  if (*(float *)&v18 <= 0.0) {
    -[AVTAvatarMemoryOptimizer applyMorphTarget:weight:toMorphTargetBuffer:vertexCount:]();
  }
  id v17 = v8;
  id v9 = objc_msgSend(v8, "geometrySources", v18);
  id v10 = [v9 firstObject];

  id v11 = [v10 data];
  uint64_t v12 = [v11 bytes];

  if (a6)
  {
    float32x4_t v15 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v18, 0);
    unsigned int v16 = (_DWORD *)(v12 + 8);
    do
    {
      v13.i64[0] = *(void *)&a5->var0;
      v13.i32[2] = LODWORD(a5->var2);
      v14.i64[0] = *((void *)v16 - 1);
      v14.i32[2] = *v16;
      float32x4_t v13 = vmlaq_f32(v13, v14, v15);
      LODWORD(a5->var2) = v13.i32[2];
      *(void *)&a5->var0 = v13.i64[0];
      ++a5;
      v16 += 3;
      --a6;
    }
    while (a6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonOneWeightsOfCorrectivesToFlatten, 0);
  objc_storeStrong((id *)&self->_indicesOfCorrectivesToFlattenInOtherCorrective, 0);
  objc_storeStrong((id *)&self->_indicesOfCorrectivesToFlattenInMainTarget, 0);
  objc_storeStrong((id *)&self->_indicesOfCorrectivesToFlattenInBaseGeometry, 0);
  objc_storeStrong((id *)&self->_newCorrectiveInBetweenWeights, 0);
  objc_storeStrong((id *)&self->_newCorrectiveInBetweenCounts, 0);
  objc_storeStrong((id *)&self->_newCorrectiveDriverIndices, 0);
  objc_storeStrong((id *)&self->_newCorrectiveDriverCounts, 0);
  objc_storeStrong((id *)&self->_newCorrectivesAndInBetweens, 0);
  objc_storeStrong((id *)&self->_oldCorrectiveDriverIndices, 0);
  objc_storeStrong((id *)&self->_oldCorrectiveDriverCounts, 0);
  objc_storeStrong((id *)&self->_oldCorrectives, 0);
  objc_storeStrong((id *)&self->_nonOneWeightsOfTargetsToFlatten, 0);
  objc_storeStrong((id *)&self->_indicesOfTargetsToFlattenInOtherTarget, 0);
  objc_storeStrong((id *)&self->_indicesOfTargetsToFlattenInBaseGeometry, 0);
  objc_storeStrong((id *)&self->_newInBetweenWeights, 0);
  objc_storeStrong((id *)&self->_newInBetweenCounts, 0);
  objc_storeStrong((id *)&self->_newTargetsAndInBetweens, 0);
  objc_storeStrong((id *)&self->_newWeights, 0);
  objc_storeStrong((id *)&self->_oldMainTargets, 0);
  objc_storeStrong((id *)&self->_oldWeights, 0);
  objc_storeStrong((id *)&self->_presetVariantPrefixes, 0);
  objc_storeStrong((id *)&self->_requiredMorphVariantComponents, 0);
  objc_storeStrong((id *)&self->_requiredVariantsPerMorpher, 0);
  objc_storeStrong((id *)&self->_memoji, 0);
}

- (void)registerRequiredVariant:weight:inHierarchy:.cold.1()
{
}

- (void)optimizeNodeHierarchy:.cold.1()
{
}

- (void)classifyTargetsOfMorpher:(os_log_t)log node:.cold.1(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "newDriverIndex != NSNotFound";
  _os_log_error_impl(&dword_20B819000, log, OS_LOG_TYPE_ERROR, "Error: Condition '%s' failed. Failed to find driver in new updated main targets", buf, 0xCu);
}

void __58__AVTAvatarMemoryOptimizer_classifyTargetsOfMorpher_node___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_1();
  _os_log_error_impl(&dword_20B819000, v0, OS_LOG_TYPE_ERROR, "Error: Failed to optimize corrective with more than %d targets: %@", v1, 0x12u);
}

void __58__AVTAvatarMemoryOptimizer_classifyTargetsOfMorpher_node___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_20B819000, v0, v1, "Error: Unreachable code: Flattening the corrective %@ should lead to single animation target %@ that is always supposed to exist");
}

void __58__AVTAvatarMemoryOptimizer_classifyTargetsOfMorpher_node___block_invoke_cold_3()
{
  __assert_rtn("-[AVTAvatarMemoryOptimizer classifyTargetsOfMorpher:node:]_block_invoke_2", "AVTAvatarMemoryOptimizer.m", 465, "numberOfDrivingTargetsKeptForVariant + numberOfDrivingTargetsKeptForAnimation == numberOfDrivingTargets");
}

void __58__AVTAvatarMemoryOptimizer_classifyTargetsOfMorpher_node___block_invoke_cold_4()
{
  __assert_rtn("-[AVTAvatarMemoryOptimizer classifyTargetsOfMorpher:node:]_block_invoke_2", "AVTAvatarMemoryOptimizer.m", 415, "index != NSNotFound");
}

void __58__AVTAvatarMemoryOptimizer_classifyTargetsOfMorpher_node___block_invoke_cold_5()
{
}

void __58__AVTAvatarMemoryOptimizer_classifyTargetsOfMorpher_node___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v4 = [*(id *)(*(void *)a1 + 136) objectAtIndexedSubscript:a2];
  OUTLINED_FUNCTION_0_1();
  _os_log_error_impl(&dword_20B819000, a3, OS_LOG_TYPE_ERROR, "Error: Failed to optimize corrective with more than %d targets: %@", v5, 0x12u);
}

void __58__AVTAvatarMemoryOptimizer_classifyTargetsOfMorpher_node___block_invoke_2_cold_3()
{
  __assert_rtn("-[AVTAvatarMemoryOptimizer classifyTargetsOfMorpher:node:]_block_invoke_2", "AVTAvatarMemoryOptimizer.m", 680, "numberOfDrivingTargetsKeptForVariant + numberOfDrivingTargetsKeptForAnimation == numberOfDrivingTargets");
}

- (void)flattenTargetsAtIndices:correctivesAtIndices:inTarget:weight:morpher:.cold.1()
{
  __assert_rtn("-[AVTAvatarMemoryOptimizer flattenTargetsAtIndices:correctivesAtIndices:inTarget:weight:morpher:]", "AVTAvatarMemoryOptimizer.m", 1171, "indexOfDestinationTargetInTargetsAndInBetweens != NSNotFound");
}

- (void)flattenCorrectivesAtIndices:inCorrective:weight:morpher:.cold.1()
{
  __assert_rtn("-[AVTAvatarMemoryOptimizer flattenCorrectivesAtIndices:inCorrective:weight:morpher:]", "AVTAvatarMemoryOptimizer.m", 1255, "indexOfDestinationCorrectiveInCorrectivesAndInBetweens != NSNotFound");
}

- (void)applyMorphTarget:weight:toBaseGeometryBuffer:vertexCount:.cold.1()
{
}

- (void)applyMorphTarget:weight:toMorphTargetBuffer:vertexCount:.cold.1()
{
}

@end