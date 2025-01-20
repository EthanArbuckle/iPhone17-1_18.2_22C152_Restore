@interface AXMPhotoVisionSupport
+ (BOOL)_validatePhotosFormatSoftLinkSymbols;
+ (BOOL)axmIsSceneClassId:(unsigned int)a3 childOfSceneClassId:(unsigned int)a4;
+ (id)_collectLabelsIncludingLeafNodes:(BOOL)a3 nonLeafNodes:(BOOL)a4;
+ (id)_deniedVoiceOverObjectClassificationLabels;
+ (id)_deniedVoiceOverSceneClassificationLabels;
+ (id)axmTaxonomyNodeForObjectObservation:(id)a3;
+ (id)axmTaxonomyNodeForSceneTaxonomyNode:(id)a3;
+ (id)buildGraphStatisticsDescription;
+ (id)buildParentChainDescriptionForAllNodes;
+ (id)buildTaxonomyDescription;
+ (id)findLeastCommonAncestorForSceneClassIds:(id)a3 withKnownAncestorSceneClassId:(unsigned int)a4;
+ (id)leafNodeLabels;
+ (id)localizedLabelForClassificationObservation:(id)a3;
+ (id)nonLeafNodeLabels;
+ (id)processSceneClassifications:(id)a3 withOptions:(unsigned int)a4;
+ (void)_addNode:(id)a3 toDescription:(id)a4 atLevel:(int64_t)a5;
@end

@implementation AXMPhotoVisionSupport

+ (id)_deniedVoiceOverSceneClassificationLabels
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__AXMPhotoVisionSupport__deniedVoiceOverSceneClassificationLabels__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_deniedVoiceOverSceneClassificationLabels_onceToken != -1) {
    dispatch_once(&_deniedVoiceOverSceneClassificationLabels_onceToken, block);
  }
  v2 = (void *)_deniedVoiceOverSceneClassificationLabels__DeniedLabels;

  return v2;
}

void __66__AXMPhotoVisionSupport__deniedVoiceOverSceneClassificationLabels__block_invoke(uint64_t a1)
{
  id v5 = [MEMORY[0x1E4F28B50] bundleForClass:*(void *)(a1 + 32)];
  v1 = [v5 pathForResource:@"AXDeniedSceneClassificationLabelsForVoiceOver" ofType:@"plist"];
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v1];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"labels"];
  v4 = (void *)_deniedVoiceOverSceneClassificationLabels__DeniedLabels;
  _deniedVoiceOverSceneClassificationLabels__DeniedLabels = v3;
}

+ (id)_deniedVoiceOverObjectClassificationLabels
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__AXMPhotoVisionSupport__deniedVoiceOverObjectClassificationLabels__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_deniedVoiceOverObjectClassificationLabels_onceToken != -1) {
    dispatch_once(&_deniedVoiceOverObjectClassificationLabels_onceToken, block);
  }
  v2 = (void *)_deniedVoiceOverObjectClassificationLabels__DeniedLabels;

  return v2;
}

void __67__AXMPhotoVisionSupport__deniedVoiceOverObjectClassificationLabels__block_invoke(uint64_t a1)
{
  id v5 = [MEMORY[0x1E4F28B50] bundleForClass:*(void *)(a1 + 32)];
  v1 = [v5 pathForResource:@"AXDeniedObjectClassificationLabelsForVoiceOver" ofType:@"plist"];
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v1];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"labels"];
  v4 = (void *)_deniedVoiceOverObjectClassificationLabels__DeniedLabels;
  _deniedVoiceOverObjectClassificationLabels__DeniedLabels = v3;
}

