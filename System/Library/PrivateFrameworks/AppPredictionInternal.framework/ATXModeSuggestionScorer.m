@interface ATXModeSuggestionScorer
+ (BOOL)_areConfiguredTriggers:(id)a3 conflictingWithSuggestedTriggers:(id)a4;
- (ATXModeSuggestionScorer)initWithModeUUID:(id)a3 modeType:(int)a4 origin:(int)a5 originBundleId:(id)a6 originAnchorType:(id)a7 confidenceScore:(double)a8 secondsSinceSuggested:(double)a9 serializedTriggers:(id)a10;
- (ATXModeSuggestionScorer)initWithModeUUID:(id)a3 modeType:(int)a4 origin:(int)a5 originBundleId:(id)a6 originAnchorType:(id)a7 confidenceScore:(double)a8 secondsSinceSuggested:(double)a9 serializedTriggers:(id)a10 configuredModeService:(id)a11 feedbackStream:(id)a12 feedbackHistogramHelper:(id)a13 appLaunchStream:(id)a14 groundTruthModeStream:(id)a15;
- (BOOL)_hasHadEarlyExitTodayForModeWithUUID:(id)a3;
- (BOOL)_hasLaunchedAppOnAtLeastTwoSeparateDays;
- (BOOL)_hasUserSetUpModeBefore;
- (BOOL)_hasUserSetUpSmartActivationForThisModeBefore;
- (BOOL)_inValidLocaleForDrivingSuggestions;
- (BOOL)_isSameActivityAndSource:(id)a3;
- (BOOL)_isUserCurrentlyInDifferentModeFromSuggestedMode:(id)a3;
- (BOOL)_isUserCurrentlyInSuggestedMode:(id)a3;
- (BOOL)_shouldSuggestOnLockScreenWithDefaults:(id)a3;
- (BOOL)isModeConfigured;
- (BOOL)isUserCurrentlyInADifferentMode;
- (BOOL)isUserCurrentlyInMode;
- (BOOL)shouldAllowSmartEntry;
- (BOOL)shouldSuggestOnLockScreen;
- (BOOL)shouldSuggestTriggers;
- (double)score;
- (id)_lockScreenSuggestionThresholds;
- (id)_scoringWeights;
- (void)_populateCachedDataAboutUsersCurrentMode;
- (void)_populateFeedbackScores;
- (void)_populateFeedbackScoresIfNeeded;
@end

@implementation ATXModeSuggestionScorer

- (ATXModeSuggestionScorer)initWithModeUUID:(id)a3 modeType:(int)a4 origin:(int)a5 originBundleId:(id)a6 originAnchorType:(id)a7 confidenceScore:(double)a8 secondsSinceSuggested:(double)a9 serializedTriggers:(id)a10
{
  id v28 = a10;
  id v15 = a7;
  id v16 = a6;
  id v17 = a3;
  v26 = objc_opt_new();
  v25 = (void *)[objc_alloc(MEMORY[0x1E4F4AE90]) initWithStoreConfig:0];
  v18 = objc_opt_new();
  v19 = objc_opt_new();
  v20 = BiomeLibrary();
  v21 = [v20 UserFocus];
  v22 = [v21 ComputedMode];
  v23 = [(ATXModeSuggestionScorer *)self initWithModeUUID:v17 modeType:a4 origin:a5 originBundleId:v16 originAnchorType:v15 confidenceScore:v28 secondsSinceSuggested:a8 serializedTriggers:a9 configuredModeService:v26 feedbackStream:v25 feedbackHistogramHelper:v18 appLaunchStream:v19 groundTruthModeStream:v22];

  return v23;
}

- (ATXModeSuggestionScorer)initWithModeUUID:(id)a3 modeType:(int)a4 origin:(int)a5 originBundleId:(id)a6 originAnchorType:(id)a7 confidenceScore:(double)a8 secondsSinceSuggested:(double)a9 serializedTriggers:(id)a10 configuredModeService:(id)a11 feedbackStream:(id)a12 feedbackHistogramHelper:(id)a13 appLaunchStream:(id)a14 groundTruthModeStream:(id)a15
{
  id v37 = a3;
  id v36 = a6;
  id v35 = a7;
  id v21 = a10;
  id v34 = a11;
  id v33 = a12;
  id v32 = a13;
  id v31 = a14;
  id v22 = a15;
  v38.receiver = self;
  v38.super_class = (Class)ATXModeSuggestionScorer;
  v23 = [(ATXModeSuggestionScorer *)&v38 init];
  if (v23)
  {
    uint64_t v24 = [v37 copy];
    modeUUID = v23->_modeUUID;
    v23->_modeUUID = (NSString *)v24;

    v23->_modeType = a4;
    v23->_origin = a5;
    objc_storeStrong((id *)&v23->_originBundleId, a6);
    objc_storeStrong((id *)&v23->_originAnchorType, a7);
    v23->_confidenceScore = a8;
    v23->_secondsSinceSuggested = a9;
    uint64_t v26 = ATXDeserializeTriggers();
    triggers = v23->_triggers;
    v23->_triggers = (NSArray *)v26;

    objc_storeStrong((id *)&v23->_configuredModeService, a11);
    objc_storeStrong((id *)&v23->_feedbackStream, a12);
    objc_storeStrong((id *)&v23->_feedbackHistogramHelper, a13);
    objc_storeStrong((id *)&v23->_appLaunchStream, a14);
    objc_storeStrong((id *)&v23->_groundTruthModeStream, a15);
  }

  return v23;
}

- (BOOL)isModeConfigured
{
  cachedIsModeConfigured = self->_cachedIsModeConfigured;
  if (!cachedIsModeConfigured)
  {
    if (self->_modeUUID)
    {
      -[ATXConfiguredModeService DNDModeConfigurationForActivityWithUUID:](self->_configuredModeService, "DNDModeConfigurationForActivityWithUUID:");
      v4 = (DNDModeConfiguration *)objc_claimAutoreleasedReturnValue();
      cachedDNDMode = self->_cachedDNDMode;
      self->_cachedDNDMode = v4;

      [NSNumber numberWithInt:self->_cachedDNDMode != 0];
      v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = (NSNumber *)MEMORY[0x1E4F1CC28];
    }
    v7 = self->_cachedIsModeConfigured;
    self->_cachedIsModeConfigured = v6;

    cachedIsModeConfigured = self->_cachedIsModeConfigured;
  }
  return [(NSNumber *)cachedIsModeConfigured BOOLValue];
}

