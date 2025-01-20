@interface IRRuleCandidate
- (BOOL)_isCandidateIdentifier:(id)a3 inHistory:(id)a4;
- (BOOL)_isLastEventForCandidate:(id)a3 inPrerequisite:(id)a4 isOneOf:(id)a5;
- (BOOL)_proximityBLEValueForCandidate:(id)a3 withNearbyDeviceContainer:(id)a4 date:(id)a5;
- (BOOL)_proximityDecisionForCandidate:(id)a3 withNearbyDeviceContainer:(id)a4 date:(id)a5;
- (BOOL)requireAllNodes;
- (IRRuleCandidate)initWithAttributeKey:(id)a3 requireAllNodes:(BOOL)a4;
- (NSString)attributeKey;
- (id)_activeRouteForCandidate:(id)a3 systemState:(id)a4;
- (id)_appleTVControlUserRejectedInLastDayWithoutPickerChoiceForCandidate:(id)a3 prerequisite:(id)a4;
- (id)_attributeValueForAttributeKey:(id)a3 prerequisite:(id)a4 withCandidate:(id)a5 nearbyDeviceContainer:(id)a6 systemState:(id)a7 date:(id)a8;
- (id)_matchedDevicefromNode:(id)a3 withNearbyDeviceContainer:(id)a4 measurementExpiry:(id)a5 isUwb:(BOOL)a6;
- (id)_mediaUserRejectedInLastDayWithoutPickerChoiceForCandidate:(id)a3 prerequisite:(id)a4;
- (id)_prerequisiteValueForAttributeKey:(id)a3 withCandidatesContainer:(id)a4 nearbyDeviceContainer:(id)a5 systemState:(id)a6 historyContainer:(id)a7 date:(id)a8;
- (id)_proximityLowestUwbRangeForCandidate:(id)a3 withNearbyDeviceContainer:(id)a4 date:(id)a5;
- (id)_proximityPrerequisiteValueForCandidatesContainer:(id)a3 withNearbyDeviceContainer:(id)a4 date:(id)a5;
- (id)_proximityShortestRangeInHistoryOrSameICloudValueForCandidate:(id)a3 withNearbyDeviceContainer:(id)a4 prerequisite:(id)a5 date:(id)a6;
- (id)_proximityShortestRangeValueForCandidate:(id)a3 withNearbyDeviceContainer:(id)a4 prerequisite:(id)a5 date:(id)a6;
- (id)_proximityValueForCandidate:(id)a3 withNearbyDeviceContainer:(id)a4 prerequisite:(id)a5 date:(id)a6;
- (id)_sameIcloudForCandidate:(id)a3 systemState:(id)a4;
- (id)_sameWiFiForCandidate:(id)a3 systemState:(id)a4;
- (id)_shortestRangeProximityPrerequisiteValueForCandidatesContainer:(id)a3 withNearbyDeviceContainer:(id)a4 date:(id)a5;
- (id)_shortestRangeWithHistoryOrSameICloudProximityPrerequisiteValueForCandidatesContainer:(id)a3 withNearbyDeviceContainer:(id)a4 historyContainer:(id)a5 systemState:(id)a6 date:(id)a7;
- (id)_userRejectedInLastDayWithoutPickerChoicePrerequisiteValueForHistoryContainer:(id)a3 systemState:(id)a4 date:(id)a5;
- (id)_valueFromValues:(id)a3;
- (id)executeRuleWithCandiatesContainer:(id)a3 systemStatus:(id)a4 historyContainer:(id)a5 miloPrediction:(id)a6 nearbyDeviceContainer:(id)a7 date:(id)a8;
- (void)setAttributeKey:(id)a3;
- (void)setRequireAllNodes:(BOOL)a3;
@end

@implementation IRRuleCandidate

- (IRRuleCandidate)initWithAttributeKey:(id)a3 requireAllNodes:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IRRuleCandidate;
  v7 = [(IRRuleCandidate *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(IRRuleCandidate *)v7 setAttributeKey:v6];
    [(IRRuleCandidate *)v8 setRequireAllNodes:v4];
  }

  return v8;
}

