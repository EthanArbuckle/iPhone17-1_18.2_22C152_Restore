@interface IRCandidateSelector
+ (BOOL)_isPickerChoiceOverrideActiveAtDate:(id)a3 withSystemState:(id)a4;
- (BOOL)candidateSelectorReasonBrokeredMainDeviceFirstUse;
- (BOOL)candidateSelectorReasonMostlyUsedAnyApp;
- (BOOL)candidateSelectorReasonMostlyUsedSimilarApp;
- (BOOL)candidateSelectorReasonProximity;
- (BOOL)candidateSelectorReasonProximityWithHistoryOrSameICloud;
- (BOOL)candidateSelectorReasonRecentlyUsed;
- (BOOL)candidateSelectorReasonSingle;
- (id)_candidatesToSelectFrom:(id)a3;
- (id)_nearestRangeCandidateFromCandidates:(id)a3;
- (id)_selectBasedOnContinuityFromCandidates:(id)a3 withSystemState:(id)a4 andHistoryEventsAsc:(id)a5 andDate:(id)a6;
- (id)_selectBasedOnMostRecentMainBrokeredDeviceFromCandidates:(id)a3 withSystemState:(id)a4 andHistoryEventsAsc:(id)a5 andDate:(id)a6;
- (id)_selectBasedOnMostUsedAnyAppFromCandidates:(id)a3 withSystemState:(id)a4 andHistoryEventsAsc:(id)a5 andDate:(id)a6;
- (id)_selectBasedOnMostUsedSimilarAppFromCandidates:(id)a3 withSystemState:(id)a4 andHistoryEventsAsc:(id)a5 andDate:(id)a6;
- (id)_selectBasedOnNearestRangeFromCandidates:(id)a3;
- (id)_selectBasedOnNearestRangeWithHistoryOrSameICloudFromCandidates:(id)a3 withSystemState:(id)a4;
- (id)_selectFromCandidates:(id)a3 withSystemState:(id)a4 andHistoryEventsAsc:(id)a5 andDate:(id)a6 andRule:(id)a7;
- (id)adjustClassificationForCandidateBasedOnNegativeInputs:(id)a3 withSystemState:(id)a4 andHistoryEventsAsc:(id)a5 andMiloPrediction:(id)a6 andDate:(id)a7;
- (id)getSelectorReasons;
- (id)selectFromCandidates:(id)a3 withSystemState:(id)a4 andHistoryEventsAsc:(id)a5 andDate:(id)a6;
- (void)setCandidateSelectorReasonBrokeredMainDeviceFirstUse:(BOOL)a3;
- (void)setCandidateSelectorReasonMostlyUsedAnyApp:(BOOL)a3;
- (void)setCandidateSelectorReasonMostlyUsedSimilarApp:(BOOL)a3;
- (void)setCandidateSelectorReasonProximity:(BOOL)a3;
- (void)setCandidateSelectorReasonProximityWithHistoryOrSameICloud:(BOOL)a3;
- (void)setCandidateSelectorReasonRecentlyUsed:(BOOL)a3;
- (void)setCandidateSelectorReasonSingle:(BOOL)a3;
@end

@implementation IRCandidateSelector