- (BOOL)isUserCurrentlyInMode
{
  if (self->_cachedIsUserCurrentlyInMode)
  {
    [(ATXModeSuggestionScorer *)self _populateCachedDataAboutUsersCurrentMode];
    cachedIsUserCurrentlyInMode = self->_cachedIsUserCurrentlyInMode;
  }
  else
  {
    cachedIsUserCurrentlyInMode = 0;
  }
  return [(NSNumber *)cachedIsUserCurrentlyInMode BOOLValue];
}

- (BOOL)isUserCurrentlyInADifferentMode
{
  cachedIsUserCurrentlyInADifferentMode = self->_cachedIsUserCurrentlyInADifferentMode;
  if (!cachedIsUserCurrentlyInADifferentMode)
  {
    [(ATXModeSuggestionScorer *)self _populateCachedDataAboutUsersCurrentMode];
    cachedIsUserCurrentlyInADifferentMode = self->_cachedIsUserCurrentlyInADifferentMode;
  }
  return [(NSNumber *)cachedIsUserCurrentlyInADifferentMode BOOLValue];
}

- (void)_populateCachedDataAboutUsersCurrentMode
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F93650]) initWithStream:self->_groundTruthModeStream];
  id v8 = [v3 currentMode];

  objc_msgSend(NSNumber, "numberWithBool:", -[ATXModeSuggestionScorer _isUserCurrentlyInSuggestedMode:](self, "_isUserCurrentlyInSuggestedMode:", v8));
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  cachedIsUserCurrentlyInMode = self->_cachedIsUserCurrentlyInMode;
  self->_cachedIsUserCurrentlyInMode = v4;

  objc_msgSend(NSNumber, "numberWithBool:", -[ATXModeSuggestionScorer _isUserCurrentlyInDifferentModeFromSuggestedMode:](self, "_isUserCurrentlyInDifferentModeFromSuggestedMode:", v8));
  v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  cachedIsUserCurrentlyInADifferentMode = self->_cachedIsUserCurrentlyInADifferentMode;
  self->_cachedIsUserCurrentlyInADifferentMode = v6;
}

- (BOOL)_isUserCurrentlyInSuggestedMode:(id)a3
{
  if (!a3 || !self->_modeUUID) {
    return 0;
  }
  v4 = [a3 mode];
  char v5 = [v4 isEqualToString:self->_modeUUID];

  return v5;
}

- (BOOL)_isUserCurrentlyInDifferentModeFromSuggestedMode:(id)a3
{
  BOOL v4 = !-[ATXModeSuggestionScorer _isUserCurrentlyInSuggestedMode:](self, "_isUserCurrentlyInSuggestedMode:");
  return a3 && v4;
}

- (double)score
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  v3 = [(ATXModeSuggestionScorer *)self _scoringWeights];
  BOOL v4 = [v3 objectForKeyedSubscript:@"confidenceScoreWeight"];
  [v4 doubleValue];
  double v6 = v5;

  v7 = [v3 objectForKeyedSubscript:@"feedbackScoreWeight"];
  [v7 doubleValue];
  double v9 = v8;

  v10 = [v3 objectForKeyedSubscript:@"secondsSinceSuggestedWeight"];
  [v10 doubleValue];
  double v12 = v11;

  v13 = [v3 objectForKeyedSubscript:@"isModeConfiguredWeight"];
  [v13 doubleValue];
  double v15 = v14;

  id v16 = [v3 objectForKeyedSubscript:@"isUserCurrentlyInModeWeight"];
  [v16 doubleValue];
  double v18 = v17;

  [(ATXModeSuggestionScorer *)self _populateFeedbackScoresIfNeeded];
  double confidenceScore = self->_confidenceScore;
  [(NSNumber *)self->_feedbackScore doubleValue];
  double v21 = v9 * v20 + v6 * confidenceScore + v12 * self->_secondsSinceSuggested;
  id v22 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXModeSuggestionScorer isModeConfigured](self, "isModeConfigured"));
  [v22 doubleValue];
  double v24 = v21 + v15 * v23;
  v25 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXModeSuggestionScorer isUserCurrentlyInMode](self, "isUserCurrentlyInMode"));
  [v25 doubleValue];
  double v27 = v24 + v18 * v26;

  id v28 = __atxlog_handle_modes();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    modeUUID = self->_modeUUID;
    uint64_t modeType = self->_modeType;
    feedbackScore = self->_feedbackScore;
    double v32 = self->_confidenceScore;
    double secondsSinceSuggested = self->_secondsSinceSuggested;
    int v35 = 138545154;
    id v36 = modeUUID;
    __int16 v37 = 2048;
    uint64_t v38 = modeType;
    __int16 v39 = 2048;
    double v40 = v27;
    __int16 v41 = 2048;
    double v42 = v32;
    __int16 v43 = 2112;
    v44 = feedbackScore;
    __int16 v45 = 2048;
    double v46 = secondsSinceSuggested;
    __int16 v47 = 1024;
    BOOL v48 = [(ATXModeSuggestionScorer *)self isModeConfigured];
    __int16 v49 = 1024;
    BOOL v50 = [(ATXModeSuggestionScorer *)self isUserCurrentlyInMode];
    _os_log_impl(&dword_1D0FA3000, v28, OS_LOG_TYPE_DEFAULT, "ATXModeSuggestionScorer: Calculating combined score for modeUUID: %{public}@, modeType: %lu combinedScore: %f, confidenceScore: %f, feedbackScore: %@, secondsSinceSuggested: %f, isActivityConfigured: %d, isUserCurrentlyInActivity: %d", (uint8_t *)&v35, 0x4Au);
  }

  return v27;
}

- (id)_scoringWeights
{
  v2 = [MEMORY[0x1E4F4AF08] dictionaryForClass:objc_opt_class()];
  v3 = [v2 objectForKeyedSubscript:@"rankingScoreWeights"];

  return v3;
}

- (BOOL)shouldSuggestOnLockScreen
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CB18]);
  BOOL v4 = (void *)[v3 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  LOBYTE(self) = [(ATXModeSuggestionScorer *)self _shouldSuggestOnLockScreenWithDefaults:v4];

  return (char)self;
}