+ (id)processSceneClassifications:(id)a3 withOptions:(unsigned int)a4
{
  char v4 = a4;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [MEMORY[0x1E4F1CA48] array];
  v32 = [getPFSceneTaxonomyClass() sharedTaxonomy];
  v30 = [MEMORY[0x1E4F1CA80] set];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  obuint64_t j = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v40 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        if ((v4 & 4) != 0)
        {
          v13 = [a1 _deniedVoiceOverSceneClassificationLabels];
          v14 = [v12 identifier];
          char v15 = [v13 containsObject:v14];

          if (v15) {
            continue;
          }
        }
        v16 = [v12 identifier];
        v17 = [v32 nodeForName:v16];

        if (v17)
        {
          if ((v4 & 1) == 0
            || ([v12 confidence], double v19 = v18, objc_msgSend(v17, "searchThreshold"), v20 < v19))
          {
            [v30 addObject:v17];
          }
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v9);
  }

  if ((v4 & 2) != 0)
  {
    v21 = [MEMORY[0x1E4F1CA80] set];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __65__AXMPhotoVisionSupport_processSceneClassifications_withOptions___block_invoke;
    v37[3] = &unk_1E6117B10;
    id v38 = v21;
    id v22 = v21;
    [v30 enumerateObjectsUsingBlock:v37];
    [v30 minusSet:v22];
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v23 = v30;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v34 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = +[AXMPhotoVisionSupport axmTaxonomyNodeForSceneTaxonomyNode:*(void *)(*((void *)&v33 + 1) + 8 * j)];
        [v7 addObject:v28];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v25);
  }

  return v7;
}

void __65__AXMPhotoVisionSupport_processSceneClassifications_withOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__AXMPhotoVisionSupport_processSceneClassifications_withOptions___block_invoke_2;
  v5[3] = &unk_1E6117AE8;
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  [v4 traverse:0 visitor:v5];
}

uint64_t __65__AXMPhotoVisionSupport_processSceneClassifications_withOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isEqual:*(void *)(a1 + 32)] & 1) == 0) {
    [*(id *)(a1 + 40) addObject:v3];
  }

  return 0;
}

+ (id)localizedLabelForClassificationObservation:(id)a3
{
  id v3 = a3;
  id v4 = [getPFSceneTaxonomyClass() sharedTaxonomy];
  id v5 = [v3 identifier];

  id v6 = [v4 nodeForName:v5];

  id v7 = [v6 localizedLabel];

  return v7;
}

+ (id)axmTaxonomyNodeForObjectObservation:(id)a3
{
  id v3 = a3;
  id v4 = [getPFSceneTaxonomyClass() sharedTaxonomy];
  id v5 = [v3 labels];

  id v6 = [v5 firstObject];
  id v7 = [v6 identifier];
  uint64_t v8 = [v4 nodeForName:v7];

  uint64_t v9 = +[AXMPhotoVisionSupport axmTaxonomyNodeForSceneTaxonomyNode:v8];

  return v9;
}

+ (BOOL)axmIsSceneClassId:(unsigned int)a3 childOfSceneClassId:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  id v6 = [getPFSceneTaxonomyClass() sharedTaxonomy];
  id v7 = [v6 nodeForSceneClassId:v5];
  uint64_t v8 = [v6 nodeForSceneClassId:v4];
  uint64_t v9 = [v8 parents];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __63__AXMPhotoVisionSupport_axmIsSceneClassId_childOfSceneClassId___block_invoke;
  v15[3] = &unk_1E6117B38;
  id v16 = v7;
  id v10 = v7;
  v11 = objc_msgSend(v9, "ax_filteredSetUsingBlock:", v15);
  int v12 = [v8 isEqualToNode:v10] ^ 1;
  if (v11) {
    BOOL v13 = 1;
  }
  else {
    BOOL v13 = v12;
  }

  return v13;
}

uint64_t __63__AXMPhotoVisionSupport_axmIsSceneClassId_childOfSceneClassId___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqualToNode:*(void *)(a1 + 32)];
}