- (id)selectFromCandidates:(id)a3 withSystemState:(id)a4 andHistoryEventsAsc:(id)a5 andDate:(id)a6
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(IRCandidateSelector *)self _candidatesToSelectFrom:v10];
  if ((unint64_t)[v14 count] > 1)
  {
    v16 = [(IRCandidateSelector *)self _selectBasedOnContinuityFromCandidates:v14 withSystemState:v11 andHistoryEventsAsc:v12 andDate:v13];
    if (v16)
    {
      v15 = v16;
      [v16 setNominatedClassificationDesc:@"{Continuity}"];
      [(IRCandidateSelector *)self setCandidateSelectorReasonRecentlyUsed:1];
    }
    else
    {
      v17 = [(IRCandidateSelector *)self _selectBasedOnMostUsedSimilarAppFromCandidates:v14 withSystemState:v11 andHistoryEventsAsc:v12 andDate:v13];
      if (v17)
      {
        v15 = v17;
        [v17 setNominatedClassificationDesc:@"{Most used similar app}"];
        [(IRCandidateSelector *)self setCandidateSelectorReasonMostlyUsedSimilarApp:1];
      }
      else
      {
        v18 = [(IRCandidateSelector *)self _selectBasedOnMostUsedAnyAppFromCandidates:v14 withSystemState:v11 andHistoryEventsAsc:v12 andDate:v13];
        if (v18)
        {
          v15 = v18;
          [v18 setNominatedClassificationDesc:@"{Most used any app}"];
          [(IRCandidateSelector *)self setCandidateSelectorReasonMostlyUsedAnyApp:1];
        }
        else
        {
          v19 = [(IRCandidateSelector *)self _selectBasedOnNearestRangeWithHistoryOrSameICloudFromCandidates:v14 withSystemState:v11];
          if (v19)
          {
            v15 = v19;
            [v19 setNominatedClassificationDesc:@"{Nearest used or same iCloud}"];
            [(IRCandidateSelector *)self setCandidateSelectorReasonProximityWithHistoryOrSameICloud:1];
          }
          else
          {
            v20 = [(IRCandidateSelector *)self _selectBasedOnNearestRangeFromCandidates:v10];
            if (v20)
            {
              v15 = v20;
              [v20 setNominatedClassificationDesc:@"{Nearest}"];
              [(IRCandidateSelector *)self setCandidateSelectorReasonProximity:1];
            }
            else
            {
              v21 = [(IRCandidateSelector *)self _selectBasedOnMostRecentMainBrokeredDeviceFromCandidates:v14 withSystemState:v11 andHistoryEventsAsc:v12 andDate:v13];
              if (v21)
              {
                v15 = v21;
                [v21 setNominatedClassificationDesc:@"{Brokered Main Device First Use}"];
                [(IRCandidateSelector *)self setCandidateSelectorReasonBrokeredMainDeviceFirstUse:1];
              }
              else
              {
                v22 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
                v23 = *MEMORY[0x263F50090];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR))
                {
                  int v25 = 136315394;
                  v26 = "#tie-breaker, ";
                  __int16 v27 = 2112;
                  v28 = v22;
                  _os_log_impl(&dword_25418E000, v23, OS_LOG_TYPE_ERROR, "%s[%@], [ErrorId - Candidate selector error] selectFromCandidates should always select one candidate if we got here", (uint8_t *)&v25, 0x16u);
                }

                v15 = 0;
              }
            }
          }
        }
      }
    }
  }
  else
  {
    v15 = [v14 anyObject];
    [v15 setNominatedClassificationDesc:@"{Single}"];
    [(IRCandidateSelector *)self setCandidateSelectorReasonSingle:1];
  }

  return v15;
}

- (void)setCandidateSelectorReasonSingle:(BOOL)a3
{
  self->_candidateSelectorReasonSingle = a3;
}

- (id)_candidatesToSelectFrom:(id)a3
{
  return (id)[a3 allWhere:&__block_literal_global_156];
}

- (id)getSelectorReasons
{
  v13[7] = *MEMORY[0x263EF8340];
  v12[0] = @"candidateSelectorReasonRecentlyUsed";
  v3 = objc_msgSend(NSNumber, "numberWithBool:", -[IRCandidateSelector candidateSelectorReasonRecentlyUsed](self, "candidateSelectorReasonRecentlyUsed"));
  v13[0] = v3;
  v12[1] = @"candidateSelectorReasonMostlyUsedSimilarApp";
  v4 = objc_msgSend(NSNumber, "numberWithBool:", -[IRCandidateSelector candidateSelectorReasonMostlyUsedSimilarApp](self, "candidateSelectorReasonMostlyUsedSimilarApp"));
  v13[1] = v4;
  v12[2] = @"candidateSelectorReasonProximityWithHistoryOrSameICloud";
  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[IRCandidateSelector candidateSelectorReasonProximityWithHistoryOrSameICloud](self, "candidateSelectorReasonProximityWithHistoryOrSameICloud"));
  v13[2] = v5;
  v12[3] = @"candidateSelectorReasonProximity";
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[IRCandidateSelector candidateSelectorReasonProximity](self, "candidateSelectorReasonProximity"));
  v13[3] = v6;
  v12[4] = @"candidateSelectorReasonMostlyUsedAnyApp";
  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[IRCandidateSelector candidateSelectorReasonMostlyUsedAnyApp](self, "candidateSelectorReasonMostlyUsedAnyApp"));
  v13[4] = v7;
  v12[5] = @"candidateSelectorReasonBrokeredMainDeviceFirstUse";
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[IRCandidateSelector candidateSelectorReasonBrokeredMainDeviceFirstUse](self, "candidateSelectorReasonBrokeredMainDeviceFirstUse"));
  v13[5] = v8;
  v12[6] = @"candidateSelectorReasonSingle";
  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[IRCandidateSelector candidateSelectorReasonSingle](self, "candidateSelectorReasonSingle"));
  v13[6] = v9;
  id v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:7];

  return v10;
}