- (id)executeRuleWithCandiatesContainer:(id)a3 systemStatus:(id)a4 historyContainer:(id)a5 miloPrediction:(id)a6 nearbyDeviceContainer:(id)a7 date:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v31 = a6;
  id v17 = a7;
  id v18 = a8;
  v19 = objc_opt_new();
  v20 = [(IRRuleCandidate *)self attributeKey];
  v21 = [(IRRuleCandidate *)self _prerequisiteValueForAttributeKey:v20 withCandidatesContainer:v14 nearbyDeviceContainer:v17 systemState:v15 historyContainer:v16 date:v18];

  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2020000000;
  char v42 = 0;
  v22 = [v14 candidates];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __125__IRRuleCandidate_executeRuleWithCandiatesContainer_systemStatus_historyContainer_miloPrediction_nearbyDeviceContainer_date___block_invoke;
  v32[3] = &unk_26539FE10;
  v32[4] = self;
  id v23 = v21;
  id v33 = v23;
  id v24 = v17;
  id v34 = v24;
  id v25 = v15;
  id v35 = v25;
  id v26 = v18;
  id v36 = v26;
  v38 = &v39;
  id v27 = v19;
  id v37 = v27;
  [v22 enumerateObjectsUsingBlock:v32];

  v28 = [[IRRuleOutputCandidate alloc] initWithRule:self];
  v29 = (void *)[v27 copy];
  [(IRRuleOutputCandidate *)v28 setValues:v29];

  [(IRRuleOutputCandidate *)v28 setIsAnyCandidateEvaluatedToYes:*((unsigned __int8 *)v40 + 24)];
  _Block_object_dispose(&v39, 8);

  return v28;
}

void __125__IRRuleCandidate_executeRuleWithCandiatesContainer_systemStatus_historyContainer_miloPrediction_nearbyDeviceContainer_date___block_invoke(void *a1, void *a2)
{
  id v8 = a2;
  v3 = (void *)a1[4];
  BOOL v4 = [v3 attributeKey];
  v5 = [v3 _attributeValueForAttributeKey:v4 prerequisite:a1[5] withCandidate:v8 nearbyDeviceContainer:a1[6] systemState:a1[7] date:a1[8]];

  if ([v5 hasBoolean] && objc_msgSend(v5, "BOOLean")) {
    *(unsigned char *)(*(void *)(a1[10] + 8) + 24) = 1;
  }
  id v6 = (void *)a1[9];
  v7 = [v8 candidateIdentifier];
  [v6 setObject:v5 forKeyedSubscript:v7];
}

- (id)_proximityValueForCandidate:(id)a3 withNearbyDeviceContainer:(id)a4 prerequisite:(id)a5 date:(id)a6
{
  id v7 = a5;
  id v8 = a3;
  v9 = objc_opt_new();
  objc_super v10 = [v7 proximityPerCandiate];
  v11 = [v8 candidateIdentifier];

  v12 = [v10 objectForKeyedSubscript:v11];
  objc_msgSend(v9, "setBoolean:", objc_msgSend(v12, "BOOLValue"));

  objc_msgSend(v9, "setHasBoolean:", objc_msgSend(v7, "anyCandidateInProximity"));

  return v9;
}

- (id)_proximityShortestRangeValueForCandidate:(id)a3 withNearbyDeviceContainer:(id)a4 prerequisite:(id)a5 date:(id)a6
{
  id v7 = a5;
  id v8 = a3;
  v9 = objc_opt_new();
  objc_super v10 = [v8 candidateIdentifier];

  v11 = [v7 shortestRangeCandidateIdentifier];
  objc_msgSend(v9, "setBoolean:", objc_msgSend(v10, "isEqual:", v11));

  objc_msgSend(v9, "setHasBoolean:", objc_msgSend(v7, "anyCandidateMeetsCondition"));

  return v9;
}

- (id)_proximityShortestRangeInHistoryOrSameICloudValueForCandidate:(id)a3 withNearbyDeviceContainer:(id)a4 prerequisite:(id)a5 date:(id)a6
{
  id v7 = a5;
  id v8 = a3;
  v9 = objc_opt_new();
  objc_super v10 = [v8 candidateIdentifier];

  v11 = [v7 shortestRangeCandidateIdentifier];
  objc_msgSend(v9, "setBoolean:", objc_msgSend(v10, "isEqual:", v11));

  objc_msgSend(v9, "setHasBoolean:", objc_msgSend(v7, "anyCandidateMeetsCondition"));

  return v9;
}

- (BOOL)_proximityDecisionForCandidate:(id)a3 withNearbyDeviceContainer:(id)a4 date:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(IRRuleCandidate *)self _proximityLowestUwbRangeForCandidate:v8 withNearbyDeviceContainer:v9 date:v10];
  BOOL v15 = v11
     && (+[IRPreferences shared],
         v12 = objc_claimAutoreleasedReturnValue(),
         [v12 deviceRangeProximityThreshold],
         v13 = objc_claimAutoreleasedReturnValue(),
         char v14 = [v11 isLessThanOrEqualTo:v13],
         v13,
         v12,
         (v14 & 1) != 0)
     || [(IRRuleCandidate *)self _proximityBLEValueForCandidate:v8 withNearbyDeviceContainer:v9 date:v10];

  return v15;
}