+ (id)findLeastCommonAncestorForSceneClassIds:(id)a3 withKnownAncestorSceneClassId:(unsigned int)a4
{
  id v5 = a3;
  id v6 = [getPFSceneTaxonomyClass() sharedTaxonomy];
  id v7 = [MEMORY[0x1E4F1CA80] set];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __95__AXMPhotoVisionSupport_findLeastCommonAncestorForSceneClassIds_withKnownAncestorSceneClassId___block_invoke;
  v40[3] = &unk_1E6116D88;
  id v8 = v6;
  id v41 = v8;
  id v9 = v7;
  id v42 = v9;
  [v5 enumerateObjectsUsingBlock:v40];
  id v10 = [MEMORY[0x1E4F1CA60] dictionary];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __95__AXMPhotoVisionSupport_findLeastCommonAncestorForSceneClassIds_withKnownAncestorSceneClassId___block_invoke_2;
  v37[3] = &unk_1E6117B88;
  unsigned int v39 = a4;
  id v11 = v10;
  id v38 = v11;
  [v9 enumerateObjectsUsingBlock:v37];
  uint64_t v33 = 0;
  long long v34 = &v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0xFFFFFFFFLL;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __95__AXMPhotoVisionSupport_findLeastCommonAncestorForSceneClassIds_withKnownAncestorSceneClassId___block_invoke_4;
  v32[3] = &unk_1E6117BB0;
  v32[4] = &v33;
  [v11 enumerateKeysAndObjectsUsingBlock:v32];
  v30 = v9;
  v31 = v8;
  int v12 = [v11 allValues];
  BOOL v13 = [v12 objectAtIndexedSubscript:0];
  v14 = [v13 objectAtIndexedSubscript:v34[3] - 1];
  uint64_t v15 = [v14 sceneClassId];
  unsigned int v29 = a4;

  uint64_t v16 = v34[3];
LABEL_2:
  v17 = [v12 objectAtIndexedSubscript:0];
  float v18 = [v17 objectAtIndexedSubscript:--v16];
  uint64_t v19 = [v18 sceneClassId];

  unint64_t v20 = 1;
  do
  {
    if (v20 >= [v5 count])
    {
      uint64_t v15 = v19;
      goto LABEL_2;
    }
    v21 = [v12 objectAtIndexedSubscript:v20];
    id v22 = [v21 objectAtIndexedSubscript:v16];
    int v23 = [v22 sceneClassId];

    ++v20;
  }
  while (v19 == v23);
  if (+[AXMPhotoVisionSupport axmIsSceneClassId:v15 childOfSceneClassId:v29])
  {
    uint64_t v25 = v15;
  }
  else
  {
    uint64_t v25 = v29;
  }
  uint64_t v26 = [v31 nodeForSceneClassId:v25];
  v27 = +[AXMPhotoVisionSupport axmTaxonomyNodeForSceneTaxonomyNode:v26];

  _Block_object_dispose(&v33, 8);

  return v27;
}

void __95__AXMPhotoVisionSupport_findLeastCommonAncestorForSceneClassIds_withKnownAncestorSceneClassId___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(a1 + 32), "nodeForSceneClassId:", objc_msgSend(a2, "intValue"));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) addObject:v3];
}

void __95__AXMPhotoVisionSupport_findLeastCommonAncestorForSceneClassIds_withKnownAncestorSceneClassId___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a2;
  id v5 = [v3 array];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __95__AXMPhotoVisionSupport_findLeastCommonAncestorForSceneClassIds_withKnownAncestorSceneClassId___block_invoke_3;
  uint64_t v15 = &unk_1E6117B60;
  int v17 = *(_DWORD *)(a1 + 40);
  id v16 = v5;
  id v6 = v5;
  [v4 traverse:0 visitor:&v12];
  id v7 = *(void **)(a1 + 32);
  id v8 = NSNumber;
  uint64_t v9 = objc_msgSend(v4, "sceneClassId", v12, v13, v14, v15);

  id v10 = [v8 numberWithUnsignedInt:v9];
  id v11 = [v10 stringValue];
  [v7 setValue:v6 forKey:v11];
}

BOOL __95__AXMPhotoVisionSupport_findLeastCommonAncestorForSceneClassIds_withKnownAncestorSceneClassId___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3 sceneClassId];
  int v5 = *(_DWORD *)(a1 + 40);
  if (v4 != v5) {
    [*(id *)(a1 + 32) addObject:v3];
  }

  return v4 == v5;
}

