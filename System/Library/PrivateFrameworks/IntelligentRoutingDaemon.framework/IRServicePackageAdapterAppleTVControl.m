@interface IRServicePackageAdapterAppleTVControl
- (BOOL)_outputRulesToContext:(id)a3 candidatesContainer:(id)a4 fillInspection:(BOOL)a5;
- (BOOL)generateClassificationsWithCandiatesContainer:(id)a3 systemState:(id)a4 historyEventsContainer:(id)a5 miloPrediction:(id)a6 nearbyDeviceContainer:(id)a7 fillInspection:(BOOL)a8 date:(id)a9;
- (BOOL)shouldAskForLowLatencyMiLo:(id)a3 historyEventsAsc:(id)a4;
- (BOOL)shouldConsiderEventForSignificantBundles:(id)a3;
- (BOOL)shouldRejectEvent:(id)a3 withHistoryEventsContainer:(id)a4 withSystemState:(id)a5 forCandidate:(id)a6 date:(id)a7;
- (IRServicePackageAdapterAppleTVControl)init;
- (NSDictionary)contexts;
- (NSDictionary)policyInspections;
- (NSMutableDictionary)internalContexts;
- (NSMutableDictionary)internalPolicyInspections;
- (id)_autoRouteClassificationForCandidate:(id)a3 forClassificationEvaluated:(int64_t)a4;
- (id)_autoRoutePositiveRulesClassificationForCandidate:(id)a3 forClassificationEvaluated:(int64_t)a4;
- (id)_filteredClassificationForCandidate:(id)a3 forClassificationEvaluated:(int64_t)a4;
- (id)_oneTapClassificationForCandidate:(id)a3 forClassificationEvaluated:(int64_t)a4;
- (id)_reasonsForRejectingAutoRouteOrOneTapClassificationForCandidate:(id)a3;
- (id)_rules;
- (id)_topOfListClassificationForCandidate:(id)a3 forClassificationEvaluated:(int64_t)a4;
- (id)_topOfListClassificationPositiveRulesForCandidate:(id)a3 forClassificationEvaluated:(int64_t)a4;
- (id)filterHistory:(id)a3 withCandidatesContainer:(id)a4;
- (id)getSignificantBundlesWithCandidates:(id)a3 fromHistory:(id)a4;
- (id)uiAnalyticsWithEvent:(id)a3 forCandidateIdentifier:(id)a4 systemStateManager:(id)a5 candidatesContainer:(id)a6 inspections:(id)a7 statisticsManager:(id)a8 service:(id)a9 historyEventsContainer:(id)a10;
- (void)_classifyContext:(id)a3;
- (void)_evaluateOutputRules:(id)a3 contextWrapper:(id)a4;
- (void)setInternalContexts:(id)a3;
- (void)setInternalPolicyInspections:(id)a3;
@end

@implementation IRServicePackageAdapterAppleTVControl

- (IRServicePackageAdapterAppleTVControl)init
{
  v11.receiver = self;
  v11.super_class = (Class)IRServicePackageAdapterAppleTVControl;
  v2 = [(IRServicePackageAdapterAppleTVControl *)&v11 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [(IRServicePackageAdapterAppleTVControl *)v2 setInternalContexts:v3];

    id v4 = objc_alloc_init(MEMORY[0x263F500D0]);
    v5 = [(IRServicePackageAdapterAppleTVControl *)v2 internalContexts];
    uint64_t v6 = *MEMORY[0x263F50078];
    [v5 setObject:v4 forKeyedSubscript:*MEMORY[0x263F50078]];

    id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [(IRServicePackageAdapterAppleTVControl *)v2 setInternalPolicyInspections:v7];

    v8 = [[IRPolicyInspection alloc] initWithName:@"AppleTVControl"];
    v9 = [(IRServicePackageAdapterAppleTVControl *)v2 internalPolicyInspections];
    [v9 setObject:v8 forKeyedSubscript:v6];
  }
  return v2;
}

- (NSDictionary)contexts
{
  v2 = [(IRServicePackageAdapterAppleTVControl *)self internalContexts];
  id v3 = (void *)[v2 copy];

  return (NSDictionary *)v3;
}

- (NSDictionary)policyInspections
{
  v2 = [(IRServicePackageAdapterAppleTVControl *)self internalPolicyInspections];
  id v3 = (void *)[v2 copy];

  return (NSDictionary *)v3;
}

- (BOOL)generateClassificationsWithCandiatesContainer:(id)a3 systemState:(id)a4 historyEventsContainer:(id)a5 miloPrediction:(id)a6 nearbyDeviceContainer:(id)a7 fillInspection:(BOOL)a8 date:(id)a9
{
  BOOL v39 = a8;
  id v14 = a4;
  id v15 = a9;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a3;
  v20 = [(IRServicePackageAdapterAppleTVControl *)self _rules];
  v21 = +[IRRuleEngine executeRules:v20 withCandiatesContainer:v19 systemStatus:v14 historyEventsContainer:v18 miloPrediction:v17 nearbyDeviceContainer:v16 date:v15];

  BOOL v38 = [(IRServicePackageAdapterAppleTVControl *)self _outputRulesToContext:v21 candidatesContainer:v19 fillInspection:v39];
  v22 = objc_alloc_init(IRCandidateClassificationDetectorSameSpace);
  v23 = [v19 candidates];

  v24 = [v23 map:&__block_literal_global_17];

  v25 = [v18 historyEvents];

  v40 = v14;
  [(IRCandidateClassificationDetectorSameSpace *)v22 adjustSameSpaceParametersForCandidates:v24 withSystemState:v14 andHistoryEventsAsc:v25 andMiLoPrediction:v17 andNearbyDevicesContainer:v16 andDate:v15];

  v26 = [(IRServicePackageAdapterAppleTVControl *)self internalContexts];
  uint64_t v27 = *MEMORY[0x263F50078];
  v28 = [v26 objectForKeyedSubscript:*MEMORY[0x263F50078]];
  v29 = [v28 candidateResults];
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __179__IRServicePackageAdapterAppleTVControl_generateClassificationsWithCandiatesContainer_systemState_historyEventsContainer_miloPrediction_nearbyDeviceContainer_fillInspection_date___block_invoke_2;
  v41[3] = &unk_2653A0A50;
  id v42 = v24;
  id v30 = v24;
  [v29 enumerateObjectsUsingBlock:v41];

  uint64_t v31 = [v17 miLoServiceQuality];
  if (!+[IRMiLoProvider isQualityValid:v31])
  {
    v32 = [(IRServicePackageAdapterAppleTVControl *)self internalContexts];
    v33 = [v32 objectForKeyedSubscript:v27];
    [v33 updateIsBannerClassificationUnavailable:1];
  }
  v34 = [(IRServicePackageAdapterAppleTVControl *)self internalContexts];
  v35 = [v34 objectForKeyedSubscript:v27];
  v36 = [v40 appInFocusBundleID];
  [v35 updateBundleIdentifier:v36];

  return v38;
}