- (id)_proximityPrerequisiteValueForCandidatesContainer:(id)a3 withNearbyDeviceContainer:(id)a4 date:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v23 = v8;
  id obj = [v8 candidates];
  uint64_t v12 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    char v14 = 0;
    uint64_t v15 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        BOOL v18 = [(IRRuleCandidate *)self _proximityDecisionForCandidate:v17 withNearbyDeviceContainer:v9 date:v10];
        v14 |= v18;
        v19 = [NSNumber numberWithBool:v18];
        v20 = [v17 candidateIdentifier];
        [v11 setObject:v19 forKeyedSubscript:v20];
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v13);
  }
  else
  {
    char v14 = 0;
  }

  v21 = objc_opt_new();
  [v21 setAnyCandidateInProximity:v14 & 1];
  [v21 setProximityPerCandiate:v11];

  return v21;
}

- (id)_shortestRangeProximityPrerequisiteValueForCandidatesContainer:(id)a3 withNearbyDeviceContainer:(id)a4 date:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x3032000000;
  uint64_t v39 = __Block_byref_object_copy__1;
  v40 = __Block_byref_object_dispose__1;
  id v41 = 0;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  id v33 = __Block_byref_object_copy__1;
  id v34 = __Block_byref_object_dispose__1;
  id v35 = 0;
  uint64_t v26 = 0;
  long long v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  v11 = [v8 candidates];
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  BOOL v18 = __113__IRRuleCandidate__shortestRangeProximityPrerequisiteValueForCandidatesContainer_withNearbyDeviceContainer_date___block_invoke;
  v19 = &unk_26539FE38;
  v20 = self;
  id v12 = v9;
  id v21 = v12;
  id v13 = v10;
  id v22 = v13;
  id v23 = &v26;
  id v24 = &v36;
  long long v25 = &v30;
  [v11 enumerateObjectsUsingBlock:&v16];

  char v14 = objc_opt_new();
  objc_msgSend(v14, "setShortestRange:", v37[5], v16, v17, v18, v19, v20);
  [v14 setShortestRangeCandidateIdentifier:v31[5]];
  [v14 setAnyCandidateMeetsCondition:*((unsigned __int8 *)v27 + 24)];

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);

  return v14;
}

void __113__IRRuleCandidate__shortestRangeProximityPrerequisiteValueForCandidatesContainer_withNearbyDeviceContainer_date___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "_proximityLowestUwbRangeForCandidate:withNearbyDeviceContainer:date:");
  if (v3)
  {
    BOOL v4 = +[IRPreferences shared];
    v5 = [v4 deviceRangeProximityThreshold];
    int v6 = [v3 isLessThanOrEqualTo:v5];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) |= v6;
    if (v6)
    {
      if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)
        || (objc_msgSend(v3, "isLessThan:") & 1) != 0
        || [v3 isEqual:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)]
        && ([v12 nodes],
            id v7 = objc_claimAutoreleasedReturnValue(),
            uint64_t v8 = [v7 count],
            v7,
            v8 == 1))
      {
        uint64_t v9 = [v12 candidateIdentifier];
        uint64_t v10 = *(void *)(*(void *)(a1 + 72) + 8);
        v11 = *(void **)(v10 + 40);
        *(void *)(v10 + 40) = v9;

        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v3);
      }
    }
  }
}

- (id)_shortestRangeWithHistoryOrSameICloudProximityPrerequisiteValueForCandidatesContainer:(id)a3 withNearbyDeviceContainer:(id)a4 historyContainer:(id)a5 systemState:(id)a6 date:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__1;
  v46 = __Block_byref_object_dispose__1;
  id v47 = 0;
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x3032000000;
  uint64_t v39 = __Block_byref_object_copy__1;
  v40 = __Block_byref_object_dispose__1;
  id v41 = 0;
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  uint64_t v17 = [v12 candidates];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __165__IRRuleCandidate__shortestRangeWithHistoryOrSameICloudProximityPrerequisiteValueForCandidatesContainer_withNearbyDeviceContainer_historyContainer_systemState_date___block_invoke;
  v24[3] = &unk_26539FE60;
  v24[4] = self;
  id v18 = v13;
  id v25 = v18;
  id v19 = v16;
  id v26 = v19;
  id v20 = v14;
  id v27 = v20;
  id v21 = v15;
  id v28 = v21;
  char v29 = &v32;
  uint64_t v30 = &v42;
  id v31 = &v36;
  [v17 enumerateObjectsUsingBlock:v24];

  id v22 = objc_opt_new();
  [v22 setShortestRange:v43[5]];
  [v22 setShortestRangeCandidateIdentifier:v37[5]];
  [v22 setAnyCandidateMeetsCondition:*((unsigned __int8 *)v33 + 24)];

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&v42, 8);

  return v22;
}

