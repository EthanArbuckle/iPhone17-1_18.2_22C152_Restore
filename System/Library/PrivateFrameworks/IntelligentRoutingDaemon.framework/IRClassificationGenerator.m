@interface IRClassificationGenerator
- (BOOL)generateClassificationsWithCandiatesContainer:(id)a3 systemState:(id)a4 historyEventsContainer:(id)a5 miloPrediction:(id)a6 nearbyDeviceContainer:(id)a7 fillInspection:(BOOL)a8 date:(id)a9;
- (IRCandidateClassificationDetectorFiltered)detectorFiltered;
- (IRCandidateClassificationDetectorSameSpace)detectorSameSpace;
- (IRCandidateSelector)selector;
- (IRClassificationGenerator)init;
- (NSDictionary)contexts;
- (NSDictionary)policyInspections;
- (NSMutableDictionary)internalContexts;
- (NSMutableDictionary)internalPolicyInspections;
- (void)_adjustAdditionalFieldsForCandidate:(id)a3 selectedCandidateIdentifier:(id)a4 historyEvents:(id)a5 systemState:(id)a6;
- (void)_adjustClassificationForCandidate:(id)a3 selectedCandidateIdentifier:(id)a4 systemState:(id)a5 andDate:(id)a6;
- (void)_fillInspectionIfNeeded:(BOOL)a3 withCandidates:(id)a4 selectedCandidate:(id)a5 negativeInputs:(id)a6 stateMachineClassification:(int64_t)a7;
- (void)_setCallToActionForCandidate:(id)a3 withHistoryEventsAsc:(id)a4 andSystemState:(id)a5;
- (void)_setConservativeFilteredForCandidate:(id)a3 andSystemState:(id)a4;
- (void)_setLockScreenControlForCandidate:(id)a3;
- (void)_setSortingHintForCandidate:(id)a3;
- (void)setDetectorFiltered:(id)a3;
- (void)setDetectorSameSpace:(id)a3;
- (void)setInternalContexts:(id)a3;
- (void)setInternalPolicyInspections:(id)a3;
- (void)setSelector:(id)a3;
@end

@implementation IRClassificationGenerator

- (NSDictionary)contexts
{
  v2 = [(IRClassificationGenerator *)self internalContexts];
  v3 = (void *)[v2 copy];

  return (NSDictionary *)v3;
}