IRCandidateWrapper *__179__IRServicePackageAdapterAppleTVControl_generateClassificationsWithCandiatesContainer_systemState_historyEventsContainer_miloPrediction_nearbyDeviceContainer_fillInspection_date___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[IRCandidateWrapper alloc] initWithCandidate:v2];

  return v3;
}

void __179__IRServicePackageAdapterAppleTVControl_generateClassificationsWithCandiatesContainer_systemState_historyEventsContainer_miloPrediction_nearbyDeviceContainer_fillInspection_date___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __179__IRServicePackageAdapterAppleTVControl_generateClassificationsWithCandiatesContainer_systemState_historyEventsContainer_miloPrediction_nearbyDeviceContainer_fillInspection_date___block_invoke_3;
  v10[3] = &unk_26539FC18;
  id v5 = v3;
  id v11 = v5;
  uint64_t v6 = [v4 firstWhere:v10];
  if (([v6 sameSpaceBasedOnMiLo] & 1) != 0 || objc_msgSend(v6, "sameSpaceBasedOnUWB"))
  {
    [v5 setIsLockScreenControl:1];
    uint64_t v7 = [v5 classification];
    v8 = [v5 classificationDescription];
    v9 = [v8 stringByAppendingString:@"(Lock Screen Control)"];
    [v5 setClassification:v7 withDescription:v9];
  }
}

uint64_t __179__IRServicePackageAdapterAppleTVControl_generateClassificationsWithCandiatesContainer_systemState_historyEventsContainer_miloPrediction_nearbyDeviceContainer_fillInspection_date___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 candidate];
  id v4 = [v3 candidateIdentifier];
  id v5 = [*(id *)(a1 + 32) candidate];
  uint64_t v6 = [v5 candidateIdentifier];
  uint64_t v7 = [v4 isEqual:v6];

  return v7;
}