- (BOOL)_shouldSuggestOnLockScreenWithDefaults:(id)a3
{
  uint64_t v131 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![MEMORY[0x1E4F93B08] isInternalBuild]
    || ([v4 BOOLForKey:*MEMORY[0x1E4F936D8]] & 1) == 0)
  {
    if (![(ATXModeSuggestionScorer *)self isModeConfigured] && self->_modeType != 6)
    {
      double v6 = __atxlog_handle_modes();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v7 = "ATXModeSuggestionScorer: Mode is not configured and type is not driving, should suppress mode set-up sugges"
             "tion from lockscreen";
        goto LABEL_37;
      }
LABEL_65:
      BOOL v5 = 0;
LABEL_66:

      goto LABEL_67;
    }
    if (![(ATXModeSuggestionScorer *)self isModeConfigured]
      && [(ATXModeSuggestionScorer *)self _hasUserSetUpModeBefore])
    {
      double v6 = __atxlog_handle_modes();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v7 = "ATXModeSuggestionScorer: User has configured mode before, should suppress mode set-up suggestion from lockscreen";
LABEL_37:
        _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
        goto LABEL_65;
      }
      goto LABEL_65;
    }
    if (![(ATXModeSuggestionScorer *)self isModeConfigured]
      && self->_modeType == 6
      && ![(ATXModeSuggestionScorer *)self _inValidLocaleForDrivingSuggestions])
    {
      double v6 = __atxlog_handle_modes();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v7 = "ATXModeSuggestionScorer: Mode is not configured and type is driving, should suppress mode set-up suggestion"
             " from lockscreen because user is not in valid locale";
        goto LABEL_37;
      }
      goto LABEL_65;
    }
    double v6 = [(ATXModeSuggestionScorer *)self _lockScreenSuggestionThresholds];
    [(ATXModeSuggestionScorer *)self _populateFeedbackScoresIfNeeded];
    double v8 = [v6 objectForKeyedSubscript:@"confidenceScoreThreshold"];
    [v8 doubleValue];
    double v10 = v9;

    double v11 = [v6 objectForKeyedSubscript:@"rejectionsInPastWeekThreshold"];
    [v11 doubleValue];
    double v13 = v12;

    double v14 = [v6 objectForKeyedSubscript:@"totalRejectionsThreshold"];
    [v14 doubleValue];
    double v16 = v15;

    double v17 = [v6 objectForKeyedSubscript:@"totalIgnoresAndRejectionsThreshold"];
    [v17 doubleValue];
    double v19 = v18;

    double v20 = [v6 objectForKeyedSubscript:@"timesShownInLastDayThreshold"];
    [v20 doubleValue];
    double v102 = v21;

    id v22 = [v6 objectForKeyedSubscript:@"rejectionsAcrossAllModesInPastDayThreshold"];
    [v22 doubleValue];
    double v24 = v23;

    v25 = [v6 objectForKeyedSubscript:@"timesShownAcrossAllModesInPastDayThreshold"];
    [v25 doubleValue];
    double v27 = v26;

    id v28 = [v6 objectForKeyedSubscript:@"timesShownAcrossAllModesInPastWeekThreshold"];
    [v28 doubleValue];
    double v30 = v29;

    id v31 = [v6 objectForKeyedSubscript:@"rejectionsAcrossAllModesInPastWeekThreshold"];
    [v31 doubleValue];
    double v33 = v32;

    id v34 = [v6 objectForKeyedSubscript:@"shouldSuppressIfUserIsInADifferentMode"];
    int v35 = [v34 BOOLValue];

    id v36 = __atxlog_handle_modes();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      modeUUID = self->_modeUUID;
      *(void *)&double v38 = self->_modeType;
      BMUserFocusInferredModeTypeToActivity();
      ATXActivityTypeToString();
      double v39 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      double confidenceScore = self->_confidenceScore;
      feedbackScore = self->_feedbackScore;
      rejectionsInPastWeek = self->_rejectionsInPastWeek;
      totalRejections = self->_totalRejections;
      totalIgnores = self->_totalIgnores;
      timesShownInLastDay = self->_timesShownInLastDay;
      timesShown = self->_timesShown;
      rejectionsAcrossAllModesInPastDay = self->_rejectionsAcrossAllModesInPastDay;
      timesShownAcrossAllModesInPastDay = self->_timesShownAcrossAllModesInPastDay;
      timesShownAcrossAllModesInPastWeek = self->_timesShownAcrossAllModesInPastWeek;
      rejectionsAcrossAllModesInPastWeek = self->_rejectionsAcrossAllModesInPastWeek;
      *(_DWORD *)buf = 138546690;
      v104 = modeUUID;
      __int16 v105 = 2048;
      double v106 = v38;
      __int16 v107 = 2114;
      double v108 = v39;
      __int16 v109 = 2048;
      double v110 = confidenceScore;
      __int16 v111 = 2112;
      v112 = feedbackScore;
      __int16 v113 = 2112;
      v114 = rejectionsInPastWeek;
      __int16 v115 = 2112;
      v116 = totalRejections;
      __int16 v117 = 2112;
      v118 = totalIgnores;
      __int16 v119 = 2112;
      v120 = timesShownInLastDay;
      __int16 v121 = 2114;
      v122 = timesShown;
      __int16 v123 = 2112;
      v124 = rejectionsAcrossAllModesInPastDay;
      __int16 v125 = 2112;
      v126 = timesShownAcrossAllModesInPastDay;
      __int16 v127 = 2112;
      v128 = timesShownAcrossAllModesInPastWeek;
      __int16 v129 = 2112;
      v130 = rejectionsAcrossAllModesInPastWeek;
      _os_log_impl(&dword_1D0FA3000, v36, OS_LOG_TYPE_DEFAULT, "ATXModeSuggestionScorer: Determining if mode should be suggestion on lock screen. uuid: %{public}@, modeType: %lu, modeString: %{public}@, confidenceScore: %f, feedbackScore: %@, rejectionsInPastWeek: %@, totalRejections: %@, totalIgnores: %@, timesShownInLastDay: %@, timesShown: %{public}@, rejectionsAcrossAllModesInPastDay: %@, timesShownAcrossAllModesInPastDay: %@, timesShownAcrossAllModesInPastWeek: %@, rejectionsAcrossAllModesInPastWeek: %@", buf, 0x8Eu);
    }
    if ([(ATXModeSuggestionScorer *)self isModeConfigured] || self->_modeType != 6)
    {
LABEL_24:
      if (self->_confidenceScore >= v10)
      {
        [(NSNumber *)self->_rejectionsInPastWeek doubleValue];
        if (v63 <= v13)
        {
          [(NSNumber *)self->_totalRejections doubleValue];
          if (v66 <= v16)
          {
            [(NSNumber *)self->_totalIgnores doubleValue];
            double v70 = v69;
            [(NSNumber *)self->_totalRejections doubleValue];
            double v72 = v70 + v71;
            if (v72 <= v19)
            {
              [(NSNumber *)self->_timesShownInLastDay doubleValue];
              if (v74 <= v102)
              {
                [(NSNumber *)self->_rejectionsAcrossAllModesInPastDay doubleValue];
                if (v77 <= v24)
                {
                  [(NSNumber *)self->_timesShownAcrossAllModesInPastDay doubleValue];
                  if (v80 <= v27)
                  {
                    [(NSNumber *)self->_timesShownAcrossAllModesInPastWeek doubleValue];
                    if (v83 <= v30)
                    {
                      [(NSNumber *)self->_rejectionsAcrossAllModesInPastWeek doubleValue];
                      if (v86 <= v33)
                      {
                        if (v35
                          && [(ATXModeSuggestionScorer *)self isUserCurrentlyInADifferentMode])
                        {
                          v59 = __atxlog_handle_modes();
                          if (!os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT)) {
                            goto LABEL_64;
                          }
                          v92 = self->_modeUUID;
                          *(_DWORD *)buf = 138543362;
                          v104 = v92;
                          v62 = "ATXModeSuggestionScorer: mode: %{public}@ should NOT be suggested on lock screen because"
                                " user is currently in another mode";
                          v89 = v59;
                          uint32_t v90 = 12;
                          goto LABEL_63;
                        }
                        if ([MEMORY[0x1E4F93B08] isInternalBuild]
                          && (CFStringRef v93 = (const __CFString *)*MEMORY[0x1E4F936D0],
                              buf[0] = 0,
                              CFPreferencesGetAppBooleanValue(v93, (CFStringRef)*MEMORY[0x1E4F4B688], buf)))
                        {
                          v94 = __atxlog_handle_modes();
                          if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
                          {
                            v95 = self->_modeUUID;
                            *(_DWORD *)buf = 138543362;
                            v104 = v95;
                            _os_log_impl(&dword_1D0FA3000, v94, OS_LOG_TYPE_DEFAULT, "ATXModeSuggestionScorer: mode: %{public}@ skipping check to see if app has been launched on two separate days", buf, 0xCu);
                          }
                        }
                        else if ([(NSString *)self->_originBundleId length] {
                               && ![(ATXModeSuggestionScorer *)self _hasLaunchedAppOnAtLeastTwoSeparateDays])
                        }
                        {
                          v59 = __atxlog_handle_modes();
                          if (!os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT)) {
                            goto LABEL_64;
                          }
                          v98 = self->_modeUUID;
                          originBundleId = self->_originBundleId;
                          *(_DWORD *)buf = 138543618;
                          v104 = v98;
                          __int16 v105 = 2112;
                          double v106 = *(double *)&originBundleId;
                          v62 = "ATXModeSuggestionScorer: mode: %{public}@ should NOT be suggested on lock screen because"
                                " user has not launched bundleId: %@ on two seperate days";
                          v89 = v59;
                          uint32_t v90 = 22;
                          goto LABEL_63;
                        }
                        v96 = __atxlog_handle_modes();
                        if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
                        {
                          v97 = self->_modeUUID;
                          *(_DWORD *)buf = 138543362;
                          v104 = v97;
                          _os_log_impl(&dword_1D0FA3000, v96, OS_LOG_TYPE_DEFAULT, "ATXModeSuggestionScorer: mode: %{public}@ should be suggested on lock screen", buf, 0xCu);
                        }

                        BOOL v5 = 1;
                        goto LABEL_66;
                      }
                      v59 = __atxlog_handle_modes();
                      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
                      {
                        v87 = self->_modeUUID;
                        v88 = self->_rejectionsAcrossAllModesInPastWeek;
                        *(_DWORD *)buf = 138543874;
                        v104 = v87;
                        __int16 v105 = 2112;
                        double v106 = *(double *)&v88;
                        __int16 v107 = 2048;
                        double v108 = v33;
                        v62 = "ATXModeSuggestionScorer: mode: %{public}@ should NOT be suggested on lock screen because r"
                              "ejectionsAcrossAllModesInPastWeek: %@ does not pass threshold: %f";
                        goto LABEL_62;
                      }
                    }
                    else
                    {
                      v59 = __atxlog_handle_modes();
                      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
                      {
                        v84 = self->_modeUUID;
                        v85 = self->_timesShownAcrossAllModesInPastWeek;
                        *(_DWORD *)buf = 138543874;
                        v104 = v84;
                        __int16 v105 = 2112;
                        double v106 = *(double *)&v85;
                        __int16 v107 = 2048;
                        double v108 = v30;
                        v62 = "ATXModeSuggestionScorer: mode: %{public}@ should NOT be suggested on lock screen because t"
                              "imesShownAcrossAllModesInPastWeek: %@ does not pass threshold: %f";
                        goto LABEL_62;
                      }
                    }
                  }
                  else
                  {
                    v59 = __atxlog_handle_modes();
                    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
                    {
                      v81 = self->_modeUUID;
                      v82 = self->_timesShownAcrossAllModesInPastDay;
                      *(_DWORD *)buf = 138543874;
                      v104 = v81;
                      __int16 v105 = 2112;
                      double v106 = *(double *)&v82;
                      __int16 v107 = 2048;
                      double v108 = v27;
                      v62 = "ATXModeSuggestionScorer: mode: %{public}@ should NOT be suggested on lock screen because tim"
                            "esShownAcrossAllModesInPastDay: %@ does not pass threshold: %f";
                      goto LABEL_62;
                    }
                  }
                }
                else
                {
                  v59 = __atxlog_handle_modes();
                  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
                  {
                    v78 = self->_modeUUID;
                    v79 = self->_rejectionsAcrossAllModesInPastDay;
                    *(_DWORD *)buf = 138543874;
                    v104 = v78;
                    __int16 v105 = 2112;
                    double v106 = *(double *)&v79;
                    __int16 v107 = 2048;
                    double v108 = v24;
                    v62 = "ATXModeSuggestionScorer: mode: %{public}@ should NOT be suggested on lock screen because rejec"
                          "tionsAcrossAllModesInPastDay: %@ does not pass threshold: %f";
                    goto LABEL_62;
                  }
                }
              }
              else
              {
                v59 = __atxlog_handle_modes();
                if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
                {
                  v75 = self->_modeUUID;
                  v76 = self->_timesShownInLastDay;
                  *(_DWORD *)buf = 138543874;
                  v104 = v75;
                  __int16 v105 = 2112;
                  double v106 = *(double *)&v76;
                  __int16 v107 = 2048;
                  double v108 = v102;
                  v62 = "ATXModeSuggestionScorer: mode: %{public}@ should NOT be suggested on lock screen because timesSh"
                        "ownInLastDay: %@ does not pass threshold: %f";
                  goto LABEL_62;
                }
              }
            }
            else
            {
              v59 = __atxlog_handle_modes();
              if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
              {
                v73 = self->_modeUUID;
                *(_DWORD *)buf = 138543874;
                v104 = v73;
                __int16 v105 = 2048;
                double v106 = v72;
                __int16 v107 = 2048;
                double v108 = v19;
                v62 = "ATXModeSuggestionScorer: mode: %{public}@ should NOT be suggested on lock screen because totalIgno"
                      "resAndRejections: %f does not pass threshold: %f";
                goto LABEL_62;
              }
            }
          }
          else
          {
            v59 = __atxlog_handle_modes();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
            {
              v67 = self->_modeUUID;
              v68 = self->_totalRejections;
              *(_DWORD *)buf = 138543874;
              v104 = v67;
              __int16 v105 = 2112;
              double v106 = *(double *)&v68;
              __int16 v107 = 2048;
              double v108 = v16;
              v62 = "ATXModeSuggestionScorer: mode: %{public}@ should NOT be suggested on lock screen because totalReject"
                    "ions: %@ does not pass threshold: %f";
              goto LABEL_62;
            }
          }
        }
        else
        {
          v59 = __atxlog_handle_modes();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
          {
            v64 = self->_modeUUID;
            v65 = self->_rejectionsInPastWeek;
            *(_DWORD *)buf = 138543874;
            v104 = v64;
            __int16 v105 = 2112;
            double v106 = *(double *)&v65;
            __int16 v107 = 2048;
            double v108 = v13;
            v62 = "ATXModeSuggestionScorer: mode: %{public}@ should NOT be suggested on lock screen because rejectionsInP"
                  "astWeek: %@ does not pass threshold: %f";
            goto LABEL_62;
          }
        }
      }
      else
      {
        v59 = __atxlog_handle_modes();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          v60 = self->_modeUUID;
          double v61 = self->_confidenceScore;
          *(_DWORD *)buf = 138543874;
          v104 = v60;
          __int16 v105 = 2048;
          double v106 = v61;
          __int16 v107 = 2048;
          double v108 = v10;
          v62 = "ATXModeSuggestionScorer: mode: %{public}@ should NOT be suggested on lock screen because confidenceScore"
                ": %f does not pass threshold: %f";
LABEL_62:
          v89 = v59;
          uint32_t v90 = 32;
LABEL_63:
          _os_log_impl(&dword_1D0FA3000, v89, OS_LOG_TYPE_DEFAULT, v62, buf, v90);
        }
      }