void __165__IRRuleCandidate__shortestRangeWithHistoryOrSameICloudProximityPrerequisiteValueForCandidatesContainer_withNearbyDeviceContainer_historyContainer_systemState_date___block_invoke(uint64_t a1, void *a2)
{
  id v15 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "_proximityLowestUwbRangeForCandidate:withNearbyDeviceContainer:date:");
  if (v3)
  {
    BOOL v4 = +[IRPreferences shared];
    v5 = [v4 deviceRangeProximityThreshold];
    if ([v3 isLessThanOrEqualTo:v5])
    {
      int v6 = *(void **)(a1 + 32);
      id v7 = [v15 candidateIdentifier];
      if ([v6 _isCandidateIdentifier:v7 inHistory:*(void *)(a1 + 56)])
      {
        int v8 = 1;
      }
      else
      {
        uint64_t v9 = [*(id *)(a1 + 32) _sameIcloudForCandidate:v15 systemState:*(void *)(a1 + 64)];
        int v8 = [v9 BOOLean];
      }
    }
    else
    {
      int v8 = 0;
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) |= v8;
    if (v8)
    {
      if (!*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)
        || (objc_msgSend(v3, "isLessThan:") & 1) != 0
        || [v3 isEqual:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)]
        && ([v15 nodes],
            uint64_t v10 = objc_claimAutoreleasedReturnValue(),
            uint64_t v11 = [v10 count],
            v10,
            v11 == 1))
      {
        uint64_t v12 = [v15 candidateIdentifier];
        uint64_t v13 = *(void *)(*(void *)(a1 + 88) + 8);
        id v14 = *(void **)(v13 + 40);
        *(void *)(v13 + 40) = v12;

        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), v3);
      }
    }
  }
}

- (id)_userRejectedInLastDayWithoutPickerChoicePrerequisiteValueForHistoryContainer:(id)a3 systemState:(id)a4 date:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = (void *)MEMORY[0x263EFF980];
  id v10 = a3;
  uint64_t v11 = [v9 array];
  uint64_t v12 = [v10 historyEvents];

  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __114__IRRuleCandidate__userRejectedInLastDayWithoutPickerChoicePrerequisiteValueForHistoryContainer_systemState_date___block_invoke;
  v20[3] = &unk_26539FE88;
  id v21 = v8;
  id v22 = v7;
  id v23 = v11;
  id v13 = v11;
  id v14 = v7;
  id v15 = v8;
  [v12 enumerateObjectsWithOptions:2 usingBlock:v20];

  id v16 = objc_opt_new();
  uint64_t v17 = [v13 reverseObjectEnumerator];
  id v18 = [v17 allObjects];
  [v16 setFilteredHistoryEvents:v18];

  return v16;
}

void __114__IRRuleCandidate__userRejectedInLastDayWithoutPickerChoicePrerequisiteValueForHistoryContainer_systemState_date___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = (void *)MEMORY[0x263EFF910];
  id v22 = v6;
  id v8 = [v6 date];
  LOBYTE(v7) = objc_msgSend(v7, "isDate:inSameDayAsDate:forTimeZoneInSeconds:", v8, *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "timeZoneSeconds"));

  if ((v7 & 1) == 0)
  {
    *a4 = 1;
    goto LABEL_12;
  }
  uint64_t v9 = [v22 event];
  id v10 = +[IREventDO eventDOWithMediaType:2];
  if ([v9 isEqual:v10]) {
    goto LABEL_9;
  }
  uint64_t v11 = [v22 event];
  uint64_t v12 = +[IREventDO eventDOWithMediaType:4];
  if ([v11 isEqual:v12])
  {
LABEL_8:

LABEL_9:
LABEL_10:
    [*(id *)(a1 + 48) addObject:v22];
LABEL_12:
    uint64_t v17 = v22;
    goto LABEL_13;
  }
  id v13 = [v22 event];
  id v14 = +[IREventDO eventDOWithMediaType:0];
  if ([v13 isEqual:v14])
  {
LABEL_7:

    goto LABEL_8;
  }
  id v15 = [v22 event];
  id v16 = +[IREventDO eventDOWithAppleTVControlType:5];
  if ([v15 isEqual:v16])
  {

    goto LABEL_7;
  }
  [v22 event];
  id v18 = v20 = v15;
  id v19 = +[IREventDO eventDOWithAppleTVControlType:0];
  char v21 = [v18 isEqual:v19];

  uint64_t v17 = v22;
  if (v21) {
    goto LABEL_10;
  }