- (id)_rules
{
  v40[1] = *MEMORY[0x263EF8340];
  id v2 = objc_opt_new();
  id v3 = [[IRRuleCandidate alloc] initWithAttributeKey:@"kIRRuleCandidateActiveRouteKey" requireAllNodes:0];
  [v2 setObject:v3 forKeyedSubscript:@"AppleTVControl_Active_route"];

  id v4 = [[IRRuleCandidate alloc] initWithAttributeKey:@"kIRRuleCandidateProximityKey" requireAllNodes:0];
  [v2 setObject:v4 forKeyedSubscript:@"AppleTVControl_Proximity"];

  id v5 = objc_alloc_init(IRRuleHistoryPattern);
  uint64_t v6 = +[IREventDO atvUserInteractionEvents];
  [(IRRuleHistoryPattern *)v5 setEventsToWatch:v6];

  uint64_t v7 = (void *)MEMORY[0x263EFFA08];
  v40[0] = @"kIRRuleHistoryPatternFilterIsSameMilo";
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:1];
  v9 = [v7 setWithArray:v8];
  [(IRRuleHistoryPattern *)v5 setFilters:v9];

  v10 = +[IRPreferences shared];
  id v11 = [v10 appleTvCtrlRulesContinuityTimeIntervalInSeconds];
  [v11 doubleValue];
  -[IRRuleHistoryPattern setTimeInterval:](v5, "setTimeInterval:");

  [(IRRuleHistoryPattern *)v5 setMaxNumberOfEventsInHistory:1];
  [(IRRuleHistoryPattern *)v5 setMinNumberOfEventsInHistory:1];
  [(IRRuleHistoryPattern *)v5 setThreshold:1.0];
  [(IRRuleHistoryPattern *)v5 setCalculateScoreWithoutPortion:1];
  [v2 setObject:v5 forKeyedSubscript:@"AppleTVControl_Continuity"];
  v12 = objc_alloc_init(IRRuleHistoryPattern);

  v13 = +[IREventDO atvUserInteractionEvents];
  [(IRRuleHistoryPattern *)v12 setEventsToWatch:v13];

  id v14 = (void *)MEMORY[0x263EFFA08];
  BOOL v39 = @"kIRRuleHistoryPatternFilterIsSameMilo";
  id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v39 count:1];
  id v16 = [v14 setWithArray:v15];
  [(IRRuleHistoryPattern *)v12 setFilters:v16];

  [(IRRuleHistoryPattern *)v12 setTimeInterval:2419200.0];
  [(IRRuleHistoryPattern *)v12 setMaxNumberOfEventsInHistory:5];
  [(IRRuleHistoryPattern *)v12 setMinNumberOfEventsInHistory:2];
  [(IRRuleHistoryPattern *)v12 setThreshold:0.6];
  [v2 setObject:v12 forKeyedSubscript:@"AppleTVControl_Long_term_pattern"];
  id v17 = objc_alloc_init(IRRuleHistoryPattern);

  id v18 = +[IREventDO atvUserInteractionEvents];
  [(IRRuleHistoryPattern *)v17 setEventsToWatch:v18];

  id v19 = [MEMORY[0x263EFFA08] setWithArray:MEMORY[0x263EFFA68]];
  [(IRRuleHistoryPattern *)v17 setFilters:v19];

  [(IRRuleHistoryPattern *)v17 setTimeInterval:2419200.0];
  [(IRRuleHistoryPattern *)v17 setMaxNumberOfEventsInHistory:0x7FFFFFFFLL];
  [(IRRuleHistoryPattern *)v17 setMinNumberOfEventsInHistory:1];
  [(IRRuleHistoryPattern *)v17 setThreshold:1.0];
  [(IRRuleHistoryPattern *)v17 setCalculateScoreWithoutPortion:1];
  [v2 setObject:v17 forKeyedSubscript:@"AppleTVControl_Candidate_been_used"];
  v20 = objc_alloc_init(IRRuleHistoryPattern);

  v21 = +[IREventDO atvUserInteractionEvents];
  [(IRRuleHistoryPattern *)v20 setEventsToWatch:v21];

  v22 = (void *)MEMORY[0x263EFFA08];
  BOOL v38 = @"kIRRuleHistoryPatternFilterIsSameLoi";
  v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v38 count:1];
  v24 = [v22 setWithArray:v23];
  [(IRRuleHistoryPattern *)v20 setFilters:v24];

  [(IRRuleHistoryPattern *)v20 setTimeInterval:2419200.0];
  [(IRRuleHistoryPattern *)v20 setMaxNumberOfEventsInHistory:0x7FFFFFFFLL];
  [(IRRuleHistoryPattern *)v20 setMinNumberOfEventsInHistory:1];
  [(IRRuleHistoryPattern *)v20 setThreshold:2147483650.0];
  [v2 setObject:v20 forKeyedSubscript:@"AppleTVControl_Most_used_in_LOI"];
  v25 = objc_alloc_init(IRRuleHistoryPattern);

  v26 = (void *)MEMORY[0x263EFFA08];
  uint64_t v27 = +[IREventDO eventDOWithAppleTVControlType:5];
  v37 = v27;
  v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v37 count:1];
  v29 = [v26 setWithArray:v28];
  [(IRRuleHistoryPattern *)v25 setEventsToWatch:v29];

  id v30 = (void *)MEMORY[0x263EFFA08];
  v36 = @"kIRRuleHistoryPatternFilterIsSameDay";
  uint64_t v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v36 count:1];
  v32 = [v30 setWithArray:v31];
  [(IRRuleHistoryPattern *)v25 setFilters:v32];

  [(IRRuleHistoryPattern *)v25 setTimeInterval:86400.0];
  [(IRRuleHistoryPattern *)v25 setMaxNumberOfEventsInHistory:0x7FFFFFFFLL];
  [(IRRuleHistoryPattern *)v25 setMinNumberOfEventsInHistory:2];
  [(IRRuleHistoryPattern *)v25 setThreshold:2.0];
  [(IRRuleHistoryPattern *)v25 setCalculateScoreWithoutPortion:1];
  [v2 setObject:v25 forKeyedSubscript:@"AppleTVControl_Candidate_was_rejected_in_last_day"];
  v33 = [[IRRuleCandidate alloc] initWithAttributeKey:@"kIRRuleCandidateAppleTVControlUserRejectedInLastDayWithoutPickerChoiceKey" requireAllNodes:0];
  [v2 setObject:v33 forKeyedSubscript:@"AppleTVControl_Candidate_was_rejected_in_last_day_no_picker"];

  v34 = (void *)[v2 copy];

  return v34;
}

- (BOOL)_outputRulesToContext:(id)a3 candidatesContainer:(id)a4 fillInspection:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[IRContextWrapper alloc] initWithName:@"AppleTVControl" defaultClassification:0];
  id v11 = [v8 candidates];

  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __98__IRServicePackageAdapterAppleTVControl__outputRulesToContext_candidatesContainer_fillInspection___block_invoke;
  v24[3] = &unk_2653A0718;
  v12 = v10;
  v25 = v12;
  [v11 enumerateObjectsUsingBlock:v24];

  [(IRServicePackageAdapterAppleTVControl *)self _evaluateOutputRules:v9 contextWrapper:v12];
  [(IRServicePackageAdapterAppleTVControl *)self _classifyContext:v12];
  v13 = [(IRContextWrapper *)v12 context];
  id v14 = [v13 candidateResults];
  id v15 = [(IRServicePackageAdapterAppleTVControl *)self internalContexts];
  uint64_t v16 = *MEMORY[0x263F50078];
  id v17 = [v15 objectForKeyedSubscript:*MEMORY[0x263F50078]];
  id v18 = [v17 candidateResults];
  char v19 = [v14 isEqual:v18];

  v20 = [(IRServicePackageAdapterAppleTVControl *)self internalContexts];
  [v20 setObject:v13 forKeyedSubscript:v16];

  if (v5)
  {
    v21 = [(IRContextWrapper *)v12 policyInspection];
    v22 = [(IRServicePackageAdapterAppleTVControl *)self internalPolicyInspections];
    [v22 setObject:v21 forKeyedSubscript:v16];
  }
  return v19 ^ 1;
}