LABEL_64:

      goto LABEL_65;
    }
    uint64_t v51 = [v4 objectForKey:@"dateDrivingSetupSuggestionLastShown"];
    if (v51)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v100 = v27;
        double v101 = v24;
        [v4 doubleForKey:*MEMORY[0x1E4F4B6C8]];
        double v53 = v52;
        *(double *)&v54 = COERCE_DOUBLE([objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:v52]);
        [v51 timeIntervalSinceReferenceDate];
        double v56 = v55;
        v57 = __atxlog_handle_modes();
        BOOL v58 = os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT);
        if (v56 <= v53)
        {
          double v27 = v100;
          double v24 = v101;
          if (v58)
          {
            *(_DWORD *)buf = 138543618;
            v104 = (NSString *)v51;
            __int16 v105 = 2114;
            double v106 = *(double *)&v54;
            _os_log_impl(&dword_1D0FA3000, v57, OS_LOG_TYPE_DEFAULT, "ATXModeSuggestionScorer: Driving setup suggestion was shown on %{public}@ and the last major OS upgrade was on approximately %{public}@", buf, 0x16u);
          }

          goto LABEL_23;
        }
        if (v58)
        {
          *(_DWORD *)buf = 138543618;
          v104 = (NSString *)v51;
          __int16 v105 = 2114;
          double v106 = *(double *)&v54;
          _os_log_impl(&dword_1D0FA3000, v57, OS_LOG_TYPE_DEFAULT, "ATXModeSuggestionScorer: Not showing Driving setup suggestion because suggestion was already shown once (%{public}@) since last major os upgrade (%{public}@)", buf, 0x16u);
        }
      }
      else
      {
        __atxlog_handle_modes();
        *(double *)&v54 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT)) {
          -[ATXModeSuggestionScorer _shouldSuggestOnLockScreenWithDefaults:](v54);
        }
      }

      goto LABEL_65;
    }
