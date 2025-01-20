@interface CLSClassificationInformant
+ (id)classIdentifier;
+ (id)familyIdentifier;
+ (id)informantDependenciesIdentifiers;
- (double)_confidenceForCount:(unint64_t)a3 mu:(double)a4 sigma:(double)a5;
- (id)_gatherSceneCluesForInvestigation:(id)a3 signalModelProviderBlock:(id)a4 informantKey:(id)a5 progressBlock:(id)a6;
- (id)gatherCluesForInvestigation:(id)a3 progressBlock:(id)a4;
@end

@implementation CLSClassificationInformant

+ (id)informantDependenciesIdentifiers
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)classIdentifier
{
  return @"classification";
}

+ (id)familyIdentifier
{
  v2 = @"com.apple.mediaminingkit.informant.content";
  return @"com.apple.mediaminingkit.informant.content";
}

- (id)gatherCluesForInvestigation:(id)a3 progressBlock:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v9 = (void *)MEMORY[0x1D2602540](v7);
  id v10 = v8;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __72__CLSClassificationInformant_gatherCluesForInvestigation_progressBlock___block_invoke_2;
  v22[3] = &unk_1E6910648;
  id v11 = v9;
  id v23 = v11;
  v24 = &v25;
  v12 = [(CLSClassificationInformant *)self _gatherSceneCluesForInvestigation:v6 signalModelProviderBlock:&__block_literal_global_7862 informantKey:@"kCLSClassificationInformantKey" progressBlock:v22];
  [v10 addObjectsFromArray:v12];
  if (*((unsigned char *)v26 + 24))
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 67109120;
    int v30 = 243;
    v13 = MEMORY[0x1E4F14500];
    goto LABEL_10;
  }
  if ((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl())
  {
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __72__CLSClassificationInformant_gatherCluesForInvestigation_progressBlock___block_invoke_2_54;
    v19 = &unk_1E6910648;
    id v20 = v11;
    v21 = &v25;
    v14 = [(CLSClassificationInformant *)self _gatherSceneCluesForInvestigation:v6 signalModelProviderBlock:&__block_literal_global_53 informantKey:@"kCLSClassificationEntityNetInformantKey" progressBlock:&v16];
    objc_msgSend(v10, "addObjectsFromArray:", v14, v16, v17, v18, v19);
  }
  if (*((unsigned char *)v26 + 24) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v30 = 255;
    v13 = MEMORY[0x1E4F14500];
LABEL_10:
    _os_log_impl(&dword_1D2150000, v13, OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
  }
LABEL_11:

  _Block_object_dispose(&v25, 8);
  return v10;
}

uint64_t __72__CLSClassificationInformant_gatherCluesForInvestigation_progressBlock___block_invoke_2(uint64_t a1, unsigned char *a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    char v5 = 0;
    uint64_t result = (*(uint64_t (**)(uint64_t, char *, double))(result + 16))(result, &v5, 0.2);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= v5;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      *a2 = 1;
    }
  }
  return result;
}

uint64_t __72__CLSClassificationInformant_gatherCluesForInvestigation_progressBlock___block_invoke_2_54(uint64_t a1, unsigned char *a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    char v5 = 0;
    uint64_t result = (*(uint64_t (**)(uint64_t, char *, double))(result + 16))(result, &v5, 0.4);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= v5;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      *a2 = 1;
    }
  }
  return result;
}

id __72__CLSClassificationInformant_gatherCluesForInvestigation_progressBlock___block_invoke_50(uint64_t a1, void *a2)
{
  v2 = [a2 curationModel];
  v3 = [v2 entityNetModel];

  return v3;
}

id __72__CLSClassificationInformant_gatherCluesForInvestigation_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 curationModel];
  v3 = [v2 sceneModel];

  return v3;
}