void __98__IRServicePackageAdapterAppleTVControl__outputRulesToContext_candidatesContainer_fillInspection___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = +[IRCandidateDO candidateFromCandidateDO:a2];
  [v2 addCandidate:v3 logOrderOfExecution:0];
}

- (void)_evaluateOutputRules:(id)a3 contextWrapper:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [a4 candidates];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __77__IRServicePackageAdapterAppleTVControl__evaluateOutputRules_contextWrapper___block_invoke;
  v8[3] = &unk_2653A0740;
  id v9 = v5;
  id v7 = v5;
  [v6 enumerateObjectsUsingBlock:v8];
}

void __77__IRServicePackageAdapterAppleTVControl__evaluateOutputRules_contextWrapper___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __77__IRServicePackageAdapterAppleTVControl__evaluateOutputRules_contextWrapper___block_invoke_2;
  v6[3] = &unk_2653A0A78;
  id v7 = v3;
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];
}

void __77__IRServicePackageAdapterAppleTVControl__evaluateOutputRules_contextWrapper___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v10 = [v4 candidateResult];
  id v7 = [v10 candidate];
  id v8 = [v7 candidateIdentifier];
  id v9 = [v5 evaluateRuleOutputWithCandidateIdentifier:v8];

  [v4 setEvaluation:v9 forRuleKey:v6];
}

- (void)_classifyContext:(id)a3
{
  id v4 = [a3 candidates];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __58__IRServicePackageAdapterAppleTVControl__classifyContext___block_invoke;
  v5[3] = &unk_2653A0740;
  v5[4] = self;
  [v4 enumerateObjectsUsingBlock:v5];
}

void __58__IRServicePackageAdapterAppleTVControl__classifyContext___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  id v3 = objc_msgSend(*(id *)(a1 + 32), "_autoRouteClassificationForCandidate:forClassificationEvaluated:");
  if ([v3 isValid])
  {
    id v4 = [v3 detailedDesc];
    [v13 setClassification:4 withDescription:v4];
    goto LABEL_13;
  }
  id v4 = [*(id *)(a1 + 32) _oneTapClassificationForCandidate:v13 forClassificationEvaluated:3];
  if (![v4 isValid])
  {
    id v5 = [*(id *)(a1 + 32) _filteredClassificationForCandidate:v13 forClassificationEvaluated:1];
    if ([v5 isValid])
    {
      id v6 = [v5 detailedDesc];
      id v7 = v13;
      uint64_t v8 = 1;
      id v9 = v6;
    }
    else
    {
      id v6 = [*(id *)(a1 + 32) _topOfListClassificationForCandidate:v13 forClassificationEvaluated:2];
      if ([(__CFString *)v6 isValid])
      {
        id v10 = [(__CFString *)v6 detailedDesc];
        id v11 = [*(id *)(a1 + 32) _reasonsForRejectingAutoRouteOrOneTapClassificationForCandidate:v13];
        v12 = [v10 stringByAppendingFormat:@":%@", v11];
        [v13 setClassification:2 withDescription:v12];

LABEL_11:
        goto LABEL_12;
      }
      id v9 = @"No classification rules were satisfied";
      id v7 = v13;
      uint64_t v8 = 0;
    }
    [v7 setClassification:v8 withDescription:v9];
    goto LABEL_11;
  }
  id v5 = [v4 detailedDesc];
  [v13 setClassification:3 withDescription:v5];
LABEL_12:

LABEL_13:
}

- (id)_reasonsForRejectingAutoRouteOrOneTapClassificationForCandidate:(id)a3
{
  id v3 = a3;
  id v4 = [v3 ruleInspections];
  id v5 = [v4 objectForKeyedSubscript:@"AppleTVControl_Candidate_was_rejected_in_last_day"];
  id v6 = [v5 evaluation];
  char v7 = [v6 BOOLean];

  if (v7)
  {
    uint64_t v8 = @"[Rejection]";
LABEL_5:
    id v13 = [&stru_27039A840 stringByAppendingString:v8];
    goto LABEL_7;
  }
  id v9 = [v3 ruleInspections];
  id v10 = [v9 objectForKeyedSubscript:@"AppleTVControl_Candidate_was_rejected_in_last_day_no_picker"];
  id v11 = [v10 evaluation];
  int v12 = [v11 BOOLean];

  if (v12)
  {
    uint64_t v8 = @"[Rejection No Picker]";
    goto LABEL_5;
  }
  id v13 = &stru_27039A840;
LABEL_7:

  return v13;
}

- (id)_autoRoutePositiveRulesClassificationForCandidate:(id)a3 forClassificationEvaluated:(int64_t)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(IRServicePackageAdapterClassification);
  [v5 logOrderOfExecution:a4 withRuleKey:@"AppleTVControl_Continuity" ruleType:@"Positive"];
  char v7 = [v5 ruleInspections];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"AppleTVControl_Continuity"];
  id v9 = [v8 evaluation];
  int v10 = [v9 hasBoolean];

  if (v10)
  {
    id v11 = [v5 ruleInspections];
    int v12 = v11;
    id v13 = @"AppleTVControl_Continuity";
  }
  else
  {
    [v5 logOrderOfExecution:a4 withRuleKey:@"AppleTVControl_Long_term_pattern" ruleType:@"Positive"];
    id v14 = [v5 ruleInspections];
    id v15 = [v14 objectForKeyedSubscript:@"AppleTVControl_Long_term_pattern"];
    uint64_t v16 = [v15 evaluation];
    int v17 = [v16 hasBoolean];

    if (!v17) {
      goto LABEL_6;
    }
    id v11 = [v5 ruleInspections];
    int v12 = v11;
    id v13 = @"AppleTVControl_Long_term_pattern";
  }
  id v18 = [v11 objectForKeyedSubscript:v13];
  char v19 = [v18 evaluation];
  -[IRServicePackageAdapterClassification setIsValid:](v6, "setIsValid:", [v19 BOOLean]);

  [(IRServicePackageAdapterClassification *)v6 setDetailedDesc:v13];