LABEL_13:
}

- (BOOL)_isCandidateIdentifier:(id)a3 inHistory:(id)a4
{
  id v5 = a3;
  id v6 = [a4 historyEvents];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __52__IRRuleCandidate__isCandidateIdentifier_inHistory___block_invoke;
  v11[3] = &unk_26539FEB0;
  id v12 = v5;
  id v7 = v5;
  id v8 = [v6 firstWhere:v11];
  BOOL v9 = v8 != 0;

  return v9;
}

uint64_t __52__IRRuleCandidate__isCandidateIdentifier_inHistory___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 candidateIdentifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (id)_proximityLowestUwbRangeForCandidate:(id)a3 withNearbyDeviceContainer:(id)a4 date:(id)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)MEMORY[0x263EFF910];
  id v12 = +[IRPreferences shared];
  id v13 = [v12 nearbyDeviceMeasurmentExpityTimeSeconds];
  [v13 doubleValue];
  uint64_t v30 = v10;
  id v15 = [v11 dateWithTimeInterval:v10 sinceDate:-v14];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v31 = v8;
  id v16 = [v8 nodes];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    id v19 = 0;
    uint64_t v20 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v33 != v20) {
          objc_enumerationMutation(v16);
        }
        id v22 = [(IRRuleCandidate *)self _matchedDevicefromNode:*(void *)(*((void *)&v32 + 1) + 8 * i) withNearbyDeviceContainer:v9 measurementExpiry:v15 isUwb:1];
        id v23 = v22;
        if (v22)
        {
          id v24 = NSNumber;
          if (v19)
          {
            [v19 doubleValue];
            double v26 = v25;
            [v23 range];
            if (v26 < v27) {
              double v27 = v26;
            }
          }
          else
          {
            [v22 range];
          }
          uint64_t v28 = [v24 numberWithDouble:v27];

          id v19 = (void *)v28;
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v18);
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (id)_matchedDevicefromNode:(id)a3 withNearbyDeviceContainer:(id)a4 measurementExpiry:(id)a5 isUwb:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a4;
  id v10 = a5;
  id v11 = a3;
  id v12 = [v11 computedIdsIdentifier];
  id v13 = [v11 computedMediaRemoteIdenfifier];
  double v14 = [v11 computedMediaRouteIdentifier];

  if (v12 || v13 || v14)
  {
    id v16 = @"identifier-doesn't-match";
    if (v12) {
      uint64_t v17 = v12;
    }
    else {
      uint64_t v17 = @"identifier-doesn't-match";
    }
    if (v13) {
      uint64_t v18 = v13;
    }
    else {
      uint64_t v18 = @"identifier-doesn't-match";
    }
    if (v14) {
      id v16 = v14;
    }
    id v19 = [MEMORY[0x263F08A98] predicateWithFormat:@"(%K = %@ OR %K = %@ OR %K = %@) AND (%K >= %@) ", @"idsIdentifier", v17, @"mediaRemoteIdentifier", v18, @"mediaRemoteIdentifier", v16, @"measurementDate", v10];
    uint64_t v20 = [v9 nearbyDevices];
    char v21 = [v20 filteredSetUsingPredicate:v19];

    if (v6)
    {
      id v22 = [v21 firstWhere:&__block_literal_global_7];
      id v23 = v22;
      if (v22)
      {
        id v24 = v22;
      }
      else
      {
        id v24 = [v21 firstWhere:&__block_literal_global_125];
      }
      id v15 = v24;
    }
    else
    {
      id v15 = [v21 firstWhere:&__block_literal_global_128];
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

uint64_t __92__IRRuleCandidate__matchedDevicefromNode_withNearbyDeviceContainer_measurementExpiry_isUwb___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 proximityType];
  uint64_t v3 = [v2 isEqual:@"NIHomeDevice"];

  return v3;
}

BOOL __92__IRRuleCandidate__matchedDevicefromNode_withNearbyDeviceContainer_measurementExpiry_isUwb___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 proximityType];
  BOOL v3 = +[IRProximityProvider isUWBProximityType:v2];

  return v3;
}

BOOL __92__IRRuleCandidate__matchedDevicefromNode_withNearbyDeviceContainer_measurementExpiry_isUwb___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 proximityType];
  BOOL v3 = +[IRProximityProvider isBLEProximityType:v2];

  return v3;
}