- (BOOL)generateClassificationsWithCandiatesContainer:(id)a3 systemState:(id)a4 historyEventsContainer:(id)a5 miloPrediction:(id)a6 nearbyDeviceContainer:(id)a7 fillInspection:(BOOL)a8 date:(id)a9
{
  BOOL v78 = a8;
  uint64_t v102 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a9;
  id v18 = a7;
  v80 = v13;
  v19 = [v13 airplayOrUnknownCandidates];
  v20 = [v19 map:&__block_literal_global_2];

  v21 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  v22 = (void *)*MEMORY[0x263F50090];
  v79 = v16;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
  {
    id v76 = v15;
    v23 = NSNumber;
    v24 = v22;
    v25 = [v80 candidates];
    v26 = objc_msgSend(v23, "numberWithUnsignedInteger:", objc_msgSend(v25, "count"));
    v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSObject count](v20, "count"));
    *(_DWORD *)buf = 136315906;
    v91 = "#classification-generator, ";
    __int16 v92 = 2112;
    v93 = v21;
    __int16 v94 = 2112;
    v95 = v26;
    __int16 v96 = 2112;
    v97 = v27;
    _os_log_impl(&dword_25418E000, v24, OS_LOG_TYPE_INFO, "%s[%@], #totalCandidates=%@, #validCandidates=%@", buf, 0x2Au);

    id v15 = v76;
    id v16 = v79;
  }

  v28 = [(IRClassificationGenerator *)self detectorSameSpace];
  v29 = [v15 historyEvents];
  [v28 adjustSameSpaceParametersForCandidates:v20 withSystemState:v14 andHistoryEventsAsc:v29 andMiLoPrediction:v16 andNearbyDevicesContainer:v18 andDate:v17];

  v30 = [(IRClassificationGenerator *)self detectorFiltered];
  [v30 adjustFilteredParametersForCandidates:v20 withSystemState:v14 andDate:v17];

  v31 = [(IRClassificationGenerator *)self selector];
  v32 = [v15 historyEvents];
  v33 = [v31 selectFromCandidates:v20 withSystemState:v14 andHistoryEventsAsc:v32 andDate:v17];

  if (v33)
  {
    v34 = [v33 candidate];
    v35 = [v15 historyEvents];
    int64_t v36 = +[IRCandicateClassificationEligibility classificationEligibilityForCandidate:v34 withHistoryEventsAsc:v35 systemState:v14];

    int64_t v37 = v36;
    [v33 setNominatedClassification:v36];
    if ([v33 nominatedClassification] == 2)
    {
      v38 = [v33 nominatedClassificationDesc];
      v39 = [v38 stringByAppendingString:@"[Not Eligble]"];
      [v33 setNominatedClassificationDesc:v39];
    }
    int64_t v77 = v37;
    v40 = [(IRClassificationGenerator *)self selector];
    v41 = [v15 historyEvents];
    v75 = [v40 adjustClassificationForCandidateBasedOnNegativeInputs:v33 withSystemState:v14 andHistoryEventsAsc:v41 andMiloPrediction:v16 andDate:v17];

    v42 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
    v43 = (void *)*MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
    {
      log = v43;
      v71 = [v33 candidate];
      v67 = [v71 name];
      v44 = [v33 candidate];
      v45 = [v44 candidateIdentifier];
      [v33 nominatedClassification];
      v46 = IRCandidateClassificationToString();
      [v33 nominatedClassificationDesc];
      id v73 = v17;
      v48 = id v47 = v15;
      *(_DWORD *)buf = 136316418;
      v91 = "#classification-generator, ";
      __int16 v92 = 2112;
      v93 = v42;
      __int16 v94 = 2112;
      v95 = v67;
      __int16 v96 = 2112;
      v97 = v45;
      __int16 v98 = 2112;
      v99 = v46;
      __int16 v100 = 2112;
      v101 = v48;
      _os_log_impl(&dword_25418E000, log, OS_LOG_TYPE_INFO, "%s[%@], SelectedCandidate: name: %@, identifier: %@, classification: %@, desc: %@", buf, 0x3Eu);

      id v15 = v47;
      id v17 = v73;
    }
  }
  else
  {
    v75 = 0;
    int64_t v77 = 0;
  }
  id v49 = objc_alloc_init(MEMORY[0x263F500D0]);
  v50 = [MEMORY[0x263EFF9C0] set];
  v82[0] = MEMORY[0x263EF8330];
  v82[1] = 3221225472;
  v82[2] = __167__IRClassificationGenerator_generateClassificationsWithCandiatesContainer_systemState_historyEventsContainer_miloPrediction_nearbyDeviceContainer_fillInspection_date___block_invoke_33;
  v82[3] = &unk_26539F8D0;
  v82[4] = self;
  id v83 = v33;
  id v84 = v14;
  id v85 = v17;
  id v86 = v15;
  id v87 = v49;
  BOOL v89 = v78;
  id v88 = v50;
  id v68 = v50;
  id v51 = v49;
  id v74 = v15;
  id v72 = v17;
  id v52 = v14;
  id v53 = v33;
  [v20 enumerateObjectsUsingBlock:v82];
  v54 = [v51 candidateResults];
  v55 = [(IRClassificationGenerator *)self internalContexts];
  os_log_t loga = v20;
  uint64_t v56 = *MEMORY[0x263F50080];
  v57 = [v55 objectForKeyedSubscript:*MEMORY[0x263F50080]];
  v58 = [v57 candidateResults];
  char v66 = [v54 isEqual:v58];

  v59 = [(IRClassificationGenerator *)self internalContexts];
  [v59 setObject:v51 forKeyedSubscript:v56];

  v60 = [(IRClassificationGenerator *)self internalContexts];
  v61 = [v60 objectForKeyedSubscript:v56];
  v62 = [v52 appInFocusBundleID];
  [v61 updateBundleIdentifier:v62];

  v63 = [v53 candidate];
  v64 = [v63 candidateIdentifier];
  [(IRClassificationGenerator *)self _fillInspectionIfNeeded:v78 withCandidates:v68 selectedCandidate:v64 negativeInputs:v75 stateMachineClassification:v77];

  return v66 ^ 1;
}