LABEL_6:

  return v6;
}

- (id)_topOfListClassificationPositiveRulesForCandidate:(id)a3 forClassificationEvaluated:(int64_t)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(IRServicePackageAdapterClassification);
  char v7 = [v5 ruleInspections];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"AppleTVControl_Active_route"];
  id v9 = [v8 evaluation];
  int v10 = objc_msgSend(v5, "logOrderOfExecution:withRuleKey:ruleType:andReturn:", a4, @"AppleTVControl_Active_route", @"Conditional", objc_msgSend(v9, "BOOLean"));

  if (v10)
  {
    [(IRServicePackageAdapterClassification *)v6 setIsValid:1];
    id v11 = @"AppleTVControl_Active_route";
  }
  else
  {
    [v5 logOrderOfExecution:a4 withRuleKey:@"AppleTVControl_Proximity" ruleType:@"Positive"];
    int v12 = [v5 ruleInspections];
    id v13 = [v12 objectForKeyedSubscript:@"AppleTVControl_Proximity"];
    id v14 = [v13 evaluation];
    int v15 = [v14 hasBoolean];

    if (v15)
    {
      uint64_t v16 = [v5 ruleInspections];
      int v17 = v16;
      id v11 = @"AppleTVControl_Proximity";
    }
    else
    {
      [v5 logOrderOfExecution:a4 withRuleKey:@"AppleTVControl_Most_used_in_LOI" ruleType:@"Positive"];
      id v18 = [v5 ruleInspections];
      char v19 = [v18 objectForKeyedSubscript:@"AppleTVControl_Most_used_in_LOI"];
      v20 = [v19 evaluation];
      int v21 = [v20 hasBoolean];

      if (!v21) {
        goto LABEL_9;
      }
      uint64_t v16 = [v5 ruleInspections];
      int v17 = v16;
      id v11 = @"AppleTVControl_Most_used_in_LOI";
    }
    v22 = [v16 objectForKeyedSubscript:v11];
    v23 = [v22 evaluation];
    -[IRServicePackageAdapterClassification setIsValid:](v6, "setIsValid:", [v23 BOOLean]);
  }
  [(IRServicePackageAdapterClassification *)v6 setDetailedDesc:v11];
LABEL_9:

  return v6;
}

- (id)_autoRouteClassificationForCandidate:(id)a3 forClassificationEvaluated:(int64_t)a4
{
  id v6 = a3;
  char v7 = objc_alloc_init(IRServicePackageAdapterClassification);
  [v6 logOrderOfExecution:a4 withRuleKey:@"AppleTVControl_Candidate_was_rejected_in_last_day" ruleType:@"Negative"];
  uint64_t v8 = [v6 ruleInspections];
  id v9 = [v8 objectForKeyedSubscript:@"AppleTVControl_Candidate_was_rejected_in_last_day"];
  int v10 = [v9 evaluation];
  int v11 = [v10 BOOLean];

  if (v11) {
    goto LABEL_3;
  }
  [v6 logOrderOfExecution:a4 withRuleKey:@"AppleTVControl_Candidate_was_rejected_in_last_day_no_picker" ruleType:@"Negative"];
  int v12 = [v6 ruleInspections];
  id v13 = [v12 objectForKeyedSubscript:@"AppleTVControl_Candidate_was_rejected_in_last_day_no_picker"];
  id v14 = [v13 evaluation];
  int v15 = [v14 BOOLean];

  if (v15)
  {
LABEL_3:
    uint64_t v16 = v7;
  }
  else
  {
    uint64_t v16 = [(IRServicePackageAdapterAppleTVControl *)self _autoRoutePositiveRulesClassificationForCandidate:v6 forClassificationEvaluated:a4];
  }
  int v17 = v16;

  return v17;
}

- (id)_oneTapClassificationForCandidate:(id)a3 forClassificationEvaluated:(int64_t)a4
{
  id v4 = objc_alloc_init(IRServicePackageAdapterClassification);

  return v4;
}

- (id)_topOfListClassificationForCandidate:(id)a3 forClassificationEvaluated:(int64_t)a4
{
  id v6 = a3;
  char v7 = objc_alloc_init(IRServicePackageAdapterClassification);
  uint64_t v8 = [(IRServicePackageAdapterAppleTVControl *)self _autoRoutePositiveRulesClassificationForCandidate:v6 forClassificationEvaluated:a4];

  if ([v8 isValid] || objc_msgSend(v8, "isValid"))
  {
    id v9 = v8;
  }
  else
  {
    id v9 = [(IRServicePackageAdapterAppleTVControl *)self _topOfListClassificationPositiveRulesForCandidate:v6 forClassificationEvaluated:a4];
  }
  int v10 = v9;

  return v10;
}

- (id)_filteredClassificationForCandidate:(id)a3 forClassificationEvaluated:(int64_t)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(IRServicePackageAdapterClassification);
  char v7 = [v5 ruleInspections];
  uint64_t v8 = @"AppleTVControl_Candidate_been_used";
  id v9 = [v7 objectForKeyedSubscript:@"AppleTVControl_Candidate_been_used"];
  int v10 = [v9 evaluation];
  LOBYTE(a4) = objc_msgSend(v5, "logOrderOfExecution:withRuleKey:ruleType:andReturn:", a4, @"AppleTVControl_Candidate_been_used", @"Conditional", objc_msgSend(v10, "BOOLean"));

  if ((a4 & 1) == 0)
  {
    [(IRServicePackageAdapterClassification *)v6 setIsValid:1];
    uint64_t v8 = @"Candidate was never used";
  }
  [(IRServicePackageAdapterClassification *)v6 setDetailedDesc:v8];

  return v6;
}