LABEL_23:

    goto LABEL_24;
  }
  BOOL v5 = 1;
LABEL_67:

  return v5;
}

- (BOOL)_hasUserSetUpModeBefore
{
  BMUserFocusInferredModeTypeToActivity();
  v2 = ATXActivityTypeToModeSemanticType();
  id v3 = objc_alloc(MEMORY[0x1E4F1CB18]);
  id v4 = (void *)[v3 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  BOOL v5 = [v4 objectForKey:*MEMORY[0x1E4F4B6B0]];
  if (v5)
  {
    double v6 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
    char v7 = [v6 containsObject:v2];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)_hasUserSetUpSmartActivationForThisModeBefore
{
  BMUserFocusInferredModeTypeToActivity();
  v2 = ATXActivityTypeToModeSemanticType();
  id v3 = objc_alloc(MEMORY[0x1E4F1CB18]);
  id v4 = (void *)[v3 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  BOOL v5 = [v4 objectForKey:*MEMORY[0x1E4F4B6B8]];
  if (v5)
  {
    double v6 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
    char v7 = [v6 containsObject:v2];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)shouldSuggestTriggers
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(ATXModeSuggestionScorer *)self shouldSuggestOnLockScreen];
  if (v3)
  {
    if ([(ATXModeSuggestionScorer *)self _hasUserSetUpSmartActivationForThisModeBefore])
    {
      id v4 = __atxlog_handle_modes();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        modeUUID = self->_modeUUID;
        int v14 = 138543362;
        double v15 = modeUUID;
        _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "ATXModeSuggestionScorer: mode: %{public}@ trigger should not be suggested because smart activation was previously ON for this mode", (uint8_t *)&v14, 0xCu);
      }
    }
    else
    {
      if (![(ATXModeSuggestionScorer *)self isModeConfigured]) {
        goto LABEL_11;
      }
      double v6 = [(DNDModeConfiguration *)self->_cachedDNDMode triggers];
      uint64_t v7 = [v6 count];

      if (!v7
        || (double v8 = objc_opt_class(),
            [(DNDModeConfiguration *)self->_cachedDNDMode triggers],
            double v9 = objc_claimAutoreleasedReturnValue(),
            LODWORD(v8) = [v8 _areConfiguredTriggers:v9 conflictingWithSuggestedTriggers:self->_triggers], v9, !v8))
      {
LABEL_11:
        LOBYTE(v3) = 1;
        return v3;
      }
      id v4 = __atxlog_handle_modes();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        double v10 = self->_modeUUID;
        double v11 = [(DNDModeConfiguration *)self->_cachedDNDMode triggers];
        triggers = self->_triggers;
        int v14 = 138543874;
        double v15 = v10;
        __int16 v16 = 2114;
        double v17 = v11;
        __int16 v18 = 2114;
        double v19 = triggers;
        _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "ATXModeSuggestionScorer: mode: %{public}@ trigger should not be suggested because existing triggers %{public}@ conflict with predicted triggers: %{public}@", (uint8_t *)&v14, 0x20u);
      }
    }

    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)shouldAllowSmartEntry
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!self->_modeUUID) {
    goto LABEL_8;
  }
  BOOL v3 = [(ATXModeSuggestionScorer *)self isModeConfigured];
  if (!v3) {
    return v3;
  }
  if ([(DNDModeConfiguration *)self->_cachedDNDMode allowSmartEntry] != 2)
  {
LABEL_8:
    LOBYTE(v3) = 0;
    return v3;
  }
  if ([(ATXModeSuggestionScorer *)self _hasHadEarlyExitTodayForModeWithUUID:self->_modeUUID])
  {
    id v4 = __atxlog_handle_modes();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      modeUUID = self->_modeUUID;
      int v7 = 138543362;
      double v8 = modeUUID;
      _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "ATXModeSuggestionScorer: mode: %{public}@ not allowing smart entry because we already had an early exit today", (uint8_t *)&v7, 0xCu);
    }

    goto LABEL_8;
  }
  LOBYTE(v3) = 1;
  return v3;
}