- (NSMutableDictionary)internalContexts
{
  return self->_internalContexts;
}

- (IRCandidateSelector)selector
{
  return self->_selector;
}

- (IRCandidateClassificationDetectorSameSpace)detectorSameSpace
{
  return self->_detectorSameSpace;
}

- (IRCandidateClassificationDetectorFiltered)detectorFiltered
{
  return self->_detectorFiltered;
}

- (void)_fillInspectionIfNeeded:(BOOL)a3 withCandidates:(id)a4 selectedCandidate:(id)a5 negativeInputs:(id)a6 stateMachineClassification:(int64_t)a7
{
  BOOL v10 = a3;
  id v12 = a5;
  if (v10)
  {
    id v13 = a6;
    id v14 = a4;
    id v15 = [[IRPolicyInspection alloc] initWithName:@"Media"];
    id v16 = [(IRClassificationGenerator *)self internalPolicyInspections];
    uint64_t v17 = *MEMORY[0x263F50080];
    [v16 setObject:v15 forKeyedSubscript:*MEMORY[0x263F50080]];

    uint64_t v22 = MEMORY[0x263EF8330];
    uint64_t v23 = 3221225472;
    v24 = __128__IRClassificationGenerator__fillInspectionIfNeeded_withCandidates_selectedCandidate_negativeInputs_stateMachineClassification___block_invoke;
    v25 = &unk_26539F8F8;
    id v26 = v12;
    v27 = self;
    [v14 enumerateObjectsUsingBlock:&v22];

    id v18 = [(IRClassificationGenerator *)self internalPolicyInspections];
    v19 = [v18 objectForKeyedSubscript:v17];
    [v19 setGeneratorNegativeInputs:v13];

    v20 = [(IRClassificationGenerator *)self internalPolicyInspections];
    v21 = [v20 objectForKeyedSubscript:v17];
    [v21 setStateMachineClassification:a7];
  }
}

- (NSMutableDictionary)internalPolicyInspections
{
  return self->_internalPolicyInspections;
}

- (IRClassificationGenerator)init
{
  v14.receiver = self;
  v14.super_class = (Class)IRClassificationGenerator;
  v2 = [(IRClassificationGenerator *)&v14 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [(IRClassificationGenerator *)v2 setInternalContexts:v3];

    id v4 = objc_alloc_init(MEMORY[0x263F500D0]);
    v5 = [(IRClassificationGenerator *)v2 internalContexts];
    uint64_t v6 = *MEMORY[0x263F50080];
    [v5 setObject:v4 forKeyedSubscript:*MEMORY[0x263F50080]];

    id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [(IRClassificationGenerator *)v2 setInternalPolicyInspections:v7];

    v8 = [[IRPolicyInspection alloc] initWithName:@"Media"];
    v9 = [(IRClassificationGenerator *)v2 internalPolicyInspections];
    [v9 setObject:v8 forKeyedSubscript:v6];

    BOOL v10 = objc_alloc_init(IRCandidateClassificationDetectorFiltered);
    [(IRClassificationGenerator *)v2 setDetectorFiltered:v10];

    v11 = objc_alloc_init(IRCandidateClassificationDetectorSameSpace);
    [(IRClassificationGenerator *)v2 setDetectorSameSpace:v11];

    id v12 = objc_alloc_init(IRCandidateSelector);
    [(IRClassificationGenerator *)v2 setSelector:v12];
  }
  return v2;
}

IRCandidateWrapper *__167__IRClassificationGenerator_generateClassificationsWithCandiatesContainer_systemState_historyEventsContainer_miloPrediction_nearbyDeviceContainer_fillInspection_date___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[IRCandidateWrapper alloc] initWithCandidate:v2];

  return v3;
}