- (BOOL)shouldRejectEvent:(id)a3 withHistoryEventsContainer:(id)a4 withSystemState:(id)a5 forCandidate:(id)a6 date:(id)a7
{
  id v8 = a3;
  id v9 = a4;
  int v10 = +[IREventDO eventDOWithAppleTVControlType:3];
  int v11 = [v9 historyEvents];
  if ([v11 count] && objc_msgSend(v8, "isEqual:", v10))
  {
    int v12 = [v9 historyEvents];
    id v13 = [v12 lastObject];
    id v14 = [v13 event];
    char v15 = [v14 isEqual:v10];
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (id)filterHistory:(id)a3 withCandidatesContainer:(id)a4
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263EFF980];
  id v43 = v4;
  id v6 = [v4 historyEvents];
  char v7 = [v5 arrayWithArray:v6];

  id v8 = +[IREventDO atvUserInteractionEvents];
  v45 = [v8 compactMap:&__block_literal_global_97];

  v44 = objc_opt_new();
  if ([v7 count])
  {
    unint64_t v9 = 0;
    uint64_t v10 = 1;
    do
    {
      int v11 = NSNumber;
      int v12 = [v7 objectAtIndexedSubscript:v9];
      id v13 = [v12 event];
      id v14 = objc_msgSend(v11, "numberWithLongLong:", objc_msgSend(v13, "eventType"));
      int v15 = [v45 containsObject:v14];

      if (v15)
      {
        unint64_t v16 = v10;
        while (v16 < [v7 count])
        {
          int v17 = [v7 objectAtIndexedSubscript:v16];
          id v18 = [v17 date];
          char v19 = [v7 objectAtIndexedSubscript:v9];
          v20 = [v19 date];
          [v18 timeIntervalSinceDate:v20];
          double v22 = v21;
          v23 = +[IRPreferences shared];
          v24 = [v23 appleTvCtrlEventsTimeIntervalThreshold];
          [v24 doubleValue];
          double v26 = v25;

          if (v22 >= v26) {
            break;
          }
          uint64_t v27 = NSNumber;
          v28 = [v7 objectAtIndexedSubscript:v16];
          v29 = [v28 event];
          id v30 = objc_msgSend(v27, "numberWithLongLong:", objc_msgSend(v29, "eventType"));
          int v31 = [v45 containsObject:v30];

          ++v16;
          if (v31)
          {
            [v44 addIndex:v9];
            break;
          }
        }
      }
      ++v9;
      ++v10;
    }
    while (v9 < [v7 count]);
  }
  [v7 removeObjectsAtIndexes:v44];
  v32 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  v33 = (void *)*MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
  {
    v34 = NSNumber;
    v35 = v33;
    v36 = [v43 historyEvents];
    v37 = objc_msgSend(v34, "numberWithUnsignedInteger:", objc_msgSend(v36, "count"));
    BOOL v38 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
    *(_DWORD *)buf = 136315906;
    v47 = "#service-package-adapter-apple-tv-control, ";
    __int16 v48 = 2112;
    v49 = v32;
    __int16 v50 = 2112;
    v51 = v37;
    __int16 v52 = 2112;
    v53 = v38;
    _os_log_impl(&dword_25418E000, v35, OS_LOG_TYPE_INFO, "%s[%@], Number of history events before filtering = %@, after filtering = %@", buf, 0x2Au);
  }
  BOOL v39 = [IRHistoryEventsContainerDO alloc];
  v40 = (void *)[v7 copy];
  v41 = [(IRHistoryEventsContainerDO *)v39 initWithHistoryEvents:v40];

  return v41;
}

uint64_t __79__IRServicePackageAdapterAppleTVControl_filterHistory_withCandidatesContainer___block_invoke(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 eventType];

  return [v2 numberWithLongLong:v3];
}

- (BOOL)shouldAskForLowLatencyMiLo:(id)a3 historyEventsAsc:(id)a4
{
  id v5 = (void *)MEMORY[0x263EFF9C0];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 set];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __85__IRServicePackageAdapterAppleTVControl_shouldAskForLowLatencyMiLo_historyEventsAsc___block_invoke;
  v16[3] = &unk_26539F7A0;
  id v9 = v8;
  id v17 = v9;
  [v6 enumerateObjectsWithOptions:2 usingBlock:v16];

  uint64_t v10 = [v7 candidates];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __85__IRServicePackageAdapterAppleTVControl_shouldAskForLowLatencyMiLo_historyEventsAsc___block_invoke_2;
  v14[3] = &unk_26539F7C8;
  id v15 = v9;
  id v11 = v9;
  int v12 = [v10 firstWhere:v14];
  LOBYTE(v9) = v12 != 0;

  return (char)v9;
}

void __85__IRServicePackageAdapterAppleTVControl_shouldAskForLowLatencyMiLo_historyEventsAsc___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v18 = a2;
  id v6 = [MEMORY[0x263EFF910] now];
  id v7 = [v18 date];
  [v6 timeIntervalSinceDate:v7];
  double v9 = v8;
  uint64_t v10 = +[IRPreferences shared];
  id v11 = [v10 candidateLastUsedThrForMiLoLowLatancyPowerOpt];
  [v11 doubleValue];
  double v13 = v12;

  if (v9 >= v13)
  {
    *a4 = 1;
  }
  else
  {
    id v14 = [v18 systemState];
    if ([v14 isMiLoSupportedLocation])
    {
      id v15 = [v18 candidateIdentifier];

      unint64_t v16 = v18;
      if (!v15) {
        goto LABEL_8;
      }
      id v17 = *(void **)(a1 + 32);
      id v14 = [v18 candidateIdentifier];
      [v17 addObject:v14];
    }
  }
  unint64_t v16 = v18;