- (id)adjustClassificationForCandidateBasedOnNegativeInputs:(id)a3 withSystemState:(id)a4 andHistoryEventsAsc:(id)a5 andMiloPrediction:(id)a6 andDate:(id)a7
{
  v61[8] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a7;
  v14 = +[IRAirPlaySettings shared];
  char v15 = [v14 isAutoRoutingSettingEnabled];

  v16 = +[IRAirPlaySettings shared];
  char v17 = [v16 isRoutePredictionSettingEnabled];

  int v55 = [v11 isHeadphonesRoutedOrPredicted];
  if (v11) {
    int v56 = [v11 isInsideAppInFocusWindow] ^ 1;
  }
  else {
    int v56 = 0;
  }
  int v57 = [v12 isTemporarilyUnavailable];
  int v18 = [v11 appInFocusWindowScreenUnlockEvent];
  if ([v12 canUse]) {
    int v19 = [v12 isInMotion];
  }
  else {
    int v19 = 0;
  }
  v20 = [v10 candidate];
  int v21 = [v20 isBrokeredDevice];

  BOOL v58 = +[IRCandidateSelector _isPickerChoiceOverrideActiveAtDate:v13 withSystemState:v11];
  BOOL v59 = +[IRPlatformInfo isTVOS];
  v22 = (void *)MEMORY[0x263EFF9A0];
  v60[0] = @"kRuleIsMiLoTemporarilyUnavailable";
  v60[1] = @"kRuleIsAutoRoutingSettingDisabled";
  v61[0] = MEMORY[0x263EFFA80];
  v61[1] = MEMORY[0x263EFFA80];
  v60[2] = @"kRuleIsRoutePredictionSettingDisabled";
  v60[3] = @"kIsHeadsetConnected";
  v61[2] = MEMORY[0x263EFFA80];
  v61[3] = MEMORY[0x263EFFA80];
  v60[4] = @"kIsOutsideAppLaunchWindow";
  v60[5] = @"kIsAppInFocusWindowScreenLockToUnlock";
  v61[4] = MEMORY[0x263EFFA80];
  v61[5] = MEMORY[0x263EFFA80];
  v60[6] = @"kIsBrokeredDevice";
  v60[7] = @"kIsPickerChoiceOverrideActive";
  v61[6] = MEMORY[0x263EFFA80];
  v61[7] = MEMORY[0x263EFFA80];
  v23 = [NSDictionary dictionaryWithObjects:v61 forKeys:v60 count:8];
  v24 = [v22 dictionaryWithDictionary:v23];

  if (v15)
  {
    if (!v18) {
      goto LABEL_9;
    }
  }
  else
  {
    if ([v10 nominatedClassification] == 4) {
      [v10 setNominatedClassification:3];
    }
    int v25 = [v10 nominatedClassificationDesc];
    v26 = [v25 stringByAppendingString:@"[ARS Disabled]"];
    [v10 setNominatedClassificationDesc:v26];

    [v24 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"kRuleIsAutoRoutingSettingDisabled"];
    if (!v18)
    {
LABEL_9:
      if (!v19) {
        goto LABEL_10;
      }
      goto LABEL_18;
    }
  }
  if ([v10 nominatedClassification] == 4) {
    [v10 setNominatedClassification:3];
  }
  __int16 v27 = [v10 nominatedClassificationDesc];
  v28 = [v27 stringByAppendingString:@"[App Window Unlock To Lock]"];
  [v10 setNominatedClassificationDesc:v28];

  [v24 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"kIsAppInFocusWindowScreenLockToUnlock"];
  if (!v19)
  {
LABEL_10:
    if (!v21) {
      goto LABEL_31;
    }
LABEL_21:
    if ([v10 nominatedClassification] == 4) {
      [v10 setNominatedClassification:3];
    }
    v31 = [v10 nominatedClassificationDesc];
    v32 = [v31 stringByAppendingString:@"[Brokered Device]"];
    [v10 setNominatedClassificationDesc:v32];

    [v24 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"kIsBrokeredDevice"];
    if ([v10 sameSpaceBasedOnMiLo])
    {
      v33 = +[IRPreferences shared];
      v34 = [v33 candidateSelectorAllowSelectByMiLo];
      int v35 = [v34 BOOLValue];
    }
    else
    {
      int v35 = 0;
    }
    if ([v10 sameSpaceBasedOnPDRFence])
    {
      v36 = +[IRPreferences shared];
      v37 = [v36 candidateSelectorAllowSelectByPDRFence];
      int v38 = [v37 BOOLValue];

      if ((v38 | v35)) {
        goto LABEL_31;
      }
    }
    else if (v35)
    {
      goto LABEL_31;
    }
    [v10 setNominatedClassification:2];
    v39 = [v10 nominatedClassificationDesc];
    v40 = [v39 stringByAppendingString:@"[PDR Fence/MiLo Room Detection Disabled]"];
    [v10 setNominatedClassificationDesc:v40];

    goto LABEL_31;
  }
LABEL_18:
  if ([v10 nominatedClassification] == 4) {
    [v10 setNominatedClassification:3];
  }
  uint64_t v29 = [v10 nominatedClassificationDesc];
  v30 = [v29 stringByAppendingString:@"[MiLo In Motion]"];
  [v10 setNominatedClassificationDesc:v30];

  [v24 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"kIsMiLoInMotion"];
  if (v21) {
    goto LABEL_21;
  }
LABEL_31:
  if ((v17 & 1) == 0)
  {
    [v10 setNominatedClassification:2];
    [v10 setIsCallToAction:MEMORY[0x263EFFA80]];
    v41 = [v10 nominatedClassificationDesc];
    v42 = [v41 stringByAppendingString:@"[RPS Disabled]"];
    [v10 setNominatedClassificationDesc:v42];

    [v24 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"kRuleIsRoutePredictionSettingDisabled"];
  }
  if (v55)
  {
    [v10 setNominatedClassification:2];
    [v10 setIsCallToAction:MEMORY[0x263EFFA80]];
    v43 = [v10 nominatedClassificationDesc];
    v44 = [v43 stringByAppendingString:@"[Headset Or AirPods]"];
    [v10 setNominatedClassificationDesc:v44];

    [v24 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"kIsHeadsetConnected"];
  }
  if (v56)
  {
    [v10 setNominatedClassification:2];
    [v10 setIsCallToAction:MEMORY[0x263EFFA80]];
    v45 = [v10 nominatedClassificationDesc];
    v46 = [v45 stringByAppendingString:@"[Outside App Window]"];
    [v10 setNominatedClassificationDesc:v46];

    [v24 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"kIsOutsideAppLaunchWindow"];
  }
  if (v57)
  {
    [v10 setNominatedClassification:2];
    [v10 setIsCallToAction:MEMORY[0x263EFFA80]];
    v47 = [v10 nominatedClassificationDesc];
    v48 = [v47 stringByAppendingString:@"[MiLo Temporarily Unavailable]"];
    [v10 setNominatedClassificationDesc:v48];

    [v24 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"kRuleIsMiLoTemporarilyUnavailable"];
  }
  if (v58)
  {
    [v10 setNominatedClassification:2];
    [v10 setIsCallToAction:MEMORY[0x263EFFA80]];
    v49 = [v10 nominatedClassificationDesc];
    v50 = [v49 stringByAppendingString:@"[Picker Choice Override]"];
    [v10 setNominatedClassificationDesc:v50];

    [v24 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"kIsPickerChoiceOverrideActive"];
  }
  if (v59)
  {
    if ([v10 nominatedClassification] == 4) {
      [v10 setNominatedClassification:3];
    }
    v51 = [v10 nominatedClassificationDesc];
    v52 = [v51 stringByAppendingString:@"[TV OS]"];
    [v10 setNominatedClassificationDesc:v52];

    [v24 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"kIsTVOS"];
  }
  v53 = (void *)[v24 copy];

  return v53;
}