void __167__IRClassificationGenerator_generateClassificationsWithCandiatesContainer_systemState_historyEventsContainer_miloPrediction_nearbyDeviceContainer_fillInspection_date___block_invoke_33(uint64_t a1, void *a2)
{
  id v23 = a2;
  id v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) candidate];
  v5 = [v4 candidateIdentifier];
  [v3 _adjustClassificationForCandidate:v23 selectedCandidateIdentifier:v5 systemState:*(void *)(a1 + 48) andDate:*(void *)(a1 + 56)];

  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) candidate];
  v8 = [v7 candidateIdentifier];
  v9 = [*(id *)(a1 + 64) historyEvents];
  [v6 _adjustAdditionalFieldsForCandidate:v23 selectedCandidateIdentifier:v8 historyEvents:v9 systemState:*(void *)(a1 + 48)];

  id v10 = objc_alloc(MEMORY[0x263F500C0]);
  v11 = [v23 candidate];
  id v12 = +[IRCandidateDO candidateFromCandidateDO:v11];
  uint64_t v13 = [v23 nominatedClassification];
  objc_super v14 = [v23 nominatedClassificationDesc];
  id v15 = [v23 sortingHint];
  id v16 = [v23 isCallToAction];
  uint64_t v17 = [v16 BOOLValue];
  uint64_t v18 = [v23 isLockScreenControl];
  LOBYTE(v22) = [v23 isConservativeFiltered];
  v19 = (void *)[v10 initWithCandidate:v12 classification:v13 classificationDescription:v14 sortingHint:v15 isCallToAction:v17 isLockScreenControl:v18 isConservativeFiltered:v22];

  [*(id *)(a1 + 72) addCandidateResult:v19];
  if (*(unsigned char *)(a1 + 88))
  {
    uint64_t v20 = [v23 nominatedClassification];
    v21 = [v23 nominatedClassificationDesc];
    [v23 setClassification:v20 withDescription:v21];

    [*(id *)(a1 + 80) addObject:v23];
  }
}

- (NSDictionary)policyInspections
{
  id v2 = [(IRClassificationGenerator *)self internalPolicyInspections];
  id v3 = (void *)[v2 copy];

  return (NSDictionary *)v3;
}

- (void)_adjustClassificationForCandidate:(id)a3 selectedCandidateIdentifier:(id)a4 systemState:(id)a5 andDate:(id)a6
{
  id v24 = a3;
  id v7 = a4;
  int v8 = [v24 isFiltered];
  v9 = [v24 candidate];
  id v10 = [v9 candidateIdentifier];
  int v11 = [v7 isEqual:v10];

  int v12 = [v24 isSameSpace];
  if (v8)
  {
    [v24 setNominatedClassification:1];
    uint64_t v13 = @"{Filtered}";
    objc_super v14 = v24;
  }
  else if (v11)
  {
    uint64_t v15 = [v24 nominatedClassificationDesc];
    objc_super v14 = v24;
    uint64_t v13 = (__CFString *)v15;
  }
  else
  {
    objc_super v14 = v24;
    if (v12)
    {
      [v24 setNominatedClassification:2];
      objc_super v14 = v24;
      uint64_t v13 = @"{Same space}";
    }
    else
    {
      uint64_t v13 = &stru_27039A840;
    }
  }
  id v16 = NSString;
  uint64_t v17 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v14, "sameSpaceBasedOnUWB"));
  uint64_t v18 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v24, "sameSpaceBasedOnBLE"));
  v19 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v24, "sameSpaceBasedOnMiLo"));
  uint64_t v20 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v24, "sameSpaceBasedOnBrokeredLOI"));
  v21 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v24, "sameSpaceBasedOnPDRFence"));
  uint64_t v22 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v24, "sameSpaceBasedOnHistory"));
  id v23 = [v16 stringWithFormat:@"{UWB:%@, BLE:%@, MILO:%@, BrokeredInLOI:%@, PDRFence:%@, History:%@}%@", v17, v18, v19, v20, v21, v22, v13];
  [v24 setNominatedClassificationDesc:v23];
}