LABEL_8:
}

uint64_t __85__IRServicePackageAdapterAppleTVControl_shouldAskForLowLatencyMiLo_historyEventsAsc___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 candidateIdentifier];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (BOOL)shouldConsiderEventForSignificantBundles:(id)a3
{
  return 0;
}

- (id)getSignificantBundlesWithCandidates:(id)a3 fromHistory:(id)a4
{
  uint64_t v4 = objc_opt_new();

  return v4;
}

- (NSMutableDictionary)internalContexts
{
  return self->_internalContexts;
}

- (void)setInternalContexts:(id)a3
{
}

- (NSMutableDictionary)internalPolicyInspections
{
  return self->_internalPolicyInspections;
}

- (void)setInternalPolicyInspections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalPolicyInspections, 0);

  objc_storeStrong((id *)&self->_internalContexts, 0);
}

- (id)uiAnalyticsWithEvent:(id)a3 forCandidateIdentifier:(id)a4 systemStateManager:(id)a5 candidatesContainer:(id)a6 inspections:(id)a7 statisticsManager:(id)a8 service:(id)a9 historyEventsContainer:(id)a10
{
  v123[21] = *MEMORY[0x263EF8340];
  id v81 = a3;
  id v15 = a4;
  id v85 = a5;
  id v84 = a6;
  id v16 = a7;
  id v82 = a8;
  id v83 = a9;
  id v61 = a10;
  v60 = v16;
  v80 = [v16 objectForKeyedSubscript:*MEMORY[0x263F50078]];
  id v17 = [v83 clientIdentifier];
  if (v17)
  {
    v78 = [v83 clientIdentifier];
  }
  else
  {
    v78 = &stru_27039A840;
  }

  [v81 eventType];
  v79 = IRAppleTVControlEventTypeToString();
  id v18 = [v85 miloProviderLslPredictionResults];
  uint64_t v19 = [v18 canUse];

  v20 = [v85 miloProviderLslPredictionResults];
  uint64_t v73 = [v20 confidence];

  double v21 = [v85 miloProviderLslPredictionResults];
  uint64_t v71 = [v21 confidenceReasonBitmap];

  double v22 = [v85 miloProviderLslPredictionResults];
  v23 = [v22 scores];
  uint64_t v69 = [v23 count];

  v24 = [v85 miloProviderLslPredictionResults];
  id v64 = (id)[v24 miLoServiceQuality];

  double v25 = [v85 miloProviderLslPredictionResults];
  uint64_t v63 = [v25 miLoServiceQualityReasonBitmap];

  double v26 = [v85 miloProviderLslPredictionResults];
  uint64_t v27 = [v26 predictionTime];
  [v27 timeIntervalSinceNow];
  double v29 = v28;

  id v30 = [v84 candidates];
  uint64_t v62 = [v30 count];

  uint64_t v118 = 0;
  v119 = &v118;
  uint64_t v120 = 0x2020000000;
  uint64_t v121 = 0;
  uint64_t v114 = 0;
  v115 = &v114;
  uint64_t v116 = 0x2020000000;
  uint64_t v117 = 0;
  uint64_t v110 = 0;
  v111 = &v110;
  uint64_t v112 = 0x2020000000;
  uint64_t v113 = 0;
  uint64_t v106 = 0;
  v107 = &v106;
  uint64_t v108 = 0x2020000000;
  uint64_t v109 = 0;
  uint64_t v100 = 0;
  v101 = &v100;
  uint64_t v102 = 0x3032000000;
  v103 = __Block_byref_object_copy__9;
  v104 = __Block_byref_object_dispose__9;
  v105 = &stru_27039A840;
  uint64_t v94 = 0;
  v95 = &v94;
  uint64_t v96 = 0x3032000000;
  v97 = __Block_byref_object_copy__9;
  v98 = __Block_byref_object_dispose__9;
  v99 = &stru_27039A840;
  uint64_t v31 = [v80 candidates];
  v86[0] = MEMORY[0x263EF8330];
  v86[1] = 3221225472;
  v86[2] = __198__IRServicePackageAdapterAppleTVControl_IRAnalytics__uiAnalyticsWithEvent_forCandidateIdentifier_systemStateManager_candidatesContainer_inspections_statisticsManager_service_historyEventsContainer___block_invoke;
  v86[3] = &unk_2653A0BA8;
  v88 = &v118;
  v89 = &v114;
  v90 = &v110;
  v91 = &v106;
  id v77 = v15;
  id v87 = v77;
  v92 = &v100;
  v93 = &v94;
  [(id)v31 enumerateObjectsUsingBlock:v86];

  v66 = [v84 candidateForCandidateIdentifier:v77];
  v32 = [v66 nodes];
  LOBYTE(v31) = (unint64_t)[v32 count] > 1;

  if (v31)
  {
    v33 = @"Group";
  }
  else
  {
    v34 = [v66 nodes];
    v35 = [v34 allObjects];
    v36 = [v35 firstObject];
    v37 = [v36 avOutputDevice];

    if (v37)
    {
      BOOL v38 = [v66 nodes];
      BOOL v39 = [v38 allObjects];
      v40 = [v39 firstObject];
      v41 = [v40 avOutputDevice];
      v68 = IRAVOutputDeviceTypeToString([v41 deviceType]);

      goto LABEL_10;
    }
    v33 = &stru_27039A840;
  }
  v68 = v33;
LABEL_10:
  id v42 = [v82 timeToBannerInMilliSeconds];
  if (v42)
  {
    id v43 = [v82 timeToBannerInMilliSeconds];
    uint64_t v58 = [v43 unsignedIntegerValue];
  }
  else
  {
    uint64_t v58 = 0;
  }

  v44 = +[IRPreferences shared];
  uint64_t v45 = [v44 mobileAssetVersion];

  if (v45) {
    v46 = (__CFString *)v45;
  }
  else {
    v46 = &stru_27039A840;
  }
  v67 = v46;
  v122[0] = @"UI_Event_Client_Identifier";
  v122[1] = @"UI_Event_Type";
  v123[0] = v78;
  v123[1] = v79;
  v122[2] = @"UI_Event_Count";
  v76 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 1, v58);
  v123[2] = v76;
  v122[3] = @"UI_Event_MiLo_Available";
  v75 = [NSNumber numberWithBool:v19];
  v123[3] = v75;
  v122[4] = @"UI_Event_MiLo_Confidence";
  v74 = [NSNumber numberWithUnsignedInteger:v73];
  v123[4] = v74;
  v122[5] = @"UI_Event_Milo_Confidence_Reason";
  v72 = [NSNumber numberWithUnsignedInteger:v71];
  v123[5] = v72;
  v122[6] = @"UI_Event_Milo_N_LSL_Items";
  v70 = [NSNumber numberWithUnsignedInteger:v69];
  v123[6] = v70;
  v122[7] = @"UI_Event_Milo_Quality";
  v47 = [NSNumber numberWithUnsignedInteger:v64];
  v123[7] = v47;
  v122[8] = @"UI_Event_Milo_Quality_Reason";
  __int16 v48 = [NSNumber numberWithUnsignedInteger:v63];
  v123[8] = v48;
  v122[9] = @"UI_Event_Milo_Time_Since_Prediction";
  v49 = [NSNumber numberWithUnsignedInteger:(unint64_t)fabs(v29)];
  v123[9] = v49;
  v122[10] = @"UI_Event_N_MiLo_Models";
  __int16 v50 = [NSNumber numberWithUnsignedInteger:0];
  v123[10] = v50;
  v122[11] = @"UI_Event_N_Candidates";
  v51 = [NSNumber numberWithUnsignedInteger:v62];
  v123[11] = v51;
  v122[12] = @"UI_Event_N_Candidates_Classified_AutoRoute";
  __int16 v52 = [NSNumber numberWithUnsignedInteger:v119[3]];
  v123[12] = v52;
  v122[13] = @"UI_Event_N_Candidates_Classified_OneTap";
  v53 = [NSNumber numberWithUnsignedInteger:v115[3]];
  v123[13] = v53;
  v122[14] = @"UI_Event_N_Candidates_Classified_TopOfList";
  uint64_t v54 = [NSNumber numberWithUnsignedInteger:v111[3]];
  v123[14] = v54;
  v122[15] = @"UI_Event_N_Candidates_Classified_Filter";
  v55 = [NSNumber numberWithUnsignedInteger:v107[3]];
  v123[15] = v55;
  v122[16] = @"UI_Event_Selected_Candidate_Classification";
  v123[16] = v101[5];
  v122[17] = @"UI_Event_Selected_Candidate_Rule_Reason";
  v123[17] = v95[5];
  v123[18] = v68;
  v122[18] = @"UI_Event_Selected_Candidate_Type";
  v122[19] = @"UI_Event_Time_To_Banner_Milli_Seconds";
  v56 = [NSNumber numberWithUnsignedInteger:v59];
  v122[20] = @"UI_Event_Mobile_Asset_Version";
  v123[19] = v56;
  v123[20] = v67;
  id v65 = [NSDictionary dictionaryWithObjects:v123 forKeys:v122 count:21];

  _Block_object_dispose(&v94, 8);
  _Block_object_dispose(&v100, 8);

  _Block_object_dispose(&v106, 8);
  _Block_object_dispose(&v110, 8);
  _Block_object_dispose(&v114, 8);
  _Block_object_dispose(&v118, 8);

  return v65;
}