- (BOOL)_proximityBLEValueForCandidate:(id)a3 withNearbyDeviceContainer:(id)a4 date:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = objc_msgSend(a3, "nodes", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        double v14 = [MEMORY[0x263EFF910] distantPast];
        id v15 = [(IRRuleCandidate *)self _matchedDevicefromNode:v13 withNearbyDeviceContainer:v7 measurementExpiry:v14 isUwb:0];

        if (v15)
        {
          BOOL v16 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v16 = 0;
LABEL_11:

  return v16;
}

- (id)_sameIcloudForCandidate:(id)a3 systemState:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(IRRuleOutputEvaluation);
  uint64_t v9 = objc_opt_new();
  uint64_t v10 = [v7 nodes];
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  long long v19 = __55__IRRuleCandidate__sameIcloudForCandidate_systemState___block_invoke;
  long long v20 = &unk_26539FED8;
  id v21 = v6;
  id v11 = v9;
  id v22 = v11;
  id v12 = v6;
  [v10 enumerateObjectsUsingBlock:&v17];

  uint64_t v13 = objc_msgSend(v7, "nodes", v17, v18, v19, v20);

  uint64_t v14 = [v13 count];
  if (v14)
  {
    uint64_t v15 = [(IRRuleCandidate *)self _valueFromValues:v11];

    id v8 = (IRRuleOutputEvaluation *)v15;
  }

  return v8;
}

void __55__IRRuleCandidate__sameIcloudForCandidate_systemState___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  BOOL v3 = objc_alloc_init(IRRuleOutputEvaluation);
  uint64_t v4 = [v8 rapportDevice];

  if (v4)
  {
    [(IRRuleOutputEvaluation *)v3 setHasBoolean:1];
    id v5 = [v8 rapportDevice];
    id v6 = [v5 iCloudId];
    id v7 = [*(id *)(a1 + 32) iCloudId];
    -[IRRuleOutputEvaluation setBoolean:](v3, "setBoolean:", [v6 isEqualToString:v7]);
  }
  [*(id *)(a1 + 40) addObject:v3];
}

- (id)_sameWiFiForCandidate:(id)a3 systemState:(id)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(IRRuleOutputEvaluation);
  id v7 = objc_opt_new();
  id v8 = [v5 nodes];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __53__IRRuleCandidate__sameWiFiForCandidate_systemState___block_invoke;
  v14[3] = &unk_26539FF00;
  id v9 = v7;
  id v15 = v9;
  [v8 enumerateObjectsUsingBlock:v14];

  uint64_t v10 = [v5 nodes];

  uint64_t v11 = [v10 count];
  if (v11)
  {
    uint64_t v12 = [(IRRuleCandidate *)self _valueFromValues:v9];

    id v6 = (IRRuleOutputEvaluation *)v12;
  }

  return v6;
}

void __53__IRRuleCandidate__sameWiFiForCandidate_systemState___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  BOOL v3 = objc_alloc_init(IRRuleOutputEvaluation);
  uint64_t v4 = [v11 avOutpuDeviceIdentifier];
  if (v4)
  {
    id v5 = (void *)v4;
    uint64_t v6 = [v11 avOutputDevice];
    if (v6)
    {
      id v7 = (void *)v6;
      id v8 = [v11 avOutputDevice];
      int v9 = [v8 hasAirplayProperties];

      if (v9)
      {
        uint64_t v10 = [v11 avOutputDevice];
        -[IRRuleOutputEvaluation setBoolean:](v3, "setBoolean:", [v10 discoveredOverInfra]);

        [(IRRuleOutputEvaluation *)v3 setHasBoolean:1];
      }
    }
    else
    {
    }
  }
  [*(id *)(a1 + 32) addObject:v3];
}

- (id)_activeRouteForCandidate:(id)a3 systemState:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(IRRuleOutputEvaluation);
  int v9 = objc_opt_new();
  uint64_t v10 = [v7 nodes];
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  long long v19 = __56__IRRuleCandidate__activeRouteForCandidate_systemState___block_invoke;
  long long v20 = &unk_26539FED8;
  id v21 = v6;
  id v11 = v9;
  id v22 = v11;
  id v12 = v6;
  [v10 enumerateObjectsUsingBlock:&v17];

  uint64_t v13 = objc_msgSend(v7, "nodes", v17, v18, v19, v20);

  uint64_t v14 = [v13 count];
  if (v14)
  {
    uint64_t v15 = [(IRRuleCandidate *)self _valueFromValues:v11];

    id v8 = (IRRuleOutputEvaluation *)v15;
  }

  return v8;
}

