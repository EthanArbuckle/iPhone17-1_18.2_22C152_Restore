@interface ACHVisibilityEvaluator
- (ACHVisibilityEvaluator)init;
- (BOOL)unearnedAchievementIsVisibleNow:(id)a3;
- (BOOL)unearnedAchievementIsVisibleNow:(id)a3 activityMoveMode:(int64_t)a4;
- (BOOL)unearnedAchievementIsVisibleNow:(id)a3 activityMoveMode:(int64_t)a4 experienceType:(unint64_t)a5;
- (BOOL)unearnedAchievementIsVisibleNow:(id)a3 activityMoveMode:(int64_t)a4 experienceType:(unint64_t)a5 isFitnessPlusSubscriber:(BOOL)a6;
- (BOOL)unearnedAchievementIsVisibleNow:(id)a3 activityMoveMode:(int64_t)a4 experienceType:(unint64_t)a5 isFitnessPlusSubscriber:(BOOL)a6 isWheelchairUser:(BOOL)a7;
- (NSCalendar)calendar;
- (NSDate)injectedNow;
- (NSNumber)injectedIsStandalonePhoneFitnessMode;
- (NSString)injectedWatchCountryCode;
- (void)_injectIsStandalonePhoneFitnessMode:(BOOL)a3;
- (void)setCalendar:(id)a3;
- (void)setInjectedIsStandalonePhoneFitnessMode:(id)a3;
- (void)setInjectedNow:(id)a3;
- (void)setInjectedWatchCountryCode:(id)a3;
@end

@implementation ACHVisibilityEvaluator

