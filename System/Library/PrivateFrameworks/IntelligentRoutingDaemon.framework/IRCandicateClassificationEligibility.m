@interface IRCandicateClassificationEligibility
+ (id)_generateSettingsStruct:(id)a3;
+ (int64_t)_eligibilityTypeFromEvent:(id)a3;
+ (int64_t)classificationEligibilityForCandidate:(id)a3 withHistoryEventsAsc:(id)a4 systemState:(id)a5;
@end

@implementation IRCandicateClassificationEligibility

+ (int64_t)classificationEligibilityForCandidate:(id)a3 withHistoryEventsAsc:(id)a4 systemState:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [v7 candidateIdentifier];
  v11 = +[IRCandicateClassificationEligibility _generateSettingsStruct:v7];
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__13;
  v36 = __Block_byref_object_dispose__13;
  id v37 = (id)objc_opt_new();
  v12 = [v11 initialStateIsOneTap];
  int v13 = [v12 BOOLValue];

  if (v13) {
    [(id)v33[5] setEligibilityState:1];
  }
  v14 = +[IREventDO eventDOWithMediaType:1];
  v15 = +[IREventDO eventDOWithMediaType:0];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __111__IRCandicateClassificationEligibility_classificationEligibilityForCandidate_withHistoryEventsAsc_systemState___block_invoke;
  v24[3] = &unk_2653A0FF8;
  id v16 = v10;
  id v25 = v16;
  id v17 = v9;
  id v26 = v17;
  id v18 = v14;
  id v27 = v18;
  id v19 = v8;
  id v28 = v19;
  id v20 = v15;
  id v29 = v20;
  v31 = &v32;
  id v21 = v11;
  id v30 = v21;
  [v19 enumerateObjectsUsingBlock:v24];
  int64_t v22 = +[IRCandicateClassificationEligibilityStateMachine _classificationFromEligibility:](IRCandicateClassificationEligibilityStateMachine, "_classificationFromEligibility:", [(id)v33[5] eligibilityState]);

  _Block_object_dispose(&v32, 8);
  return v22;
}

void __111__IRCandicateClassificationEligibility_classificationEligibilityForCandidate_withHistoryEventsAsc_systemState___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = *(void **)(a1 + 32);
  id v27 = v5;
  id v7 = [v5 candidateIdentifier];
  LODWORD(v6) = [v6 isEqual:v7];

  if (v6
    && (+[IRRuleHistoryPattern filterHistoryBySimilarApp:withSystemState:](IRRuleHistoryPattern, "filterHistoryBySimilarApp:withSystemState:", v27, *(void *)(a1 + 40))|| +[IRRuleHistoryPattern filterHistoryByBrokeredDeviceScan:v27]))
  {
    id v8 = [v27 event];
    int64_t v9 = +[IRCandicateClassificationEligibility _eligibilityTypeFromEvent:v8];

    v10 = *(void **)(a1 + 48);
    v11 = [v27 event];
    LODWORD(v10) = [v10 isEqual:v11];

    if (v10)
    {
      uint64_t v12 = 3;
      while (++a3 < (unint64_t)[*(id *)(a1 + 56) count])
      {
        int v13 = [*(id *)(a1 + 56) objectAtIndexedSubscript:a3];
        v14 = [v13 date];
        v15 = [v27 date];
        [v14 timeIntervalSinceDate:v15];
        double v17 = v16;
        id v18 = +[IRPreferences shared];
        id v19 = [v18 pickerAutoSelectToPicketChoiceMinInterval];
        [v19 doubleValue];
        double v21 = v20;

        if (v17 > v21)
        {

          break;
        }
        int64_t v22 = [v13 candidateIdentifier];
        v23 = [v27 candidateIdentifier];
        char v24 = [v22 isEqual:v23];

        if (v24)
        {
        }
        else
        {
          id v25 = *(void **)(a1 + 64);
          id v26 = [v13 event];
          LOBYTE(v25) = [v25 isEqual:v26];

          if (v25) {
            goto LABEL_14;
          }
        }
      }
    }
    uint64_t v12 = v9;
LABEL_14:
    [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) runWithEventType:v12 smSettings:*(void *)(a1 + 72)];
  }
}