- (id)_selectBasedOnContinuityFromCandidates:(id)a3 withSystemState:(id)a4 andHistoryEventsAsc:(id)a5 andDate:(id)a6
{
  v26[2] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = +[IRPreferences shared];
  char v15 = [v14 candidateSelectorIsContinuityEnabled];
  int v16 = [v15 BOOLValue];

  if (v16)
  {
    char v17 = objc_alloc_init(IRRuleHistoryPattern);
    int v18 = +[IREventDO mediaUserInteractionEvents];
    [(IRRuleHistoryPattern *)v17 setEventsToWatch:v18];

    int v19 = (void *)MEMORY[0x263EFFA08];
    v26[0] = @"kIRRuleHistoryPatternFilterIsSimilarApp";
    v26[1] = @"kIRRuleHistoryPatternFilterOnlyTestedCandidates";
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
    int v21 = [v19 setWithArray:v20];
    [(IRRuleHistoryPattern *)v17 setFilters:v21];

    v22 = +[IRPreferences shared];
    v23 = [v22 mediaRulesContinuityTimeIntervalInSeconds];
    [v23 doubleValue];
    -[IRRuleHistoryPattern setTimeInterval:](v17, "setTimeInterval:");

    [(IRRuleHistoryPattern *)v17 setMaxNumberOfEventsInHistory:1];
    [(IRRuleHistoryPattern *)v17 setMinNumberOfEventsInHistory:1];
    [(IRRuleHistoryPattern *)v17 setThreshold:1.0];
    [(IRRuleHistoryPattern *)v17 setCalculateScoreWithoutPortion:1];
    v24 = [(IRCandidateSelector *)self _selectFromCandidates:v10 withSystemState:v11 andHistoryEventsAsc:v12 andDate:v13 andRule:v17];
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)_selectBasedOnMostUsedSimilarAppFromCandidates:(id)a3 withSystemState:(id)a4 andHistoryEventsAsc:(id)a5 andDate:(id)a6
{
  v28[2] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = +[IRPreferences shared];
  char v15 = [v14 candidateSelectorIsMostUsedSimilarAppEnabled];
  int v16 = [v15 BOOLValue];

  if (v16)
  {
    char v17 = objc_alloc_init(IRRuleHistoryPattern);
    int v18 = +[IREventDO mediaUserInteractionEvents];
    [(IRRuleHistoryPattern *)v17 setEventsToWatch:v18];

    int v19 = (void *)MEMORY[0x263EFFA08];
    v28[0] = @"kIRRuleHistoryPatternFilterIsSimilarApp";
    v28[1] = @"kIRRuleHistoryPatternFilterOnlyTestedCandidates";
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:2];
    int v21 = [v19 setWithArray:v20];
    [(IRRuleHistoryPattern *)v17 setFilters:v21];

    v22 = +[IRPreferences shared];
    v23 = [v22 candidateSelectorMostUsedSimilarAppTimeIntervalSeconds];
    [v23 doubleValue];
    -[IRRuleHistoryPattern setTimeInterval:](v17, "setTimeInterval:");

    v24 = +[IRPreferences shared];
    int v25 = [v24 candidateSelectorMostUsedSimilarAppMaximumNumberOfEvents];
    -[IRRuleHistoryPattern setMaxNumberOfEventsInHistory:](v17, "setMaxNumberOfEventsInHistory:", [v25 unsignedIntegerValue]);

    [(IRRuleHistoryPattern *)v17 setMinNumberOfEventsInHistory:1];
    [(IRRuleHistoryPattern *)v17 setThreshold:2147483650.0];
    [(IRRuleHistoryPattern *)v17 setCalculateScoreWithoutPortion:1];
    v26 = [(IRCandidateSelector *)self _selectFromCandidates:v10 withSystemState:v11 andHistoryEventsAsc:v12 andDate:v13 andRule:v17];
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (id)_selectBasedOnMostUsedAnyAppFromCandidates:(id)a3 withSystemState:(id)a4 andHistoryEventsAsc:(id)a5 andDate:(id)a6
{
  v28[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = +[IRPreferences shared];
  char v15 = [v14 candidateSelectorIsMostUsedAnyAppEnabled];
  int v16 = [v15 BOOLValue];

  if (v16)
  {
    char v17 = objc_alloc_init(IRRuleHistoryPattern);
    int v18 = +[IREventDO mediaUserInteractionEvents];
    [(IRRuleHistoryPattern *)v17 setEventsToWatch:v18];

    int v19 = (void *)MEMORY[0x263EFFA08];
    v28[0] = @"kIRRuleHistoryPatternFilterOnlyTestedCandidates";
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:1];
    int v21 = [v19 setWithArray:v20];
    [(IRRuleHistoryPattern *)v17 setFilters:v21];

    v22 = +[IRPreferences shared];
    v23 = [v22 candidateSelectorMostUsedAnyAppTimeIntervalSeconds];
    [v23 doubleValue];
    -[IRRuleHistoryPattern setTimeInterval:](v17, "setTimeInterval:");

    v24 = +[IRPreferences shared];
    int v25 = [v24 candidateSelectorMostUsedAnyAppMaximumNumberOfEvents];
    -[IRRuleHistoryPattern setMaxNumberOfEventsInHistory:](v17, "setMaxNumberOfEventsInHistory:", [v25 unsignedIntegerValue]);

    [(IRRuleHistoryPattern *)v17 setMinNumberOfEventsInHistory:1];
    [(IRRuleHistoryPattern *)v17 setThreshold:2147483650.0];
    [(IRRuleHistoryPattern *)v17 setCalculateScoreWithoutPortion:1];
    v26 = [(IRCandidateSelector *)self _selectFromCandidates:v10 withSystemState:v11 andHistoryEventsAsc:v12 andDate:v13 andRule:v17];
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (id)_selectBasedOnMostRecentMainBrokeredDeviceFromCandidates:(id)a3 withSystemState:(id)a4 andHistoryEventsAsc:(id)a5 andDate:(id)a6
{
  v29[1] = *MEMORY[0x263EF8340];
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_alloc_init(IRRuleHistoryPattern);
  v14 = (void *)MEMORY[0x263EFFA08];
  char v15 = +[IREventDO eventDOWithMediaType:9];
  v29[0] = v15;
  int v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:1];
  char v17 = [v14 setWithArray:v16];
  [(IRRuleHistoryPattern *)v13 setEventsToWatch:v17];

  int v18 = (void *)MEMORY[0x263EFFA08];
  v28 = @"kIRRuleHistoryPatternFilterOnlyTestedCandidates";
  int v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v28 count:1];
  v20 = [v18 setWithArray:v19];
  [(IRRuleHistoryPattern *)v13 setFilters:v20];

  int v21 = +[IRPreferences shared];
  v22 = [v21 candidateSelectorMostRecentBrokeredMainDeviceIntervalSeconds];
  [v22 doubleValue];
  -[IRRuleHistoryPattern setTimeInterval:](v13, "setTimeInterval:");

  v23 = +[IRPreferences shared];
  v24 = [v23 candidateSelectorMostRecentBrokeredDeviceMaximumNumberOfEvents];
  -[IRRuleHistoryPattern setMaxNumberOfEventsInHistory:](v13, "setMaxNumberOfEventsInHistory:", [v24 unsignedIntegerValue]);

  [(IRRuleHistoryPattern *)v13 setMinNumberOfEventsInHistory:1];
  [(IRRuleHistoryPattern *)v13 setThreshold:2147483650.0];
  [(IRRuleHistoryPattern *)v13 setCalculateScoreWithoutPortion:1];
  int v25 = [(IRCandidateSelector *)self _selectFromCandidates:v12 withSystemState:v11 andHistoryEventsAsc:v10 andDate:v9 andRule:v13];

  return v25;
}

- (id)_selectFromCandidates:(id)a3 withSystemState:(id)a4 andHistoryEventsAsc:(id)a5 andDate:(id)a6 andRule:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  int v16 = [v15 map:&__block_literal_global_5];
  char v17 = +[IRCandidatesContainerDO candidatesContainerDOWithCandidates:v16];

  int v18 = +[IRHistoryEventsContainerDO historyEventsContainerDOWithHistoryEvents:v13];

  int v19 = [[IRNearbyDeviceContainerDO alloc] initWithFreezeDateNIHomeDevice:0 nearbyDevices:0];
  v20 = [v11 executeRuleWithCandiatesContainer:v17 systemStatus:v14 historyContainer:v18 miloPrediction:0 nearbyDeviceContainer:v19 date:v12];

  int v21 = [v20 scoreForCandidates];
  v22 = [v21 allValues];
  v23 = [v22 valueForKeyPath:@"@max.self"];

  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  void v28[2] = __97__IRCandidateSelector__selectFromCandidates_withSystemState_andHistoryEventsAsc_andDate_andRule___block_invoke_2;
  void v28[3] = &unk_26539FBF0;
  id v29 = v20;
  id v30 = v23;
  id v24 = v23;
  id v25 = v20;
  v26 = [v15 firstWhere:v28];

  return v26;
}

uint64_t __97__IRCandidateSelector__selectFromCandidates_withSystemState_andHistoryEventsAsc_andDate_andRule___block_invoke(uint64_t a1, void *a2)
{
  return [a2 candidate];
}

uint64_t __97__IRCandidateSelector__selectFromCandidates_withSystemState_andHistoryEventsAsc_andDate_andRule___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 candidate];
  v4 = [v3 candidateIdentifier];
  v5 = [*(id *)(a1 + 32) scoreForCandidates];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __97__IRCandidateSelector__selectFromCandidates_withSystemState_andHistoryEventsAsc_andDate_andRule___block_invoke_3;
  v10[3] = &unk_26539FBC8;
  id v11 = *(id *)(a1 + 40);
  v6 = [v5 keysOfEntriesPassingTest:v10];
  v7 = [v6 anyObject];
  uint64_t v8 = [v4 isEqual:v7];

  return v8;
}