- (BOOL)_hasHadEarlyExitTodayForModeWithUUID:(id)a3
{
  id v3 = a3;
  uint64_t v16 = 0;
  double v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  id v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  BOOL v5 = [MEMORY[0x1E4F1C9C8] now];
  double v6 = [v4 startOfDayForDate:v5];

  int v7 = objc_opt_new();
  [v6 timeIntervalSinceReferenceDate];
  double v8 = objc_msgSend(v7, "publisherFromStartTime:");
  uint64_t v9 = [v8 filterWithIsIncluded:&__block_literal_global_44];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__ATXModeSuggestionScorer__hasHadEarlyExitTodayForModeWithUUID___block_invoke_3;
  v13[3] = &unk_1E68ABB20;
  id v10 = v3;
  id v14 = v10;
  double v15 = &v16;
  id v11 = (id)[v9 sinkWithCompletion:&__block_literal_global_84 receiveInput:v13];

  LOBYTE(v7) = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v16, 8);

  return (char)v7;
}

BOOL __64__ATXModeSuggestionScorer__hasHadEarlyExitTodayForModeWithUUID___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBody];
  BOOL v3 = [v2 eventType] == 5;

  return v3;
}

void __64__ATXModeSuggestionScorer__hasHadEarlyExitTodayForModeWithUUID___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 eventBody];
  BOOL v5 = v4;
  if (v4)
  {
    double v6 = [v4 activity];
    int v7 = [v6 modeUUID];

    if (v7 && [v7 isEqualToString:*(void *)(a1 + 32)])
    {
      double v8 = __atxlog_handle_modes();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        [v3 timestamp];
        int v11 = 138543618;
        uint64_t v12 = v9;
        __int16 v13 = 2048;
        uint64_t v14 = v10;
        _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "ATXModeSuggestionScorer: mode: %{public}@ has an early exit detected at %f", (uint8_t *)&v11, 0x16u);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
}

- (BOOL)_inValidLocaleForDrivingSuggestions
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D25F6CC0](self, a2);
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"US", @"CA", @"GB", 0);
  id v4 = [MEMORY[0x1E4F1CA20] currentLocale];
  BOOL v5 = [v4 objectForKey:*MEMORY[0x1E4F1C400]];

  if (v5 && ([v3 containsObject:v5] & 1) != 0)
  {
    BOOL v6 = 1;
  }
  else
  {
    int v7 = __atxlog_handle_modes();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v10 = v5;
      _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "ATXModeSuggestionScorer: user is in locale: %@", buf, 0xCu);
    }

    BOOL v6 = 0;
  }

  return v6;
}

+ (BOOL)_areConfiguredTriggers:(id)a3 conflictingWithSuggestedTriggers:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = objc_msgSend(v5, "_pas_filteredArrayWithTest:", &__block_literal_global_89_0);
  if ([v7 count])
  {
    BOOL v8 = 1;
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CA80];
    uint64_t v10 = objc_msgSend(v6, "_pas_mappedArrayWithTransform:", &__block_literal_global_94);
    uint64_t v11 = [v9 setWithArray:v10];

    uint64_t v12 = (void *)MEMORY[0x1E4F1CA80];
    __int16 v13 = objc_msgSend(v5, "_pas_mappedArrayWithTransform:", &__block_literal_global_98);
    uint64_t v14 = [v12 setWithArray:v13];

    [v14 intersectSet:v11];
    BOOL v8 = [v14 count] != 0;
  }
  return v8;
}

BOOL __83__ATXModeSuggestionScorer__areConfiguredTriggers_conflictingWithSuggestedTriggers___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  BOOL v3 = (objc_opt_isKindOfClass() & 1) != 0 && [v2 enabledSetting] == 2;

  return v3;
}

