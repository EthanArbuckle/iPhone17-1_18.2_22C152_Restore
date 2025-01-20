@interface LTDisambiguableSentence
@end

@implementation LTDisambiguableSentence

BOOL __46___LTDisambiguableSentence_hasDisambiguations__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 links];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

uint64_t __53___LTDisambiguableSentence_hasDisambiguationsOfType___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 links];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53___LTDisambiguableSentence_hasDisambiguationsOfType___block_invoke_2;
  v6[3] = &__block_descriptor_40_e44_B16__0___LTDisambiguationLinkConfiguration_8l;
  v6[4] = *(void *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "lt_hasObjectPassingTest:", v6);

  return v4;
}

uint64_t __53___LTDisambiguableSentence_hasDisambiguationsOfType___block_invoke_2(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 edgeTypes];
  uint64_t v4 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 32)];
  uint64_t v5 = [v3 containsObject:v4];

  return v5;
}

void __59___LTDisambiguableSentence_menuConfigurationsForLinkIndex___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if ([v5 count] == 1) {
      [v5 firstObject];
    }
    else {
    v7 = objc_msgSend(WeakRetained, "_preferredEdgeFromEdgesWithDuplicateMeaning:forLinkIndex:inPhrase:", v5, *(void *)(a1 + 48), objc_msgSend(WeakRetained, "selectedPhraseIndex"));
    }
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v8];
  }
}

id __59___LTDisambiguableSentence_menuConfigurationsForLinkIndex___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 menuDescription];
  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
  if (v5 == v3) {
    v6 = v3;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  return v7;
}

BOOL __74___LTDisambiguableSentence_meaningDescriptionForLinkIndex_inTargetPhrase___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 targetPhraseIndex] == *(void *)(a1 + 32) && objc_msgSend(v3, "type") == 0;

  return v4;
}

double __44___LTDisambiguableSentence__restoreChanges___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = [*(id *)(a1 + 32) sourceTextSnippetForLinkIndex:a3];
  v9 = [*(id *)(a1 + 40) objectForKeyedSubscript:v8];
  v10 = v9;
  if (v9)
  {
    v11 = [v9 genderNumber];

    uint64_t v12 = [v7 gender];
    v13 = (void *)v12;
    if (v11)
    {
      if (v12
        && ([v7 gender],
            v14 = objc_claimAutoreleasedReturnValue(),
            [v10 genderNumber],
            v15 = objc_claimAutoreleasedReturnValue(),
            v15,
            v14,
            v13,
            v14 == v15))
      {
        LODWORD(v13) = 1;
        double v16 = 1.0;
      }
      else
      {
        [v7 gender];

        LODWORD(v13) = 0;
        double v16 = 0.0;
      }
    }
    else
    {
      double v16 = 0.0;
      if (v12)
      {
        uint64_t v17 = [v7 defaultGender];
        if (v17)
        {
          v18 = (void *)v17;
          v19 = [v7 gender];
          v20 = [v7 defaultGender];
          BOOL v21 = v19 == v20;

          LODWORD(v13) = 0;
          if (v21) {
            double v16 = 0.25;
          }
          else {
            double v16 = 0.0;
          }
        }
        else
        {

          LODWORD(v13) = 0;
        }
      }
    }
    v22 = [*(id *)(a1 + 32) meaningDescriptionForLinkIndex:a3 inTargetPhrase:a4];
    v23 = [v10 meaningDescription];
    int v24 = [v22 isEqualToString:v23];
    double v25 = v16 + 1.0;
    if (v24) {
      double v26 = v16 + 1.0;
    }
    else {
      double v26 = v16;
    }
    double v27 = v26 + 0.5;
    if (v13) {
      double v25 = v27;
    }
    if (v24) {
      double v16 = v25;
    }
  }
  else
  {
    double v16 = 0.0;
  }

  return v16;
}

void __44___LTDisambiguableSentence__restoreChanges___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v12 = 0;
  v13 = (double *)&v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  v6 = [v5 links];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44___LTDisambiguableSentence__restoreChanges___block_invoke_3;
  v8[3] = &unk_2651DB848;
  v10 = &v12;
  id v9 = *(id *)(a1 + 40);
  uint64_t v11 = a3;
  [v6 enumerateObjectsUsingBlock:v8];

  id v7 = [NSNumber numberWithDouble:v13[3]];
  [*(id *)(a1 + 32) setObject:v7 atIndexedSubscript:a3];

  _Block_object_dispose(&v12, 8);
}

double __44___LTDisambiguableSentence__restoreChanges___block_invoke_3(uint64_t a1)
{
  double v2 = (*(double (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  double result = v2 + *(double *)(v3 + 24);
  *(double *)(v3 + 24) = result;
  return result;
}

uint64_t __44___LTDisambiguableSentence__restoreChanges___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = [a2 doubleValue];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v6 > *(double *)(v7 + 24))
  {
    *(double *)(v7 + 24) = v6;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  }
  return result;
}

void __60___LTDisambiguableSentence__userSelectionFromIndex_toIndex___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = [a2 adjacencyList];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60___LTDisambiguableSentence__userSelectionFromIndex_toIndex___block_invoke_2;
  v9[3] = &__block_descriptor_40_e25_B16__0___LTDirectedEdge_8l;
  v9[4] = a1[6];
  id v8 = objc_msgSend(v7, "lt_firstObjectPassingTest:", v9);

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), v8);
    *(void *)(*(void *)(a1[5] + 8) + 24) = a3;
    *a4 = 1;
  }
}