uint64_t __97__IRCandidateSelector__selectFromCandidates_withSystemState_andHistoryEventsAsc_andDate_andRule___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  [v4 doubleValue];
  if (v5 <= 0.0) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = [v4 isEqual:*(void *)(a1 + 32)];
  }

  return v6;
}

- (id)_selectBasedOnNearestRangeWithHistoryOrSameICloudFromCandidates:(id)a3 withSystemState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[IRPreferences shared];
  id v9 = [v8 candidateSelectorIsNearestRangeWithHistoryOrSameICloudEnabled];
  int v10 = [v9 BOOLValue];

  if (v10
    && (+[IRPreferences shared],
        id v11 = objc_claimAutoreleasedReturnValue(),
        [v11 candidateSelectorAllowSelectByUWB],
        id v12 = objc_claimAutoreleasedReturnValue(),
        int v13 = [v12 BOOLValue],
        v12,
        v11,
        v13))
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __103__IRCandidateSelector__selectBasedOnNearestRangeWithHistoryOrSameICloudFromCandidates_withSystemState___block_invoke;
    v17[3] = &unk_26539FC18;
    id v18 = v7;
    uint64_t v14 = [v6 allWhere:v17];

    id v15 = [(IRCandidateSelector *)self _nearestRangeCandidateFromCandidates:v14];

    id v6 = (id)v14;
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