uint64_t __83__ATXModeSuggestionScorer__areConfiguredTriggers_conflictingWithSuggestedTriggers___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F4AE80] DNDModeConfigurationTriggerClassFromATXTrigger:a2];
}

uint64_t __83__ATXModeSuggestionScorer__areConfiguredTriggers_conflictingWithSuggestedTriggers___block_invoke_3()
{
  return objc_opt_class();
}

- (BOOL)_isSameActivityAndSource:(id)a3
{
  id v4 = a3;
  id v5 = [v4 modeUUID];
  if (v5 && (modeUUID = self->_modeUUID, v5, modeUUID))
  {
    int v7 = [v4 modeUUID];
    char v8 = [v7 isEqualToString:self->_modeUUID];

    if ((v8 & 1) == 0) {
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v9 = [v4 modeUUID];
    if (v9) {
      goto LABEL_6;
    }
    if (self->_modeUUID) {
      goto LABEL_15;
    }
  }
  uint64_t v10 = [v4 origin];
  if (v10 != BMUserFocusInferredModeOriginToLegacy()) {
    goto LABEL_15;
  }
  uint64_t v11 = [v4 originAnchorType];
  if (!v11 || (originAnchorType = self->_originAnchorType, v11, !originAnchorType))
  {
    uint64_t v9 = [v4 originAnchorType];
    if (!v9)
    {
      if (!self->_originAnchorType) {
        goto LABEL_12;
      }
LABEL_15:
      BOOL v15 = 0;
      goto LABEL_16;
    }
LABEL_6:

    goto LABEL_15;
  }
  __int16 v13 = [v4 originAnchorType];
  char v14 = [v13 isEqualToString:self->_originAnchorType];

  if ((v14 & 1) == 0) {
    goto LABEL_15;
  }
LABEL_12:
  BOOL v15 = 1;
LABEL_16:

  return v15;
}

- (BOOL)_hasLaunchedAppOnAtLeastTwoSeparateDays
{
  [(ATXAppLaunches *)self->_appLaunchStream uniqueDaysAppHasBeenLaunchedOverLast28Days:self->_originBundleId];
  return v2 >= 2.0;
}

- (void)_populateFeedbackScoresIfNeeded
{
  if (!self->_feedbackScore || !self->_rejectionsInPastWeek) {
    [(ATXModeSuggestionScorer *)self _populateFeedbackScores];
  }
}

- (void)_populateFeedbackScores
{
  uint64_t v73 = 0;
  double v74 = (double *)&v73;
  uint64_t v75 = 0x2020000000;
  uint64_t v76 = 0;
  uint64_t v69 = 0;
  double v70 = (double *)&v69;
  uint64_t v71 = 0x2020000000;
  uint64_t v72 = 0;
  uint64_t v65 = 0;
  double v66 = (double *)&v65;
  uint64_t v67 = 0x2020000000;
  uint64_t v68 = 0;
  uint64_t v61 = 0;
  v62 = (double *)&v61;
  uint64_t v63 = 0x2020000000;
  uint64_t v64 = 0;
  uint64_t v57 = 0;
  BOOL v58 = (double *)&v57;
  uint64_t v59 = 0x2020000000;
  uint64_t v60 = 0;
  uint64_t v53 = 0;
  v54 = (double *)&v53;
  uint64_t v55 = 0x2020000000;
  uint64_t v56 = 0;
  BOOL v3 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v4 = [MEMORY[0x1E4F1C9C8] now];
  id v5 = [v3 dateByAddingUnit:16 value:-7 toDate:v4 options:0];

  id v6 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  int v7 = [MEMORY[0x1E4F1C9C8] now];
  char v8 = [v6 dateByAddingUnit:16 value:-1 toDate:v7 options:0];

  feedbackStream = self->_feedbackStream;
  [v5 timeIntervalSinceReferenceDate];
  uint64_t v10 = -[ATXActivitySuggestionFeedbackStream publisherFromStartTime:](feedbackStream, "publisherFromStartTime:");
  uint64_t v11 = [v10 filterWithIsIncluded:&__block_literal_global_100];
  uint64_t v41 = MEMORY[0x1E4F143A8];
  uint64_t v42 = 3221225472;
  __int16 v43 = __50__ATXModeSuggestionScorer__populateFeedbackScores__block_invoke_3;
  v44 = &unk_1E68ADAE0;
  __int16 v45 = self;
  __int16 v47 = &v73;
  id v12 = v8;
  id v46 = v12;
  BOOL v48 = &v69;
  __int16 v49 = &v61;
  BOOL v50 = &v65;
  uint64_t v51 = &v53;
  double v52 = &v57;
  id v13 = (id)[v11 sinkWithCompletion:&__block_literal_global_102 receiveInput:&v41];

  objc_msgSend(NSNumber, "numberWithDouble:", v74[3], v41, v42, v43, v44, v45);
  char v14 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  rejectionsInPastWeek = self->_rejectionsInPastWeek;
  self->_rejectionsInPastWeek = v14;

  uint64_t v16 = [NSNumber numberWithDouble:v70[3]];
  timesShownInLastDay = self->_timesShownInLastDay;
  self->_timesShownInLastDay = v16;

  uint64_t v18 = [[ATXActivitySuggestionsFeedbackProcessor alloc] initWithFeedbackStream:self->_feedbackStream feedbackHistogramHelper:self->_feedbackHistogramHelper];
  [(ATXActivitySuggestionsFeedbackProcessor *)v18 processFeedbackWithXPCActivity:0];

  char v19 = [NSNumber numberWithDouble:v66[3]];
  rejectionsAcrossAllModesInPastDay = self->_rejectionsAcrossAllModesInPastDay;
  self->_rejectionsAcrossAllModesInPastDay = v19;

  double v21 = [NSNumber numberWithDouble:v58[3]];
  timesShownAcrossAllModesInPastDay = self->_timesShownAcrossAllModesInPastDay;
  self->_timesShownAcrossAllModesInPastDay = v21;

  double v23 = [NSNumber numberWithDouble:v54[3]];
  timesShownAcrossAllModesInPastWeek = self->_timesShownAcrossAllModesInPastWeek;
  self->_timesShownAcrossAllModesInPastWeek = v23;

  v25 = [NSNumber numberWithDouble:v62[3]];
  rejectionsAcrossAllModesInPastWeek = self->_rejectionsAcrossAllModesInPastWeek;
  self->_rejectionsAcrossAllModesInPastWeek = v25;

  [(ATXActivitySuggestionsFeedbackHistogramHelper *)self->_feedbackHistogramHelper suggestionsGivenForLockScreenSuggestionWithModeUUID:self->_modeUUID modeType:self->_modeType origin:self->_origin originAnchorType:self->_originAnchorType];
  double v28 = v27;
  [(ATXActivitySuggestionsFeedbackHistogramHelper *)self->_feedbackHistogramHelper acceptancesForLockScreenSuggestionWithModeUUID:self->_modeUUID modeType:self->_modeType origin:self->_origin originAnchorType:self->_originAnchorType];
  double v30 = v29;
  [(ATXActivitySuggestionsFeedbackHistogramHelper *)self->_feedbackHistogramHelper rejectionsForLockScreenSuggestionWithModeUUID:self->_modeUUID modeType:self->_modeType origin:self->_origin originAnchorType:self->_originAnchorType];
  double v32 = v31;
  double v33 = [NSNumber numberWithDouble:(v30 + 1.0) / (v28 + 1.0)];
  feedbackScore = self->_feedbackScore;
  self->_feedbackScore = v33;

  int v35 = [NSNumber numberWithDouble:v32];
  totalRejections = self->_totalRejections;
  self->_totalRejections = v35;

  __int16 v37 = [NSNumber numberWithDouble:v28 - v30 - v32];
  totalIgnores = self->_totalIgnores;
  self->_totalIgnores = v37;

  double v39 = [NSNumber numberWithDouble:v28];
  timesShown = self->_timesShown;
  self->_timesShown = v39;

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(&v73, 8);
}

BOOL __50__ATXModeSuggestionScorer__populateFeedbackScores__block_invoke(uint64_t a1, void *a2)
{
  double v2 = [a2 eventBody];
  BOOL v3 = [v2 location] == 1;

  return v3;
}

void __50__ATXModeSuggestionScorer__populateFeedbackScores__block_invoke_3(void *a1, void *a2)
{
  id v16 = a2;
  BOOL v3 = [v16 eventBody];
  id v4 = (void *)a1[4];
  id v5 = [v3 activity];
  LODWORD(v4) = [v4 _isSameActivityAndSource:v5];

  if (!v4)
  {
    id v6 = (void *)MEMORY[0x1E4F1C9C8];
    [v16 timestamp];
    int v7 = objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:");
    if ([v3 eventType] == 3)
    {
      *(double *)(*(void *)(a1[8] + 8) + 24) = *(double *)(*(void *)(a1[8] + 8) + 24) + 1.0;
      char v8 = [v7 earlierDate:a1[5]];
      uint64_t v9 = (void *)a1[5];

      if (v8 != v9)
      {
LABEL_14:

        goto LABEL_15;
      }
      uint64_t v10 = a1[9];
    }
    else
    {
      if ([v3 eventType]) {
        goto LABEL_14;
      }
      *(double *)(*(void *)(a1[10] + 8) + 24) = *(double *)(*(void *)(a1[10] + 8) + 24) + 1.0;
      char v14 = [v7 earlierDate:a1[5]];
      BOOL v15 = (void *)a1[5];

      if (v14 != v15) {
        goto LABEL_14;
      }
      uint64_t v10 = a1[11];
    }
    *(double *)(*(void *)(v10 + 8) + 24) = *(double *)(*(void *)(v10 + 8) + 24) + 1.0;
    goto LABEL_14;
  }
  if ([v3 eventType] == 3)
  {
    *(double *)(*(void *)(a1[6] + 8) + 24) = *(double *)(*(void *)(a1[6] + 8) + 24) + 1.0;
    goto LABEL_15;
  }
  if (![v3 eventType])
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1C9C8];
    [v16 timestamp];
    int v7 = objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
    id v12 = [v7 earlierDate:a1[5]];
    id v13 = (void *)a1[5];

    if (v12 == v13) {
      *(double *)(*(void *)(a1[7] + 8) + 24) = *(double *)(*(void *)(a1[7] + 8) + 24) + 1.0;
    }
    goto LABEL_14;
  }