void __95__AXMPhotoVisionSupport_findLeastCommonAncestorForSceneClassIds_withKnownAncestorSceneClassId___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ((unint64_t)[v4 count] < *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v4 count];
  }
}

+ (BOOL)_validatePhotosFormatSoftLinkSymbols
{
  if (_validatePhotosFormatSoftLinkSymbols_onceToken != -1) {
    dispatch_once(&_validatePhotosFormatSoftLinkSymbols_onceToken, &__block_literal_global_12);
  }
  return (_validatePhotosFormatSoftLinkSymbols__SymbolsValid & 1) == 0;
}

void __61__AXMPhotoVisionSupport__validatePhotosFormatSoftLinkSymbols__block_invoke()
{
  if (!PhotosFormatsLibraryCore())
  {
    v0 = AXMediaLogCommon();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
      __61__AXMPhotoVisionSupport__validatePhotosFormatSoftLinkSymbols__block_invoke_cold_1(v0);
    }

    _validatePhotosFormatSoftLinkSymbols__SymbolsValid = 1;
  }
}

+ (id)buildTaxonomyDescription
{
  id v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = [getPFSceneTaxonomyClass() sharedTaxonomy];
  int v5 = [v4 rootNode];
  [a1 _addNode:v5 toDescription:v3 atLevel:0];

  return v3;
}

+ (void)_addNode:(id)a3 toDescription:(id)a4 atLevel:(int64_t)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (a5 >= 1)
  {
    int64_t v10 = a5;
    do
    {
      [v9 appendString:@"   "];
      --v10;
    }
    while (v10);
  }
  id v11 = [v8 name];
  uint64_t v12 = [v8 localizedLabel];
  [v8 searchThreshold];
  [v9 appendFormat:@"%@ - localized:'%@' threshold:%.2f\n", v11, v12, v13];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v14 = [v8 children];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v21;
    int64_t v18 = a5 + 1;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v14);
        }
        [a1 _addNode:*(void *)(*((void *)&v20 + 1) + 8 * v19++) toDescription:v9 atLevel:v18];
      }
      while (v16 != v19);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v16);
  }
}

+ (id)buildParentChainDescriptionForAllNodes
{
  v2 = [MEMORY[0x1E4F28E78] string];
  id v3 = [getPFSceneTaxonomyClass() sharedTaxonomy];
  id v4 = [v3 rootNode];
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__AXMPhotoVisionSupport_buildParentChainDescriptionForAllNodes__block_invoke;
  v7[3] = &unk_1E6117C00;
  id v5 = v2;
  id v8 = v5;
  id v9 = v10;
  [v4 traverse:1 visitor:v7];

  _Block_object_dispose(v10, 8);

  return v5;
}

uint64_t __63__AXMPhotoVisionSupport_buildParentChainDescriptionForAllNodes__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  id v5 = a2;
  id v6 = [v5 name];
  [v3 appendFormat:@"%ld . %@\n"], v4, v6);

  id v7 = [MEMORY[0x1E4F28E78] string];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__AXMPhotoVisionSupport_buildParentChainDescriptionForAllNodes__block_invoke_2;
  v10[3] = &unk_1E6117BD8;
  id v11 = v7;
  id v8 = v7;
  [v5 traverse:0 visitor:v10];

  [*(id *)(a1 + 32) appendFormat:@"   %@\n\n", v8];
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);

  return 0;
}

uint64_t __63__AXMPhotoVisionSupport_buildParentChainDescriptionForAllNodes__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 length];
  id v6 = *(void **)(a1 + 32);
  id v7 = [v4 name];

  if (v5) {
    id v8 = @" > %@";
  }
  else {
    id v8 = @"%@";
  }
  objc_msgSend(v6, "appendFormat:", v8, v7);

  return 0;
}