void __56__IRRuleCandidate__activeRouteForCandidate_systemState___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  BOOL v3 = objc_alloc_init(IRRuleOutputEvaluation);
  uint64_t v4 = [v8 avOutputDevice];

  if (v4)
  {
    [(IRRuleOutputEvaluation *)v3 setHasBoolean:1];
    id v5 = [v8 avOutputDevice];
    id v6 = [v5 deviceID];
    id v7 = [*(id *)(a1 + 32) mediaRouteGroupLeaderOutputDeviceID];
    -[IRRuleOutputEvaluation setBoolean:](v3, "setBoolean:", [v6 isEqual:v7]);
  }
  [*(id *)(a1 + 40) addObject:v3];
}

- (id)_mediaUserRejectedInLastDayWithoutPickerChoiceForCandidate:(id)a3 prerequisite:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(IRRuleOutputEvaluation);
  [(IRRuleOutputEvaluation *)v8 setHasBoolean:1];
  BOOL v9 = [(IRRuleCandidate *)self _isLastEventForCandidate:v7 inPrerequisite:v6 isOneOf:&unk_2703AF350];

  [(IRRuleOutputEvaluation *)v8 setBoolean:v9];

  return v8;
}

- (id)_appleTVControlUserRejectedInLastDayWithoutPickerChoiceForCandidate:(id)a3 prerequisite:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(IRRuleOutputEvaluation);
  [(IRRuleOutputEvaluation *)v8 setHasBoolean:1];
  BOOL v9 = [(IRRuleCandidate *)self _isLastEventForCandidate:v7 inPrerequisite:v6 isOneOf:&unk_2703AF368];

  [(IRRuleOutputEvaluation *)v8 setBoolean:v9];

  return v8;
}

- (BOOL)_isLastEventForCandidate:(id)a3 inPrerequisite:(id)a4 isOneOf:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v8;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__1;
  id v24 = __Block_byref_object_dispose__1;
  id v25 = 0;
  id v11 = [v10 filteredHistoryEvents];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __67__IRRuleCandidate__isLastEventForCandidate_inPrerequisite_isOneOf___block_invoke;
  v17[3] = &unk_26539F7F0;
  id v12 = v7;
  id v18 = v12;
  long long v19 = &v20;
  [v11 enumerateObjectsWithOptions:2 usingBlock:v17];

  if (v21[5])
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __67__IRRuleCandidate__isLastEventForCandidate_inPrerequisite_isOneOf___block_invoke_2;
    v16[3] = &unk_26539FF28;
    v16[4] = &v20;
    uint64_t v13 = [v9 firstWhere:v16];
    BOOL v14 = v13 != 0;
  }
  else
  {
    BOOL v14 = 0;
  }

  _Block_object_dispose(&v20, 8);
  return v14;
}

void __67__IRRuleCandidate__isLastEventForCandidate_inPrerequisite_isOneOf___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v14 = a2;
  id v6 = [*(id *)(a1 + 32) candidateIdentifier];
  id v7 = [v14 candidateIdentifier];
  int v8 = [v6 isEqual:v7];

  if (v8)
  {
    id v9 = NSNumber;
    id v10 = [v14 event];
    uint64_t v11 = objc_msgSend(v9, "numberWithLongLong:", objc_msgSend(v10, "eventType"));
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    *a4 = 1;
  }
}

uint64_t __67__IRRuleCandidate__isLastEventForCandidate_inPrerequisite_isOneOf___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isEqualToNumber:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
}

- (id)_valueFromValues:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(IRRuleOutputEvaluation);
  uint64_t v6 = [v4 count];
  if (v6)
  {
    uint64_t v7 = v6;
    int v8 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K = YES", @"hasBoolean");
    id v9 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K = YES", @"BOOLean");
    id v10 = [v4 filteredSetUsingPredicate:v8];
    uint64_t v11 = [v10 count];

    uint64_t v12 = [v4 filteredSetUsingPredicate:v9];
    uint64_t v13 = [v12 count];

    if ([(IRRuleCandidate *)self requireAllNodes]) {
      BOOL v14 = v11 == v7;
    }
    else {
      BOOL v14 = v11 != 0;
    }
    [(IRRuleOutputEvaluation *)v5 setHasBoolean:v14];
    if ([(IRRuleCandidate *)self requireAllNodes]) {
      BOOL v15 = v13 == v7;
    }
    else {
      BOOL v15 = v13 != 0;
    }
    [(IRRuleOutputEvaluation *)v5 setBoolean:v15];
  }

  return v5;
}