- (id)_gatherSceneCluesForInvestigation:(id)a3 signalModelProviderBlock:(id)a4 informantKey:(id)a5 progressBlock:(id)a6
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v58 = a5;
  id v11 = a6;
  uint64_t v12 = MEMORY[0x1D2602540]();
  uint64_t v92 = 0;
  v93 = &v92;
  uint64_t v94 = 0x2020000000;
  char v95 = 0;
  v13 = [MEMORY[0x1E4F28BD0] set];
  v14 = [MEMORY[0x1E4F28BD0] set];
  uint64_t v15 = [MEMORY[0x1E4F28BD0] set];
  v54 = v11;
  uint64_t v16 = [MEMORY[0x1E4F28BD0] set];
  uint64_t v17 = [MEMORY[0x1E4F28BD0] set];
  unint64_t v65 = [v9 numberOfItems];
  v67 = (void *)v16;
  id obja = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v18 = (void *)v15;
  v71 = (void *)v12;
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v20 = [v9 helper];
  v21 = [v9 feeder];
  v79[0] = MEMORY[0x1E4F143A8];
  v79[1] = 3221225472;
  v79[2] = __116__CLSClassificationInformant__gatherSceneCluesForInvestigation_signalModelProviderBlock_informantKey_progressBlock___block_invoke;
  v79[3] = &unk_1E69105D8;
  id v53 = v10;
  id v89 = v53;
  id v55 = v20;
  id v80 = v55;
  id v60 = v17;
  id v81 = v60;
  id v56 = v14;
  id v82 = v56;
  id v59 = v19;
  id v83 = v59;
  id v62 = v18;
  id v84 = v62;
  id v61 = v67;
  id v85 = v61;
  id v52 = v9;
  id v86 = v52;
  id v63 = obja;
  id v87 = v63;
  id v68 = v13;
  id v88 = v68;
  id v72 = v71;
  id v90 = v72;
  v91 = &v92;
  [v21 enumerateItemsUsingBlock:v79];

  if (*((unsigned char *)v93 + 24))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      int buf = 67109120;
      int v100 = 186;
      _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)&buf, 8u);
    }
    id v22 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    uint64_t v23 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v52, v53);
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id obj = v56;
    uint64_t v24 = [obj countByEnumeratingWithState:&v75 objects:v98 count:16];
    v57 = (void *)v23;
    if (v24)
    {
      double v25 = (double)v65 * 0.5;
      double v26 = -(v25 - (double)v65 * 0.68);
      uint64_t v64 = *(void *)v76;
      while (2)
      {
        uint64_t v27 = 0;
        uint64_t v66 = v24;
        do
        {
          if (*(void *)v76 != v64) {
            objc_enumerationMutation(obj);
          }
          uint64_t v28 = *(void *)(*((void *)&v75 + 1) + 8 * v27);
          uint64_t v29 = [obj countForObject:v28];
          [(CLSClassificationInformant *)self _confidenceForCount:v29 mu:v25 sigma:v26];
          double v31 = v30;
          -[CLSClassificationInformant _confidenceForCount:mu:sigma:](self, "_confidenceForCount:mu:sigma:", [v68 countForObject:v28], v25, v26);
          double v33 = v32;
          if (v32 >= 0.3)
          {
            v34 = [v63 objectForKeyedSubscript:v28];
            [v34 weight];
            double v36 = v35;
            uint64_t v37 = [v62 countForObject:v28];
            uint64_t v38 = [v61 countForObject:v28];
            uint64_t v39 = [v60 countForObject:v28];
            unint64_t v40 = [v34 level];
            v41 = [v59 objectForKeyedSubscript:v28];
            v42 = +[CLSOutputClue clueWithValue:v41 forKey:v58 confidence:v33 * v36 relevance:(double)v40];
            v96[0] = @"numberOfAssetsd";
            v43 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v29];
            v97[0] = v43;
            v96[1] = @"isReliable";
            v44 = [MEMORY[0x1E4F28ED0] numberWithBool:v31 >= 0.3];
            v97[1] = v44;
            v96[2] = @"numberOfHighConfidenceAssets";
            v45 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v37];
            v97[2] = v45;
            v96[3] = @"numberOfSearchConfidenceAssets";
            v46 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v38];
            v97[3] = v46;
            v96[4] = @"numberOfDominantSceneAssets";
            v47 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v39];
            v97[4] = v47;
            v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v97 forKeys:v96 count:5];
            [v42 setExtraParameters:v48];

            [v57 addObject:v42];
          }
          if (v72)
          {
            char v74 = 0;
            (*((void (**)(id, char *, double))v72 + 2))(v72, &v74, 0.7);
            char v49 = *((unsigned char *)v93 + 24) | v74;
            *((unsigned char *)v93 + 24) = v49;
            if (v49)
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
              {
                int buf = 67109120;
                int v100 = 224;
                _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)&buf, 8u);
              }

              id v22 = (id)MEMORY[0x1E4F1CBF0];
              v50 = v57;
              goto LABEL_20;
            }
          }
          ++v27;
        }
        while (v66 != v27);
        uint64_t v24 = [obj countByEnumeratingWithState:&v75 objects:v98 count:16];
        if (v24) {
          continue;
        }
        break;
      }
    }

    v50 = v57;
    id v22 = v57;