+ (int64_t)_eligibilityTypeFromEvent:(id)a3
{
  id v3 = a3;
  v4 = +[IREventDO eventDOWithMediaType:5];
  id v5 = +[IREventDO eventDOWithMediaType:0];
  v14 = +[IREventDO eventDOWithMediaType:3];
  int64_t v6 = 1;
  id v7 = +[IREventDO eventDOWithMediaType:1];
  id v8 = +[IREventDO eventDOWithMediaType:4];
  int64_t v9 = +[IREventDO eventDOWithMediaType:2];
  v10 = +[IREventDO eventDOWithMediaType:8];
  v11 = +[IREventDO eventDOWithMediaType:9];
  uint64_t v12 = +[IREventDO eventDOWithMediaType:10];
  if (([v3 isEqual:v4] & 1) == 0)
  {
    if ([v3 isEqual:v5])
    {
      int64_t v6 = 1;
    }
    else if ([v3 isEqual:v14] & 1) != 0 || (objc_msgSend(v3, "isEqual:", v7))
    {
      int64_t v6 = 4;
    }
    else if ([v3 isEqual:v8])
    {
      int64_t v6 = 2;
    }
    else if ([v3 isEqual:v9])
    {
      int64_t v6 = 3;
    }
    else if ([v3 isEqual:v10])
    {
      int64_t v6 = 5;
    }
    else if ([v3 isEqual:v11])
    {
      int64_t v6 = 6;
    }
    else if ([v3 isEqual:v12])
    {
      int64_t v6 = 7;
    }
    else
    {
      int64_t v6 = 0;
    }
  }

  return v6;
}

+ (id)_generateSettingsStruct:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(IREligibilitySettings);
  int v5 = [v3 isFirstPartyDevice];

  int64_t v6 = +[IRPreferences shared];
  id v7 = v6;
  if (v5)
  {
    id v8 = [v6 uprankToOneTapEligibilityThreshold1stParty];
    [(IREligibilitySettings *)v4 setUpRankToOneTapThr:v8];

    int64_t v9 = +[IRPreferences shared];
    v10 = [v9 uprankToAutorouteEligibilityThreshold1stParty];
    [(IREligibilitySettings *)v4 setUprankToAutorouteThr:v10];

    v11 = +[IRPreferences shared];
    uint64_t v12 = [v11 downrankToNoneEligibilityThreshold1stParty];
    [(IREligibilitySettings *)v4 setDownrankToNoneThr:v12];

    int v13 = +[IRPreferences shared];
    v14 = [v13 downrankToNoneEligibilityBasedOnDismissAndRejectThreshold1stParty];
    [(IREligibilitySettings *)v4 setDownrankToNoneWithIgnoringThr:v14];

    v15 = +[IRPreferences shared];
    double v16 = [v15 downrankToOneTapEligibilityThreshold1stParty];
    [(IREligibilitySettings *)v4 setDownrankToOneTapThr:v16];

    double v17 = +[IRPreferences shared];
    [v17 eligibilityInitStateIsOneTap1stParty];
  }
  else
  {
    id v18 = [v6 uprankToOneTapEligibilityThreshold3rdParty];
    [(IREligibilitySettings *)v4 setUpRankToOneTapThr:v18];

    id v19 = +[IRPreferences shared];
    double v20 = [v19 uprankToAutorouteEligibilityThreshold3rdParty];
    [(IREligibilitySettings *)v4 setUprankToAutorouteThr:v20];

    double v21 = +[IRPreferences shared];
    int64_t v22 = [v21 downrankToNoneEligibilityThreshold3rdParty];
    [(IREligibilitySettings *)v4 setDownrankToNoneThr:v22];

    v23 = +[IRPreferences shared];
    char v24 = [v23 downrankToNoneEligibilityBasedOnDismissAndRejectThreshold3rdParty];
    [(IREligibilitySettings *)v4 setDownrankToNoneWithIgnoringThr:v24];

    id v25 = +[IRPreferences shared];
    id v26 = [v25 downrankToOneTapEligibilityThreshold3rdParty];
    [(IREligibilitySettings *)v4 setDownrankToOneTapThr:v26];

    double v17 = +[IRPreferences shared];
    [v17 eligibilityInitStateIsOneTap3rdParty];
  id v27 = };
  [(IREligibilitySettings *)v4 setInitialStateIsOneTap:v27];

  id v28 = +[IRPreferences shared];
  id v29 = [v28 brokeredUseScansForEligibilityOfMainDevice];
  -[IREligibilitySettings setUseBrokeredScanForMain:](v4, "setUseBrokeredScanForMain:", [v29 BOOLValue]);

  id v30 = +[IRPreferences shared];
  v31 = [v30 brokeredUseScansForEligibilityOfSecondaryDevice];
  -[IREligibilitySettings setUseBrokeredScanForSecondary:](v4, "setUseBrokeredScanForSecondary:", [v31 BOOLValue]);

  return v4;
}

@end