+ (id)_collectLabelsIncludingLeafNodes:(BOOL)a3 nonLeafNodes:(BOOL)a4
{
  BOOL v5 = a3;
  id v6 = [MEMORY[0x1E4F1CA80] set];
  id v7 = [getPFSceneTaxonomyClass() sharedTaxonomy];
  id v8 = [v7 rootNode];
  id v9 = [MEMORY[0x1E4F1CA48] arrayWithObject:v8];
  int64_t v10 = v9;
  while ([v9 count])
  {
    id v11 = [v10 firstObject];
    [v10 removeObjectAtIndex:0];
    uint64_t v12 = [v11 children];
    if ([v12 count])
    {
      uint64_t v13 = [v12 allObjects];
      [v10 addObjectsFromArray:v13];

      if (!a4) {
        goto LABEL_6;
      }
LABEL_5:
      v14 = [v11 name];
      [v6 addObject:v14];

      goto LABEL_6;
    }
    if (v5) {
      goto LABEL_5;
    }
LABEL_6:

    id v9 = v10;
  }

  return v6;
}

+ (id)buildGraphStatisticsDescription
{
  id v10 = [MEMORY[0x1E4F28E78] string];
  id v3 = [getPFSceneTaxonomyClass() sharedTaxonomy];
  id v4 = [v3 rootNode];
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  BOOL v5 = [MEMORY[0x1E4F1CA80] set];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__AXMPhotoVisionSupport_buildGraphStatisticsDescription__block_invoke;
  v11[3] = &unk_1E6117C28;
  uint64_t v13 = &v14;
  id v6 = v5;
  id v12 = v6;
  [v4 traverse:1 visitor:v11];
  id v7 = [a1 leafNodeLabels];
  id v8 = [a1 nonLeafNodeLabels];
  objc_msgSend(v10, "appendFormat:", @"Total nodes in graph via PV traverse API: %ld\nTotal nodes in graph via PV traverse API (removing visit duplicates): %ld\nLeaf nodes in graph via AX API: %ld\nNon-leaf nodes in graph via AX API: %ld\nTotal nodes in graph via AX API: %ld", v15[3], objc_msgSend(v6, "count"), objc_msgSend(v7, "count"), objc_msgSend(v8, "count"), objc_msgSend(v8, "count") + objc_msgSend(v7, "count"));

  _Block_object_dispose(&v14, 8);

  return v10;
}

uint64_t __56__AXMPhotoVisionSupport_buildGraphStatisticsDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  return 0;
}

+ (id)leafNodeLabels
{
  return (id)[a1 _collectLabelsIncludingLeafNodes:1 nonLeafNodes:0];
}

+ (id)nonLeafNodeLabels
{
  return (id)[a1 _collectLabelsIncludingLeafNodes:0 nonLeafNodes:1];
}

+ (id)axmTaxonomyNodeForSceneTaxonomyNode:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(AXMTaxonomyNode);
  [v3 searchThreshold];
  -[AXMTaxonomyNode setConfidence:](v4, "setConfidence:");
  BOOL v5 = [v3 name];
  [(AXMTaxonomyNode *)v4 setLabel:v5];

  id v6 = [v3 localizedLabel];
  [(AXMTaxonomyNode *)v4 setLocalizedName:v6];

  -[AXMTaxonomyNode setSceneClassId:](v4, "setSceneClassId:", [v3 sceneClassId]);
  id v7 = [MEMORY[0x1E4F1CA80] set];
  id v8 = [v3 detectors];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__AXMPhotoVisionSupport_axmTaxonomyNodeForSceneTaxonomyNode___block_invoke;
  v11[3] = &unk_1E6117B10;
  id v12 = v7;
  id v9 = v7;
  [v8 enumerateObjectsUsingBlock:v11];

  [(AXMTaxonomyNode *)v4 setDetectorSceneClassIds:v9];

  return v4;
}

void __61__AXMPhotoVisionSupport_axmTaxonomyNodeForSceneTaxonomyNode___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a2, "sceneClassId"));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v4 stringValue];
  [v2 addObject:v3];
}

void __61__AXMPhotoVisionSupport__validatePhotosFormatSoftLinkSymbols__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B57D5000, log, OS_LOG_TYPE_ERROR, "Cannot process scenes. Soft link PhotosFormat framework didn't work", v1, 2u);
}

@end