BOOL __103__IRCandidateSelector__selectBasedOnNearestRangeWithHistoryOrSameICloudFromCandidates_withSystemState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 sameSpaceBasedOnUWB])
  {
    id v4 = [v3 candidate];
    if ([v4 isSameICloudWithSystemState:*(void *)(a1 + 32)])
    {
      BOOL v5 = 1;
    }
    else
    {
      id v6 = [v3 candidate];
      id v7 = [v6 lastUsedDate];
      BOOL v5 = v7 != 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)_selectBasedOnNearestRangeFromCandidates:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[IRPreferences shared];
  id v6 = [v5 candidateSelectorIsNearestRangeEnabled];
  int v7 = [v6 BOOLValue];

  if (v7
    && (+[IRPreferences shared],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v8 candidateSelectorAllowSelectByUWB],
        id v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v9 BOOLValue],
        v9,
        v8,
        v10))
  {
    uint64_t v11 = [v4 allWhere:&__block_literal_global_148];

    id v12 = [(IRCandidateSelector *)self _nearestRangeCandidateFromCandidates:v11];
    id v4 = (id)v11;
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

uint64_t __64__IRCandidateSelector__selectBasedOnNearestRangeFromCandidates___block_invoke(uint64_t a1, void *a2)
{
  return [a2 sameSpaceBasedOnUWB];
}

- (id)_nearestRangeCandidateFromCandidates:(id)a3
{
  id v3 = a3;
  id v4 = [v3 valueForKeyPath:@"@min.uwbRange"];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __60__IRCandidateSelector__nearestRangeCandidateFromCandidates___block_invoke;
  v11[3] = &unk_26539FC18;
  id v12 = v4;
  id v5 = v4;
  id v6 = [v3 allWhere:v11];

  int v7 = [v6 allObjects];
  uint64_t v8 = [v7 sortedArrayUsingComparator:&__block_literal_global_154];
  id v9 = [v8 firstObject];

  return v9;
}

uint64_t __60__IRCandidateSelector__nearestRangeCandidateFromCandidates___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uwbRange];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __60__IRCandidateSelector__nearestRangeCandidateFromCandidates___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 candidate];
  id v6 = [v5 nodes];
  unint64_t v7 = [v6 count];

  uint64_t v8 = [v4 candidate];

  id v9 = [v8 nodes];
  unint64_t v10 = [v9 count];

  if (v7 < v10) {
    return -1;
  }
  else {
    return v7 > v10;
  }
}