void __198__IRServicePackageAdapterAppleTVControl_IRAnalytics__uiAnalyticsWithEvent_forCandidateIdentifier_systemStateManager_candidatesContainer_inspections_statisticsManager_service_historyEventsContainer___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = [a2 inspectionServicePackage];
  if (!v3) {
    goto LABEL_14;
  }
  id v15 = v3;
  if ([v3 classification] == 4)
  {
    uint64_t v4 = a1[5];
LABEL_10:
    ++*(void *)(*(void *)(v4 + 8) + 24);
    goto LABEL_11;
  }
  if ([v15 classification] == 3)
  {
    uint64_t v4 = a1[6];
    goto LABEL_10;
  }
  if ([v15 classification] == 2)
  {
    uint64_t v4 = a1[7];
    goto LABEL_10;
  }
  if ([v15 classification] == 1)
  {
    uint64_t v4 = a1[8];
    goto LABEL_10;
  }
LABEL_11:
  id v5 = (void *)a1[4];
  id v6 = [v15 candidate];
  id v7 = [v6 candidateIdentifier];
  LODWORD(v5) = [v5 isEqual:v7];

  uint64_t v3 = v15;
  if (v5)
  {
    [v15 classification];
    uint64_t v8 = IRCandidateClassificationToString();
    uint64_t v9 = *(void *)(a1[9] + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    uint64_t v11 = [v15 classificationDescription];
    uint64_t v12 = *(void *)(a1[10] + 8);
    double v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    uint64_t v3 = v15;
    uint64_t v14 = *(void *)(a1[10] + 8);
    if (!*(void *)(v14 + 40))
    {
      *(void *)(v14 + 40) = &stru_27039A840;

      uint64_t v3 = v15;
    }
  }
LABEL_14:
}

@end