- (BOOL)unearnedAchievementIsVisibleNow:(id)a3 activityMoveMode:(int64_t)a4 experienceType:(unint64_t)a5 isFitnessPlusSubscriber:(BOOL)a6 isWheelchairUser:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v63 = a6;
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v11 = a3;
  v12 = [v11 template];
  v13 = [(ACHVisibilityEvaluator *)self injectedNow];
  v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    id v15 = [MEMORY[0x263EFF910] date];
  }
  id v16 = v15;

  v17 = [(ACHVisibilityEvaluator *)self injectedIsStandalonePhoneFitnessMode];
  if (v17)
  {
    v18 = [(ACHVisibilityEvaluator *)self injectedIsStandalonePhoneFitnessMode];
    uint64_t v19 = [v18 BOOLValue];
  }
  else
  {
    v18 = [MEMORY[0x263F0A980] sharedBehavior];
    uint64_t v19 = [v18 isStandalonePhoneFitnessMode];
  }
  uint64_t v20 = v19;

  v62 = objc_alloc_init(ACHPredicateExpressionValidator);
  v61 = [(ACHPredicateExpressionValidator *)v62 validateTemplate:v12];
  if ([v61 isValid])
  {
    v21 = [v12 graceVisibilityPredicate];
    if (v21 || ([v12 visibilityPredicate], (v21 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v22 = objc_alloc_init(ACHVisibilityEnvironment);
      [(ACHVisibilityEnvironment *)v22 setActivityMoveMode:a4];
      [(ACHVisibilityEnvironment *)v22 setExperienceType:a5];
      [(ACHVisibilityEnvironment *)v22 setIsStandalonePhoneFitnessMode:v20];
      -[ACHVisibilityEnvironment setPrerequisiteMet:](v22, "setPrerequisiteMet:", [v11 prerequisiteMet]);
      -[ACHVisibilityEnvironment setEarnedInstanceCount:](v22, "setEarnedInstanceCount:", [v11 earnedInstanceCount]);
      [(ACHVisibilityEnvironment *)v22 setIsWheelchairUser:v7];
      v23 = [MEMORY[0x263F08A98] predicateWithFormat:v21];
      int v60 = [v23 evaluateWithObject:v22];
    }
    else
    {
      int v60 = 1;
    }
  }
  else
  {
    int v60 = 0;
  }
  uint64_t v24 = [v12 visibilityStart];
  if (v24
    && (v25 = (void *)v24,
        [v12 visibilityEnd],
        v26 = objc_claimAutoreleasedReturnValue(),
        v26,
        v25,
        v26))
  {
    v27 = [(ACHVisibilityEvaluator *)self calendar];
    v28 = [v12 visibilityStart];
    v29 = [v27 dateFromComponents:v28];

    v30 = [(ACHVisibilityEvaluator *)self calendar];
    v31 = [v12 visibilityEnd];
    v32 = [v30 dateFromComponents:v31];

    v33 = [(ACHVisibilityEvaluator *)self calendar];
    v34 = objc_msgSend(v33, "hk_startOfDateByAddingDays:toDate:", 1, v32);

    v35 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v29 endDate:v34];
    int v65 = [v35 containsDate:v16];
  }
  else
  {
    int v65 = 1;
  }
  v36 = [v12 availableCountryCodes];
  v37 = (void *)[v36 count];

  if (v37)
  {
    v38 = [(ACHVisibilityEvaluator *)self injectedWatchCountryCode];
    v39 = v38;
    if (v38)
    {
      id v40 = v38;
    }
    else
    {
      ACHPairedWatchCountryCode();
      id v40 = (id)objc_claimAutoreleasedReturnValue();
    }
    v42 = v40;

    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    v43 = [v12 availableCountryCodes];
    uint64_t v44 = [v43 countByEnumeratingWithState:&v66 objects:v84 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      v37 = *(void **)v67;
      while (2)
      {
        for (uint64_t i = 0; i != v45; ++i)
        {
          if (*(void **)v67 != v37) {
            objc_enumerationMutation(v43);
          }
          if (![*(id *)(*((void *)&v66 + 1) + 8 * i) caseInsensitiveCompare:v42])
          {
            int v41 = 1;
            goto LABEL_31;
          }
        }
        uint64_t v45 = [v43 countByEnumeratingWithState:&v66 objects:v84 count:16];
        if (v45) {
          continue;
        }
        break;
      }
    }
    int v41 = 0;
LABEL_31:
  }
  else
  {
    int v41 = 1;
  }
  if (ACHTemplateIsRemote(v12)
    && (unint64_t)[v12 mobileAssetVersion] >= 4
    && ([v12 availableOnPairedDevice] & 1) == 0)
  {
    v59 = ACHLogTemplates();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG)) {
      -[ACHVisibilityEvaluator unearnedAchievementIsVisibleNow:activityMoveMode:experienceType:isFitnessPlusSubscriber:isWheelchairUser:](v12, v59);
    }

    int v47 = 0;
  }
  else
  {
    int v47 = 1;
  }
  v48 = [v12 goalExpression];
  if (!v48)
  {
    v37 = [v12 graceGoalExpression];
    if (!v37)
    {
      v49 = v16;
      BOOL v53 = 0;
LABEL_44:

      goto LABEL_45;
    }
  }
  v49 = v16;
  v50 = [v11 goal];
  if (v50)
  {
    v51 = [v11 goal];
    [v51 _value];
    BOOL v53 = v52 == 0.0;
  }
  else
  {
    BOOL v53 = 1;
  }

  if (!v48) {
    goto LABEL_44;
  }