uint64_t __47__IRCandidateSelector__candidatesToSelectFrom___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 sameSpaceBasedOnMiLo])
  {
    id v3 = +[IRPreferences shared];
    id v4 = [v3 candidateSelectorAllowSelectByMiLo];
    int v5 = [v4 BOOLValue];
  }
  else
  {
    int v5 = 0;
  }
  if ([v2 sameSpaceBasedOnUWB])
  {
    id v6 = +[IRPreferences shared];
    unint64_t v7 = [v6 candidateSelectorAllowSelectByUWB];
    int v8 = [v7 BOOLValue];
  }
  else
  {
    int v8 = 0;
  }
  if ([v2 sameSpaceBasedOnBLE])
  {
    id v9 = +[IRPreferences shared];
    unint64_t v10 = [v9 candidateSelectorAllowSelectByBLE];
    int v11 = [v10 BOOLValue];
  }
  else
  {
    int v11 = 0;
  }
  if ([v2 sameSpaceBasedOnBrokeredLOI])
  {
    id v12 = +[IRPreferences shared];
    int v13 = [v12 candidateSelectorAllowSelectByLOI];
    int v14 = [v13 BOOLValue];
  }
  else
  {
    int v14 = 0;
  }
  if ([v2 sameSpaceBasedOnPDRFence])
  {
    id v15 = +[IRPreferences shared];
    int v16 = [v15 candidateSelectorAllowSelectByPDRFence];
    int v17 = [v16 BOOLValue];
  }
  else
  {
    int v17 = 0;
  }
  if ([v2 sameSpaceBasedOnHistory])
  {
    id v18 = +[IRPreferences shared];
    int v19 = [v18 candidateSelectorAllowSelectByHistory];
    unsigned int v20 = [v19 BOOLValue];
  }
  else
  {
    unsigned int v20 = 0;
  }

  return v5 | v8 | v11 | v14 | v17 | v20;
}