BOOL __60___LTDisambiguableSentence__userSelectionFromIndex_toIndex___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 targetPhraseIndex] == *(void *)(a1 + 32);
}

BOOL __96___LTDisambiguableSentence__preferredGenderFromEdgesWithDuplicateMeaning_forLinkIndex_inPhrase___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  return v2 == [a2 targetPhraseIndex];
}

BOOL __94___LTDisambiguableSentence__preferredEdgeFromEdgesWithDuplicateMeaning_forLinkIndex_inPhrase___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 targetGender];
  BOOL v4 = v3;
  if (v3) {
    BOOL v5 = [v3 unsignedIntegerValue] == *(void *)(a1 + 32);
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

void __121___LTDisambiguableSentence__generateAttributedStringForLocation_result_excludedTypes_globalAttributes_attributeProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = *(void **)(a1 + 32);
  id v13 = v3;
  BOOL v5 = [v3 edgeTypes];
  LODWORD(v4) = [v4 intersectsSet:v5];

  if (v4)
  {
    if (*(void *)(a1 + 80)) {
      uint64_t v6 = [v13 targetRange];
    }
    else {
      uint64_t v6 = [v13 sourceRange];
    }
    uint64_t v8 = v6;
    uint64_t v9 = v7;
    v10 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v11 = *(void *)(a1 + 72);
    if (v11)
    {
      uint64_t v12 = (*(void (**)(uint64_t, void, void, void, id, void))(v11 + 16))(v11, *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), v13, *(void *)(a1 + 80));
      [v10 addEntriesFromDictionary:v12];
    }
    objc_msgSend(*(id *)(a1 + 64), "addAttributes:range:", v10, v8, v9);
  }
}

void __53___LTDisambiguableSentence__validateAndPopulateEdges__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v33 = a2;
  v37 = [MEMORY[0x263EFF980] array];
  v36 = [MEMORY[0x263EFF980] array];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = [v33 links];
  uint64_t v41 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v41)
  {
    uint64_t v40 = *(void *)v45;
    *(void *)&long long v4 = 134217984;
    long long v32 = v4;
    while (2)
    {
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v45 != v40) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        uint64_t v7 = objc_msgSend(v6, "unvalidatedAdjacencyList", v32);
        uint64_t v8 = [v6 adjacencyList];
        if (![v7 count] && objc_msgSend(v8, "count"))
        {
          v31 = _LTOSLogDisambiguation();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
            __53___LTDisambiguableSentence__validateAndPopulateEdges__block_invoke_cold_2(v31);
          }

LABEL_24:
          goto LABEL_25;
        }
        v42[0] = MEMORY[0x263EF8330];
        v42[1] = 3221225472;
        v42[2] = __53___LTDisambiguableSentence__validateAndPopulateEdges__block_invoke_35;
        v42[3] = &unk_2651DB910;
        objc_copyWeak(&v43, (id *)(a1 + 48));
        uint64_t v9 = [v7 _ltCompactMap:v42];
        uint64_t v10 = [v9 count];
        uint64_t v11 = [v7 count];
        if (v10 == v11)
        {
          uint64_t v12 = (void *)MEMORY[0x263F08D40];
          uint64_t v13 = [v6 sourceRange];
          uint64_t v15 = objc_msgSend(v12, "valueWithRange:", v13, v14);
          [v37 addObject:v15];

          double v16 = (void *)MEMORY[0x263F08D40];
          uint64_t v17 = [v6 targetRange];
          v19 = objc_msgSend(v16, "valueWithRange:", v17, v18);
          [v36 addObject:v19];

          v20 = [v6 _unvalidatedEdgeFromAdjacencyListMatchingTargetNodeIndex:a3];
          BOOL v21 = [v20 targetGender];
          v22 = [v20 defaultGender];
          [v6 _validateWithAdjacencyList:v9 gender:v21 defaultGender:v22];
        }
        else
        {
          v23 = _LTOSLogDisambiguation();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v32;
            uint64_t v49 = a3;
            _os_log_error_impl(&dword_24639B000, v23, OS_LOG_TYPE_ERROR, "Failed to validate sentence; node %zu has some invalid edges",
              buf,
              0xCu);
          }
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
          *a4 = 1;
        }

        objc_destroyWeak(&v43);
        if (v10 != v11) {
          goto LABEL_24;
        }
      }
      uint64_t v41 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
      if (v41) {
        continue;
      }
      break;
    }
  }

  if (([*(id *)(a1 + 32) _hasOverlapInRangeArray:v37] & 1) != 0
    || [*(id *)(a1 + 32) _hasOverlapInRangeArray:v36])
  {
    int v24 = _LTOSLogDisambiguation();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      __53___LTDisambiguableSentence__validateAndPopulateEdges__block_invoke_cold_1(a3, v24, v25, v26, v27, v28, v29, v30);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
LABEL_25:
}

id __53___LTDisambiguableSentence__validateAndPopulateEdges__block_invoke_35(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = [WeakRetained _directedEdgeFromUnvalidatedEdge:v3];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t __52___LTDisambiguableSentence__hasOverlapInRangeArray___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 rangeValue];
  uint64_t v6 = [v4 rangeValue];

  uint64_t v7 = [NSNumber numberWithUnsignedInteger:v5];
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:v6];
  uint64_t v9 = [v7 compare:v8];

  return v9;
}

void __53___LTDisambiguableSentence__validateAndPopulateEdges__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    0);
}

void __53___LTDisambiguableSentence__validateAndPopulateEdges__block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_24639B000, log, OS_LOG_TYPE_DEBUG, "Skipping validation of link because it appears to already be validated", v1, 2u);
}

@end