- (void)_adjustAdditionalFieldsForCandidate:(id)a3 selectedCandidateIdentifier:(id)a4 historyEvents:(id)a5 systemState:(id)a6
{
  id v16 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  uint64_t v13 = [v16 candidate];
  objc_super v14 = [v13 candidateIdentifier];
  int v15 = [v14 isEqual:v12];

  if (v15)
  {
    [(IRClassificationGenerator *)self _setSortingHintForCandidate:v16];
    [(IRClassificationGenerator *)self _setCallToActionForCandidate:v16 withHistoryEventsAsc:v10 andSystemState:v11];
  }
  else if (![v16 isSameSpace])
  {
    goto LABEL_5;
  }
  [(IRClassificationGenerator *)self _setLockScreenControlForCandidate:v16];
LABEL_5:
  [(IRClassificationGenerator *)self _setConservativeFilteredForCandidate:v16 andSystemState:v11];
}

void __128__IRClassificationGenerator__fillInspectionIfNeeded_withCandidates_selectedCandidate_negativeInputs_stateMachineClassification___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 candidate];
  v5 = [v4 candidateIdentifier];
  int v6 = [v5 isEqual:*(void *)(a1 + 32)];

  uint64_t v27 = a1;
  if (v6)
  {
    id v7 = [*(id *)(a1 + 40) selector];
    id v28 = [v7 getSelectorReasons];
  }
  else
  {
    id v28 = 0;
  }
  v25 = [IRCandidateInspection alloc];
  id v23 = [IRCandidateInspectionGenerator alloc];
  id v26 = [v3 candidateResult];
  uint64_t v22 = [v26 classification];
  id v24 = [v3 candidateResult];
  int v8 = [v24 classificationDescription];
  uint64_t v9 = [v3 sameSpaceBasedOnMiLo];
  uint64_t v10 = [v3 sameSpaceBasedOnBrokeredLOI];
  uint64_t v11 = [v3 sameSpaceBasedOnPDRFence];
  uint64_t v12 = [v3 sameSpaceBasedOnUWB];
  char v13 = [v3 sameSpaceBasedOnBLE];
  char v14 = [v3 sameSpaceBasedOnHistory];
  int v15 = [v3 candidate];

  id v16 = +[IRCandidateDO candidateFromCandidateDO:v15];
  BYTE1(v21) = v14;
  LOBYTE(v21) = v13;
  uint64_t v17 = -[IRCandidateInspectionGenerator initWithClassification:ClassificationDescription:sameSpaceBasedOnMiLo:sameSpaceBasedOnBrokeredLOI:sameSpaceBasedOnPDRFence:sameSpaceBasedOnUWB:sameSpaceBasedOnBLE:sameSpaceBasedOnHistory:candidateSelectorReasons:forCandidate:](v23, "initWithClassification:ClassificationDescription:sameSpaceBasedOnMiLo:sameSpaceBasedOnBrokeredLOI:sameSpaceBasedOnPDRFence:sameSpaceBasedOnUWB:sameSpaceBasedOnBLE:sameSpaceBasedOnHistory:candidateSelectorReasons:forCandidate:", v22, v8, v9, v10, v11, v12, v21, v28, v16);
  uint64_t v18 = [(IRCandidateInspection *)v25 initWithInspectionGenerator:v17];

  v19 = [*(id *)(v27 + 40) internalPolicyInspections];
  uint64_t v20 = [v19 objectForKeyedSubscript:*MEMORY[0x263F50080]];
  [v20 addCandidate:v18];
}

- (void)_setSortingHintForCandidate:(id)a3
{
  id v3 = a3;
  [v3 setSortingHint:&unk_2703AF410];
  id v6 = [v3 nominatedClassificationDesc];
  id v4 = [v3 sortingHint];
  v5 = [v6 stringByAppendingFormat:@"(SH=%@)", v4];
  [v3 setNominatedClassificationDesc:v5];
}