+ (BOOL)_isPickerChoiceOverrideActiveAtDate:(id)a3 withSystemState:(id)a4
{
  BOOL v4 = 0;
  if (a3 && a4)
  {
    id v6 = a3;
    unint64_t v7 = [a4 latestPickerChoiceDate];
    [v6 timeIntervalSinceDate:v7];
    double v9 = v8;

    unint64_t v10 = +[IRPreferences shared];
    int v11 = [v10 pickerChoiceOverrideIntervalSeconds];
    [v11 doubleValue];
    BOOL v4 = v9 < v12 && v9 >= 0.0;
  }
  return v4;
}

- (BOOL)candidateSelectorReasonRecentlyUsed
{
  return self->_candidateSelectorReasonRecentlyUsed;
}

- (void)setCandidateSelectorReasonRecentlyUsed:(BOOL)a3
{
  self->_candidateSelectorReasonRecentlyUsed = a3;
}

- (BOOL)candidateSelectorReasonMostlyUsedSimilarApp
{
  return self->_candidateSelectorReasonMostlyUsedSimilarApp;
}

- (void)setCandidateSelectorReasonMostlyUsedSimilarApp:(BOOL)a3
{
  self->_candidateSelectorReasonMostlyUsedSimilarApp = a3;
}

- (BOOL)candidateSelectorReasonProximityWithHistoryOrSameICloud
{
  return self->_candidateSelectorReasonProximityWithHistoryOrSameICloud;
}

- (void)setCandidateSelectorReasonProximityWithHistoryOrSameICloud:(BOOL)a3
{
  self->_candidateSelectorReasonProximityWithHistoryOrSameICloud = a3;
}

- (BOOL)candidateSelectorReasonProximity
{
  return self->_candidateSelectorReasonProximity;
}

- (void)setCandidateSelectorReasonProximity:(BOOL)a3
{
  self->_candidateSelectorReasonProximity = a3;
}

- (BOOL)candidateSelectorReasonMostlyUsedAnyApp
{
  return self->_candidateSelectorReasonMostlyUsedAnyApp;
}

- (void)setCandidateSelectorReasonMostlyUsedAnyApp:(BOOL)a3
{
  self->_candidateSelectorReasonMostlyUsedAnyApp = a3;
}

- (BOOL)candidateSelectorReasonBrokeredMainDeviceFirstUse
{
  return self->_candidateSelectorReasonBrokeredMainDeviceFirstUse;
}

- (void)setCandidateSelectorReasonBrokeredMainDeviceFirstUse:(BOOL)a3
{
  self->_candidateSelectorReasonBrokeredMainDeviceFirstUse = a3;
}

- (BOOL)candidateSelectorReasonSingle
{
  return self->_candidateSelectorReasonSingle;
}

@end