LABEL_20:
  }
  _Block_object_dispose(&v92, 8);

  return v22;
}

void __116__CLSClassificationInformant__gatherSceneCluesForInvestigation_signalModelProviderBlock_informantKey_progressBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  context = (void *)MEMORY[0x1D2602300]();
  id v6 = (*(void (**)(void))(*(void *)(a1 + 104) + 16))();
  id v7 = [MEMORY[0x1E4F1CA80] set];
  v51 = v5;
  id v8 = [v5 clsSceneClassifications];
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v70 objects:v76 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v71;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v71 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v70 + 1) + 8 * i);
        [v13 confidence];
        double v15 = v14;
        uint64_t v16 = [v13 extendedSceneIdentifier];
        [v13 boundingBox];
        double v18 = v17;
        double v20 = v19;
        v21 = [*(id *)(a1 + 32) taxonomyNodeForSceneIdentifier:v16 sceneModel:v6];
        id v22 = v21;
        if (v21)
        {
          [v21 searchThreshold];
          if (v15 >= v23 && v18 > 0.0 && v20 > 0.0)
          {
            uint64_t v24 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v16];
            [*(id *)(a1 + 40) addObject:v24];
            [v7 addObject:v24];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v70 objects:v76 count:16];
    }
    while (v10);
  }
  long long v68 = 0u;
  long long v69 = 0u;
  long long v67 = 0u;
  long long v66 = 0u;
  id v25 = v8;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v66 objects:v75 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v67;
    id v53 = v25;
    v54 = v6;
    uint64_t v52 = *(void *)v67;
    while (2)
    {
      uint64_t v29 = 0;
      uint64_t v55 = v27;
      do
      {
        if (*(void *)v67 != v28) {
          objc_enumerationMutation(v25);
        }
        double v30 = *(void **)(*((void *)&v66 + 1) + 8 * v29);
        [v30 confidence];
        double v32 = v31;
        uint64_t v33 = [v30 extendedSceneIdentifier];
        v34 = [*(id *)(a1 + 32) taxonomyNodeForSceneIdentifier:v33 sceneModel:v6];
        if (v34)
        {
          id v57 = v34;
          [v34 graphHighRecallThreshold];
          v34 = v57;
          if (v32 >= v35)
          {
            double v36 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v33];
            [*(id *)(a1 + 48) addObject:v36];
            id v56 = [*(id *)(a1 + 56) objectForKeyedSubscript:v36];
            if (!v56)
            {
              uint64_t v37 = [v57 name];
              [*(id *)(a1 + 56) setObject:v37 forKeyedSubscript:v36];
            }
            [v57 graphHighPrecisionThreshold];
            if (v32 >= v38) {
              [*(id *)(a1 + 64) addObject:v36];
            }
            [v57 searchThreshold];
            if (v32 >= v39)
            {
              [*(id *)(a1 + 72) addObject:v36];
              if ([v7 count])
              {
                long long v64 = 0u;
                long long v65 = 0u;
                long long v62 = 0u;
                long long v63 = 0u;
                unint64_t v40 = [*(id *)(a1 + 80) helper];
                v41 = [v40 parentNodesOfTaxonomyNode:v57];

                uint64_t v42 = [v41 countByEnumeratingWithState:&v62 objects:v74 count:16];
                if (v42)
                {
                  uint64_t v43 = v42;
                  uint64_t v44 = *(void *)v63;
                  do
                  {
                    for (uint64_t j = 0; j != v43; ++j)
                    {
                      if (*(void *)v63 != v44) {
                        objc_enumerationMutation(v41);
                      }
                      v46 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(*((void *)&v62 + 1) + 8 * j), "extendedSceneClassId"));
                      if ([v7 containsObject:v46]
                        && ([v7 containsObject:v36] & 1) == 0)
                      {
                        [*(id *)(a1 + 40) addObject:v36];
                      }
                    }
                    uint64_t v43 = [v41 countByEnumeratingWithState:&v62 objects:v74 count:16];
                  }
                  while (v43);
                }

                id v25 = v53;
                id v6 = v54;
                uint64_t v28 = v52;
              }
            }
            v47 = *(void **)(a1 + 32);
            v59[0] = MEMORY[0x1E4F143A8];
            v59[1] = 3221225472;
            v59[2] = __116__CLSClassificationInformant__gatherSceneCluesForInvestigation_signalModelProviderBlock_informantKey_progressBlock___block_invoke_2;
            v59[3] = &unk_1E69105B0;
            id v60 = *(id *)(a1 + 88);
            id v61 = *(id *)(a1 + 96);
            [v47 enumerateTaxonomyNodesLevelsAndWeightsStartingWithNode:v57 usingBlock:v59];
            uint64_t v48 = *(void *)(a1 + 112);
            if (v48)
            {
              char v58 = 0;
              (*(void (**)(uint64_t, char *, double))(v48 + 16))(v48, &v58, 0.5);
              *(unsigned char *)(*(void *)(*(void *)(a1 + 120) + 8) + 24) |= v58;
              if (*(unsigned char *)(*(void *)(*(void *)(a1 + 120) + 8) + 24))
              {
                *a4 = 1;

                goto LABEL_44;
              }
            }

            uint64_t v27 = v55;
            v34 = v57;
          }
        }

        ++v29;
      }
      while (v29 != v27);
      uint64_t v27 = [v25 countByEnumeratingWithState:&v66 objects:v75 count:16];
      if (v27) {
        continue;
      }
      break;
    }
  }
LABEL_44:
}

void __116__CLSClassificationInformant__gatherSceneCluesForInvestigation_signalModelProviderBlock_informantKey_progressBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)MEMORY[0x1E4F28ED0];
  id v10 = v3;
  id v5 = [v3 taxonomyNode];
  id v6 = objc_msgSend(v4, "numberWithUnsignedLongLong:", objc_msgSend(v5, "extendedSceneClassId"));

  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
  id v8 = v7;
  if (!v7 || (unint64_t v9 = [v7 level], v9 > objc_msgSend(v10, "level"))) {
    [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:v6];
  }
  [*(id *)(a1 + 40) addObject:v6];
}

- (double)_confidenceForCount:(unint64_t)a3 mu:(double)a4 sigma:(double)a5
{
  double v5 = (double)a3;
  if (a4 != 0.0 && v5 < a4) {
    return exp(-((v5 - a4) * (v5 - a4)) / (a5 * a5 + a5 * a5));
  }
  else {
    return 1.0;
  }
}

@end