- (void)_setCallToActionForCandidate:(id)a3 withHistoryEventsAsc:(id)a4 andSystemState:(id)a5
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v47 = a5;
  if ((([v7 sameSpaceBasedOnUWB] & 1) != 0
     || [v7 sameSpaceBasedOnBrokeredLOI])
    && ([v7 isFiltered] & 1) == 0)
  {
    uint64_t v9 = [v7 isCallToAction];

    if (!v9)
    {
      v45 = +[IREventDO eventDOWithMediaType:11];
      uint64_t v10 = v8;
      uint64_t v11 = (void *)MEMORY[0x263EFFA08];
      uint64_t v12 = +[IREventDO eventDOWithMediaType:9];
      char v13 = +[IREventDO eventDOWithMediaType:10];
      char v14 = +[IREventDO eventDOWithMediaType:8];
      int v15 = +[IREventDO eventDOWithMediaType:4];
      v44 = objc_msgSend(v11, "setWithObjects:", v12, v13, v14, v15, 0);

      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      v43 = v10;
      id obj = v10;
      uint64_t v16 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        unint64_t v18 = 0;
        uint64_t v19 = *(void *)v49;
LABEL_7:
        uint64_t v20 = 0;
        while (1)
        {
          if (*(void *)v49 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = *(void **)(*((void *)&v48 + 1) + 8 * v20);
          uint64_t v22 = [v7 candidate];
          id v23 = [v22 candidateIdentifier];
          id v24 = [v21 candidateIdentifier];
          int v25 = [v23 isEqual:v24];

          if (v25)
          {
            id v26 = [v47 appInFocusBundleID];
            uint64_t v27 = [v21 event];
            id v28 = [v27 bundleID];
            int v29 = [v26 isEqual:v28];

            if (v29)
            {
              v30 = [v21 event];
              int v31 = [v30 isEqual:v45];

              if (v31)
              {
                ++v18;
                v32 = +[IRPreferences shared];
                v33 = [v32 candidateSelectorCallToActionAppearThreshold];
                unsigned int v34 = [v33 unsignedIntValue];

                if (v18 > v34)
                {
                  v39 = [v7 nominatedClassificationDesc];
                  v40 = v39;
                  v41 = @"[C2A Exceeded]";
LABEL_20:
                  v42 = [v39 stringByAppendingString:v41];
                  [v7 setNominatedClassificationDesc:v42];

                  goto LABEL_21;
                }
              }
              else
              {
                v35 = [v21 event];
                int v36 = [v44 containsObject:v35];

                if ((v36 & 1) == 0)
                {
                  v39 = [v7 nominatedClassificationDesc];
                  v40 = v39;
                  v41 = @"[C2A interaction]";
                  goto LABEL_20;
                }
              }
            }
          }
          if (v17 == ++v20)
          {
            uint64_t v17 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
            if (v17) {
              goto LABEL_7;
            }
            break;
          }
        }
      }

      int64_t v37 = [v7 nominatedClassificationDesc];
      v38 = [v37 stringByAppendingString:@"(C2A)"];
      [v7 setNominatedClassificationDesc:v38];

      [v7 setIsCallToAction:MEMORY[0x263EFFA88]];
LABEL_21:
      id v8 = v43;
    }
  }
}

- (void)_setLockScreenControlForCandidate:(id)a3
{
  id v5 = a3;
  if (([v5 sameSpaceBasedOnMiLo] & 1) != 0 || objc_msgSend(v5, "sameSpaceBasedOnUWB"))
  {
    id v3 = [v5 nominatedClassificationDesc];
    id v4 = [v3 stringByAppendingString:@"(Lock Screen Control)"];
    [v5 setNominatedClassificationDesc:v4];

    [v5 setIsLockScreenControl:1];
  }
}

- (void)_setConservativeFilteredForCandidate:(id)a3 andSystemState:(id)a4
{
  id v6 = a3;
  if ([v6 isConservativeFiltered])
  {
    id v4 = [v6 nominatedClassificationDesc];
    id v5 = [v4 stringByAppendingString:@"(Conservative Filtered)"];
    [v6 setNominatedClassificationDesc:v5];
  }
}

- (void)setInternalContexts:(id)a3
{
}

- (void)setInternalPolicyInspections:(id)a3
{
}

- (void)setDetectorFiltered:(id)a3
{
}

- (void)setDetectorSameSpace:(id)a3
{
}

- (void)setSelector:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selector, 0);
  objc_storeStrong((id *)&self->_detectorSameSpace, 0);
  objc_storeStrong((id *)&self->_detectorFiltered, 0);
  objc_storeStrong((id *)&self->_internalPolicyInspections, 0);

  objc_storeStrong((id *)&self->_internalContexts, 0);
}

@end