LABEL_45:

  v54 = [v12 sourceName];
  int v55 = [v54 isEqualToString:@"FitnessPlusAwards"];

  int v56 = v55 ^ 1 | v63;
  if (((v60 & v65) & !v53 & (v41 & v47) & v56 & 1) == 0)
  {
    v57 = ACHLogDefault();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
    {
      v64 = [v12 uniqueName];
      *(_DWORD *)buf = 138413826;
      v71 = v64;
      __int16 v72 = 1024;
      int v73 = v60;
      __int16 v74 = 1024;
      int v75 = v65;
      __int16 v76 = 1024;
      int v77 = v41;
      __int16 v78 = 1024;
      int v79 = v47;
      __int16 v80 = 1024;
      int v81 = !v53;
      __int16 v82 = 1024;
      int v83 = v56;
      _os_log_debug_impl(&dword_21F582000, v57, OS_LOG_TYPE_DEBUG, "[%@] not visibile: visibleForPredicate = %{BOOL}d,\nvisibleForDates = %{BOOL}d,\nvisibleForCountryCode = %{BOOL}d,\nvisibleOnPairedDevice = %{BOOL}d,\nvisibleForGoalValue = %{BOOL}d,\nvisibleForFitnessPlusSubscriptionState = %{BOOL}d", buf, 0x30u);
    }
  }

  return v60 & v65 & !v53 & v41 & v47 & v56;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (NSDate)injectedNow
{
  return self->_injectedNow;
}

- (NSNumber)injectedIsStandalonePhoneFitnessMode
{
  return self->_injectedIsStandalonePhoneFitnessMode;
}

- (BOOL)unearnedAchievementIsVisibleNow:(id)a3 activityMoveMode:(int64_t)a4 experienceType:(unint64_t)a5 isFitnessPlusSubscriber:(BOOL)a6
{
  return [(ACHVisibilityEvaluator *)self unearnedAchievementIsVisibleNow:a3 activityMoveMode:a4 experienceType:a5 isFitnessPlusSubscriber:a6 isWheelchairUser:0];
}

- (BOOL)unearnedAchievementIsVisibleNow:(id)a3 activityMoveMode:(int64_t)a4 experienceType:(unint64_t)a5
{
  return [(ACHVisibilityEvaluator *)self unearnedAchievementIsVisibleNow:a3 activityMoveMode:a4 experienceType:a5 isFitnessPlusSubscriber:0];
}

- (ACHVisibilityEvaluator)init
{
  v6.receiver = self;
  v6.super_class = (Class)ACHVisibilityEvaluator;
  v2 = [(ACHVisibilityEvaluator *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendarWithLocalTimeZone");
    calendar = v2->_calendar;
    v2->_calendar = (NSCalendar *)v3;
  }
  return v2;
}

- (BOOL)unearnedAchievementIsVisibleNow:(id)a3
{
  return [(ACHVisibilityEvaluator *)self unearnedAchievementIsVisibleNow:a3 activityMoveMode:1 experienceType:3];
}

- (BOOL)unearnedAchievementIsVisibleNow:(id)a3 activityMoveMode:(int64_t)a4
{
  return [(ACHVisibilityEvaluator *)self unearnedAchievementIsVisibleNow:a3 activityMoveMode:a4 experienceType:3];
}

- (void)_injectIsStandalonePhoneFitnessMode:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(ACHVisibilityEvaluator *)self setInjectedIsStandalonePhoneFitnessMode:v4];
}

- (void)setCalendar:(id)a3
{
}

- (void)setInjectedNow:(id)a3
{
}

- (NSString)injectedWatchCountryCode
{
  return self->_injectedWatchCountryCode;
}

- (void)setInjectedWatchCountryCode:(id)a3
{
}

- (void)setInjectedIsStandalonePhoneFitnessMode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_injectedIsStandalonePhoneFitnessMode, 0);
  objc_storeStrong((id *)&self->_injectedWatchCountryCode, 0);
  objc_storeStrong((id *)&self->_injectedNow, 0);

  objc_storeStrong((id *)&self->_calendar, 0);
}

- (void)unearnedAchievementIsVisibleNow:(void *)a1 activityMoveMode:(NSObject *)a2 experienceType:isFitnessPlusSubscriber:isWheelchairUser:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 uniqueName];
  int v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_21F582000, a2, OS_LOG_TYPE_DEBUG, "Template %@ is not available on the paired device, so we won't show it on this device.", (uint8_t *)&v4, 0xCu);
}

@end