LABEL_15:
}

- (id)_lockScreenSuggestionThresholds
{
  BOOL v3 = [MEMORY[0x1E4F4AF08] dictionaryForClass:objc_opt_class()];
  id v4 = [v3 objectForKeyedSubscript:@"lockScreenSuggestionThresholds"];
  if ([(ATXModeSuggestionScorer *)self isModeConfigured]) {
    id v5 = @"modeIsConfiguredThresholds";
  }
  else {
    id v5 = @"modeIsNotConfiguredThresholds";
  }
  id v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDNDMode, 0);
  objc_storeStrong((id *)&self->_cachedIsModeConfigured, 0);
  objc_storeStrong((id *)&self->_cachedIsUserCurrentlyInADifferentMode, 0);
  objc_storeStrong((id *)&self->_cachedIsUserCurrentlyInMode, 0);
  objc_storeStrong((id *)&self->_rejectionsAcrossAllModesInPastWeek, 0);
  objc_storeStrong((id *)&self->_timesShownAcrossAllModesInPastWeek, 0);
  objc_storeStrong((id *)&self->_timesShownAcrossAllModesInPastDay, 0);
  objc_storeStrong((id *)&self->_rejectionsAcrossAllModesInPastDay, 0);
  objc_storeStrong((id *)&self->_timesShown, 0);
  objc_storeStrong((id *)&self->_timesShownInLastDay, 0);
  objc_storeStrong((id *)&self->_totalIgnores, 0);
  objc_storeStrong((id *)&self->_totalRejections, 0);
  objc_storeStrong((id *)&self->_rejectionsInPastWeek, 0);
  objc_storeStrong((id *)&self->_feedbackScore, 0);
  objc_storeStrong((id *)&self->_groundTruthModeStream, 0);
  objc_storeStrong((id *)&self->_appLaunchStream, 0);
  objc_storeStrong((id *)&self->_feedbackHistogramHelper, 0);
  objc_storeStrong((id *)&self->_feedbackStream, 0);
  objc_storeStrong((id *)&self->_configuredModeService, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_originBundleId, 0);
  objc_storeStrong((id *)&self->_originAnchorType, 0);
  objc_storeStrong((id *)&self->_modeUUID, 0);
}

- (void)_shouldSuggestOnLockScreenWithDefaults:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "ATXModeSuggestionScorer: Expected NSDate for dateDrivingSetupSuggestionLastShown.", v1, 2u);
}

@end