- (id)_attributeValueForAttributeKey:(id)a3 prerequisite:(id)a4 withCandidate:(id)a5 nearbyDeviceContainer:(id)a6 systemState:(id)a7 date:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  uint64_t v20 = objc_alloc_init(IRRuleOutputEvaluation);
  if ([v14 isEqual:@"kIRRuleCandidateSameWiFiKey"])
  {
    uint64_t v21 = [(IRRuleCandidate *)self _sameWiFiForCandidate:v16 systemState:v18];
  }
  else if ([v14 isEqual:@"kIRRuleCandidateSameiCloudKey"])
  {
    uint64_t v21 = [(IRRuleCandidate *)self _sameIcloudForCandidate:v16 systemState:v18];
  }
  else if ([v14 isEqual:@"kIRRuleCandidateProximityKey"])
  {
    uint64_t v21 = [(IRRuleCandidate *)self _proximityValueForCandidate:v16 withNearbyDeviceContainer:v17 prerequisite:v15 date:v19];
  }
  else if ([v14 isEqual:@"kIRRuleCandidateProximityShortestRangeKey"])
  {
    uint64_t v21 = [(IRRuleCandidate *)self _proximityShortestRangeValueForCandidate:v16 withNearbyDeviceContainer:v17 prerequisite:v15 date:v19];
  }
  else if ([v14 isEqual:@"kIRRuleCandidateProximityShortestRangeInHistoryOrSameICloudKey"])
  {
    uint64_t v21 = [(IRRuleCandidate *)self _proximityShortestRangeInHistoryOrSameICloudValueForCandidate:v16 withNearbyDeviceContainer:v17 prerequisite:v15 date:v19];
  }
  else if ([v14 isEqual:@"kIRRuleCandidateActiveRouteKey"])
  {
    uint64_t v21 = [(IRRuleCandidate *)self _activeRouteForCandidate:v16 systemState:v18];
  }
  else if ([v14 isEqual:@"kIRRuleCandidateMediaUserRejectedInLastDayWithoutPickerChoiceKey"])
  {
    uint64_t v21 = [(IRRuleCandidate *)self _mediaUserRejectedInLastDayWithoutPickerChoiceForCandidate:v16 prerequisite:v15];
  }
  else
  {
    if (![v14 isEqual:@"kIRRuleCandidateAppleTVControlUserRejectedInLastDayWithoutPickerChoiceKey"])goto LABEL_18; {
    uint64_t v21 = [(IRRuleCandidate *)self _appleTVControlUserRejectedInLastDayWithoutPickerChoiceForCandidate:v16 prerequisite:v15];
    }
  }
  uint64_t v22 = (IRRuleOutputEvaluation *)v21;

  uint64_t v20 = v22;
LABEL_18:

  return v20;
}

- (id)_prerequisiteValueForAttributeKey:(id)a3 withCandidatesContainer:(id)a4 nearbyDeviceContainer:(id)a5 systemState:(id)a6 historyContainer:(id)a7 date:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if ([v14 isEqual:@"kIRRuleCandidateProximityKey"])
  {
    uint64_t v20 = [(IRRuleCandidate *)self _proximityPrerequisiteValueForCandidatesContainer:v15 withNearbyDeviceContainer:v16 date:v19];
LABEL_10:
    uint64_t v21 = (void *)v20;
    goto LABEL_11;
  }
  if ([v14 isEqual:@"kIRRuleCandidateProximityShortestRangeKey"])
  {
    uint64_t v20 = [(IRRuleCandidate *)self _shortestRangeProximityPrerequisiteValueForCandidatesContainer:v15 withNearbyDeviceContainer:v16 date:v19];
    goto LABEL_10;
  }
  if ([v14 isEqual:@"kIRRuleCandidateProximityShortestRangeInHistoryOrSameICloudKey"])
  {
    uint64_t v20 = [(IRRuleCandidate *)self _shortestRangeWithHistoryOrSameICloudProximityPrerequisiteValueForCandidatesContainer:v15 withNearbyDeviceContainer:v16 historyContainer:v18 systemState:v17 date:v19];
    goto LABEL_10;
  }
  if (([v14 isEqual:@"kIRRuleCandidateMediaUserRejectedInLastDayWithoutPickerChoiceKey"] & 1) != 0
    || [v14 isEqual:@"kIRRuleCandidateAppleTVControlUserRejectedInLastDayWithoutPickerChoiceKey"])
  {
    uint64_t v20 = [(IRRuleCandidate *)self _userRejectedInLastDayWithoutPickerChoicePrerequisiteValueForHistoryContainer:v18 systemState:v17 date:v19];
    goto LABEL_10;
  }
  uint64_t v21 = 0;
LABEL_11:

  return v21;
}

- (NSString)attributeKey
{
  return self->_attributeKey;
}

- (void)setAttributeKey:(id)a3
{
}

- (BOOL)requireAllNodes
{
  return self->_requireAllNodes;
}

- (void)setRequireAllNodes:(BOOL)a3
{
  self->_requireAllNodes = a3;
}

- (void).cxx_destruct
{
}

@end