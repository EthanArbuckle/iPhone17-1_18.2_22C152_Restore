@interface ACHAchievementLocalizationProvider
- (ACHAchievementLocalizationProvider)init;
- (ACHUnitManager)achUnitManager;
- (BOOL)isPregnant;
- (BOOL)paused;
- (BOOL)wheelchairUser;
- (NSCalendar)gregorianCalendar;
- (NSDate)currentDateOverride;
- (NSLocale)currentLocaleOverride;
- (NSString)name;
- (id)_achievementValueWithAchievement:(id)a3;
- (id)_allStringCombinationsWithPrefix:(id)a3 andSuffixes:(id)a4;
- (id)_backDateStringForDate:(id)a3 achievement:(id)a4 dateStyle:(unint64_t)a5;
- (id)_calculateSuffixCombinations:(id)a3;
- (id)_descriptionKeyForLongestMoveStreak:(id)a3;
- (id)_formatValue:(id)a3 forPlaceholder:(id)a4 usingFormatterNamed:(id)a5 template:(id)a6;
- (id)_formatValue:(id)a3 usingFormatterNamed:(id)a4 template:(id)a5 forCanonicalUnit:(id)a6;
- (id)_formattedEnergyValue:(id)a3 canonicalUnit:(id)a4 unitStyle:(int64_t)a5;
- (id)_formattedEnergyValueWithoutUnit:(id)a3 canonicalUnit:(id)a4;
- (id)_formattedMoveGoal:(id)a3 template:(id)a4;
- (id)_formattedMoveTimeValue:(id)a3;
- (id)_goalValueWithAchievement:(id)a3;
- (id)_localizedStringWithKey:(id)a3 withAchievement:(id)a4 experienceType:(unint64_t)a5;
- (id)_localizedStringWithKey:(id)a3 withAchievement:(id)a4 localizationBundleURL:(id)a5 experienceType:(unint64_t)a6;
- (id)_pluralizeLocalizedString:(id)a3 withAchievement:(id)a4;
- (id)_progressValueWithAchievement:(id)a3;
- (id)_quantityToGoalValueWithAchievement:(id)a3;
- (id)_remainingProgressValueWithUnit:(id)a3 achievement:(id)a4;
- (id)_replacePlaceholdersInString:(id)a3 withAchievement:(id)a4;
- (id)_stringByTrimmingPlaceholderMarkersFromString:(id)a3;
- (id)_suffixesForLocalizedStringLookup;
- (id)_userEnergyUnitSuffix;
- (id)_valueFromPlaceholder:(id)a3 withAchievement:(id)a4;
- (id)achievedAlertBackDescriptionForAchievement:(id)a3 sizeVariant:(int64_t)a4 dateSizeVariant:(int64_t)a5;
- (id)achievedAlertDescriptionForAchievement:(id)a3 fitnessExperienceType:(unint64_t)a4;
- (id)achievedDescriptionForAchievement:(id)a3;
- (id)achievedShortDescriptionForAchievement:(id)a3;
- (id)currentDate;
- (id)currentLocale;
- (id)friendAchievedDescriptionForAchievement:(id)a3;
- (id)friendAchievedTitleForAchievement:(id)a3;
- (id)shareDescriptionForAchievement:(id)a3;
- (id)titleForAchievement:(id)a3;
- (id)unachievedAlertBackDescriptionForAchievement:(id)a3;
- (id)unachievedAlertDescriptionForAchievement:(id)a3 fitnessExperienceType:(unint64_t)a4;
- (id)unachievedDescriptionForAchievement:(id)a3;
- (id)unachievedShortDescriptionForAchievement:(id)a3;
- (int64_t)activityMoveMode;
- (void)setAchUnitManager:(id)a3;
- (void)setActivityMoveMode:(int64_t)a3;
- (void)setCurrentDateOverride:(id)a3;
- (void)setCurrentLocaleOverride:(id)a3;
- (void)setGregorianCalendar:(id)a3;
- (void)setIsPregnant:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setWheelchairUser:(BOOL)a3;
@end

@implementation ACHAchievementLocalizationProvider

void __83__ACHAchievementLocalizationProvider__replacePlaceholdersInString_withAchievement___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 range];
  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v3, v4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) addObject:v5];
}

void __83__ACHAchievementLocalizationProvider__allStringCombinationsWithPrefix_andSuffixes___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = NSString;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = [a2 componentsJoinedByString:&stru_26D0EC7B0];
  id v6 = [v3 stringWithFormat:@"%@%@", v4, v5];

  [*(id *)(a1 + 40) addObject:v6];
}

- (id)_calculateSuffixCombinations:(id)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([v3 count])
  {
    unint64_t v5 = 0;
    do
    {
      uint64_t v6 = [v4 count];
      if (v6)
      {
        uint64_t v7 = v6;
        for (uint64_t i = 0; i != v7; ++i)
        {
          id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
          v10 = [v3 objectAtIndexedSubscript:v5];
          [v9 addObject:v10];

          v11 = [v4 objectAtIndexedSubscript:i];
          [v9 addObjectsFromArray:v11];

          [v4 addObject:v9];
        }
      }
      v12 = [v3 objectAtIndexedSubscript:v5];
      v16[0] = v12;
      v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
      [v4 addObject:v13];

      ++v5;
    }
    while (v5 < [v3 count]);
  }
  v14 = (void *)[v4 copy];

  return v14;
}

- (void)setWheelchairUser:(BOOL)a3
{
  self->_wheelchairUser = a3;
}

- (void)setAchUnitManager:(id)a3
{
}

- (id)unachievedShortDescriptionForAchievement:(id)a3
{
  id v4 = a3;
  if ([(ACHAchievementLocalizationProvider *)self paused]
    && ([v4 section],
        unint64_t v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 isEqualToString:@"ACTIVITY"],
        v5,
        (v6 & 1) != 0))
  {
    uint64_t v7 = @"ACHIEVEMENT_UNACHIEVED_SHORT_DESCRIPTION";
  }
  else
  {
    uint64_t v7 = [(ACHAchievementLocalizationProvider *)self localizedStringForKey:@"ACHIEVEMENT_UNACHIEVED_SHORT_DESCRIPTION" withAchievement:v4 fitnessExperienceType:1];
  }

  return v7;
}

- (BOOL)paused
{
  return self->_paused;
}

- (id)titleForAchievement:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ACHAchievementLocalizationProvider *)self localizedStringForKey:@"ACHIEVEMENT_TITLE" withAchievement:v4 fitnessExperienceType:1];
  BOOL v6 = ACHIsActivityAchievementPrerelease(v4);

  if (v6 && ([v5 containsString:@"[Prerelease]"] & 1) == 0)
  {
    id v7 = [NSString stringWithFormat:@"[Prerelease] %@", v5];
  }
  else
  {
    id v7 = v5;
  }
  v8 = v7;

  return v8;
}

- (id)_localizedStringWithKey:(id)a3 withAchievement:(id)a4 experienceType:(unint64_t)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = [v8 localizationBundleURL];
  if (v9)
  {
    if (ACHMonthlyChallengeShouldUseAvailableSuffixes(v8))
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      v10 = [v8 template];
      v11 = [v10 availableSuffixes];

      id obj = v11;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v29;
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v29 != v14) {
              objc_enumerationMutation(obj);
            }
            uint64_t v16 = *(void *)(*((void *)&v28 + 1) + 8 * i);
            v17 = NSURL;
            v18 = [v9 path];
            v19 = [v18 stringByAppendingString:v16];
            v20 = [v17 fileURLWithPath:v19];

            v21 = [(ACHAchievementLocalizationProvider *)self _localizedStringWithKey:v7 withAchievement:v8 localizationBundleURL:v20 experienceType:a5];
            v22 = v21;
            if (v21 && ![v21 isEqualToString:v7])
            {

              goto LABEL_18;
            }
          }
          uint64_t v13 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }
    }
    id v23 = [(ACHAchievementLocalizationProvider *)self _localizedStringWithKey:v7 withAchievement:v8 localizationBundleURL:v9 experienceType:a5];
  }
  else
  {
    v24 = ACHLogDefault();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[ACHAchievementLocalizationProvider _localizedStringWithKey:withAchievement:experienceType:]((uint64_t)v7, v8, v24);
    }

    id v23 = v7;
  }
  v22 = v23;
LABEL_18:

  return v22;
}

- (id)_localizedStringWithKey:(id)a3 withAchievement:(id)a4 localizationBundleURL:(id)a5 experienceType:(unint64_t)a6
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [MEMORY[0x263F086E0] bundleWithURL:v12];
  if (v13)
  {
    v38 = [(ACHAchievementLocalizationProvider *)self _suffixesForLocalizedStringLookup];
    uint64_t v14 = -[ACHAchievementLocalizationProvider _allStringCombinationsWithPrefix:andSuffixes:](self, "_allStringCombinationsWithPrefix:andSuffixes:", v10);
    v36 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"length" ascending:1];
    v39 = v36;
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v39 count:1];
    v37 = v14;
    uint64_t v16 = [v14 sortedArrayUsingDescriptors:v15];
    v17 = (void *)[v16 mutableCopy];

    v18 = @"Localizable";
    if (a6 == 2) {
      v18 = @"Localizable-Modified-tinker";
    }
    if (a6 == 3) {
      v18 = @"Localizable-Simplified-tinker";
    }
    v19 = v18;
    v20 = 0;
    if (![v17 count]) {
      goto LABEL_32;
    }
    do
    {
      v21 = v20;
      v22 = [v17 lastObject];
      v20 = FIRandomStringForPrefixWithTableName();

      if (v20 && ![v20 isEqualToString:v22])
      {
        char v23 = 1;
      }
      else
      {
        [v17 removeLastObject];
        char v23 = 0;
      }

      uint64_t v24 = [v17 count];
    }
    while ((v23 & 1) == 0 && v24);
    if ((v23 & 1) == 0)
    {
LABEL_32:
      v25 = v20;
      v20 = FIRandomStringForPrefixWithTableName();

      if (!v20 || [v20 isEqualToString:v10])
      {
        v26 = FIRandomStringForPrefixWithTableName();

        if (!v26) {
          goto LABEL_20;
        }
        v20 = v26;
        if ([v26 isEqualToString:v10]) {
          goto LABEL_20;
        }
      }
    }
    v26 = [(ACHAchievementLocalizationProvider *)self _pluralizeLocalizedString:v20 withAchievement:v11];

    if (!v26
      || ([(ACHAchievementLocalizationProvider *)self _replacePlaceholdersInString:v26 withAchievement:v11], (id v27 = (id)objc_claimAutoreleasedReturnValue()) == 0))
    {
LABEL_20:
      long long v28 = ACHLogDefault();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v35 = [v11 template];
        long long v31 = [v35 uniqueName];
        v32 = [v13 bundlePath];
        *(_DWORD *)buf = 138543874;
        id v41 = v10;
        __int16 v42 = 2114;
        v43 = v31;
        __int16 v44 = 2114;
        id v45 = v32;
        _os_log_error_impl(&dword_21F582000, v28, OS_LOG_TYPE_ERROR, "No localization found for key (%{public}@) for achievement (%{public}@} in bundle path (%{public}@)", buf, 0x20u);
      }
      id v27 = v10;
    }
  }
  else
  {
    long long v29 = ACHLogDefault();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      uint64_t v33 = [v11 template];
      v34 = [v33 uniqueName];
      *(_DWORD *)buf = 138543874;
      id v41 = v10;
      __int16 v42 = 2114;
      v43 = v34;
      __int16 v44 = 2114;
      id v45 = v12;
      _os_log_error_impl(&dword_21F582000, v29, OS_LOG_TYPE_ERROR, "Could not load localization bundle for key: %{public}@, achievement: %{public}@}, localizationBundleURL: %{public}@}", buf, 0x20u);
    }
    id v27 = v10;
  }

  return v27;
}

- (id)_suffixesForLocalizedStringLookup
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([(NSString *)self->_name length]) {
    [v3 addObject:@"_NAME"];
  }
  if (self->_wheelchairUser && self->_activityMoveMode != 2) {
    [v3 addObject:@"_WHEELCHAIR"];
  }
  if (self->_activityMoveMode != 2)
  {
    id v4 = [(ACHAchievementLocalizationProvider *)self _userEnergyUnitSuffix];
    [v3 addObject:v4];
  }
  unint64_t v5 = [MEMORY[0x263F0A980] sharedBehavior];
  int v6 = [v5 isStandalonePhoneFitnessMode];

  if (v6) {
    [v3 addObject:@"_STANDALONE_PHONE"];
  }
  if (self->_isPregnant) {
    [v3 addObject:@"_PREGNANCY"];
  }
  id v7 = (void *)[v3 copy];

  return v7;
}

- (id)_userEnergyUnitSuffix
{
  id v3 = [(ACHAchievementLocalizationProvider *)self achUnitManager];

  if (v3)
  {
    id v4 = [(ACHAchievementLocalizationProvider *)self achUnitManager];
    unint64_t v5 = [v4 userActiveEnergyBurnedUnit];
  }
  else
  {
    unint64_t v5 = 0;
  }
  int v6 = [MEMORY[0x263F0A830] jouleUnitWithMetricPrefix:9];
  char v7 = [v5 isEqual:v6];

  if (v7)
  {
    id v8 = @"_KJ";
  }
  else
  {
    id v9 = [MEMORY[0x263F0A830] kilocalorieUnit];
    int v10 = [v5 isEqual:v9];

    if (v10) {
      id v8 = @"_KCAL";
    }
    else {
      id v8 = @"_CAL";
    }
  }

  return v8;
}

- (ACHUnitManager)achUnitManager
{
  return self->_achUnitManager;
}

- (id)_replacePlaceholdersInString:(id)a3 withAchievement:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v28 = a4;
  char v23 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"\\{\\{.*?\\}\\}" options:0 error:0];
  int v6 = [MEMORY[0x263EFF980] array];
  uint64_t v7 = [v5 length];
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __83__ACHAchievementLocalizationProvider__replacePlaceholdersInString_withAchievement___block_invoke;
  v34[3] = &unk_264512310;
  id v35 = v5;
  id v8 = v6;
  id v36 = v8;
  id v22 = v35;
  objc_msgSend(v23, "enumerateMatchesInString:options:range:usingBlock:", v35, 0, 0, v7, v34);
  id v27 = (id)[v22 mutableCopy];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v8;
  uint64_t v26 = [obj countByEnumeratingWithState:&v30 objects:v37 count:16];
  if (v26)
  {
    uint64_t v25 = *(void *)v31;
    *(void *)&long long v9 = 138412802;
    long long v21 = v9;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v31 != v25) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "componentsSeparatedByString:", @":", v21);
        uint64_t v13 = [v12 firstObject];
        uint64_t v14 = [(ACHAchievementLocalizationProvider *)self _stringByTrimmingPlaceholderMarkersFromString:v13];

        if ((unint64_t)[v12 count] < 2)
        {
          v15 = 0;
        }
        else
        {
          v15 = [v12 objectAtIndexedSubscript:1];
        }
        uint64_t v16 = [(ACHAchievementLocalizationProvider *)self _stringByTrimmingPlaceholderMarkersFromString:v15];

        v17 = [(ACHAchievementLocalizationProvider *)self _valueFromPlaceholder:v14 withAchievement:v28];
        v18 = [v28 template];
        v19 = [(ACHAchievementLocalizationProvider *)self _formatValue:v17 forPlaceholder:v14 usingFormatterNamed:v16 template:v18];

        objc_msgSend(v27, "replaceOccurrencesOfString:withString:options:range:", v11, v19, 0, 0, objc_msgSend(v27, "length"));
      }
      uint64_t v26 = [obj countByEnumeratingWithState:&v30 objects:v37 count:16];
    }
    while (v26);
  }

  return v27;
}

- (id)_stringByTrimmingPlaceholderMarkersFromString:(id)a3
{
  id v3 = [a3 stringByReplacingOccurrencesOfString:@"{{" withString:&stru_26D0EC7B0];
  id v4 = [v3 stringByReplacingOccurrencesOfString:@"}}" withString:&stru_26D0EC7B0];

  return v4;
}

- (id)_valueFromPlaceholder:(id)a3 withAchievement:(id)a4
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"progress_value"])
  {
    uint64_t v8 = [(ACHAchievementLocalizationProvider *)self _progressValueWithAchievement:v7];
LABEL_13:
    id v12 = (__CFString *)v8;
    goto LABEL_14;
  }
  if ([v6 isEqualToString:@"achievement_value"])
  {
    uint64_t v8 = [(ACHAchievementLocalizationProvider *)self _achievementValueWithAchievement:v7];
    goto LABEL_13;
  }
  if ([v6 isEqualToString:@"daily_target"])
  {
    long long v9 = NSNumber;
    int v10 = [v7 template];
    [v10 dailyTarget];
    objc_msgSend(v9, "numberWithDouble:");
    id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    id v12 = v11;
LABEL_8:

    goto LABEL_14;
  }
  if ([v6 isEqualToString:@"goal_value"])
  {
    uint64_t v8 = [(ACHAchievementLocalizationProvider *)self _goalValueWithAchievement:v7];
    goto LABEL_13;
  }
  if ([v6 isEqualToString:@"quantity_to_goal"])
  {
    uint64_t v8 = [(ACHAchievementLocalizationProvider *)self _quantityToGoalValueWithAchievement:v7];
    goto LABEL_13;
  }
  if ([v6 isEqualToString:@"reference_progress_value"])
  {
    uint64_t v14 = [v7 customPlaceholderValues];
    int v10 = [v14 objectForKeyedSubscript:@"reference_progress_value"];

    if (!v10)
    {
      v15 = ACHLogDefault();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[ACHAchievementLocalizationProvider _valueFromPlaceholder:withAchievement:](v7);
      }
      id v12 = (__CFString *)&unk_26D0FB0B0;
      goto LABEL_47;
    }
    v15 = objc_alloc_init(MEMORY[0x263F08A30]);
    [v15 setNumberStyle:1];
    uint64_t v16 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US"];
    [v15 setLocale:v16];

    id v12 = [v15 numberFromString:v10];
    v17 = ACHLogDefault();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_27;
    }
    v18 = [v7 template];
    v19 = [v18 uniqueName];
    *(_DWORD *)buf = 138543874;
    id v76 = v6;
    __int16 v77 = 2114;
    v78 = v19;
    __int16 v79 = 2114;
    v80 = v12;
    _os_log_impl(&dword_21F582000, v17, OS_LOG_TYPE_DEFAULT, "Value from placeholder %{public}@ for template: %{public}@: %{public}@", buf, 0x20u);
    goto LABEL_21;
  }
  if ([v6 isEqualToString:@"workout_type"])
  {
    v20 = [v7 customPlaceholderValues];
    int v10 = [v20 objectForKeyedSubscript:@"workout_type"];

    if (!v10)
    {
      v15 = ACHLogDefault();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[ACHAchievementLocalizationProvider _valueFromPlaceholder:withAchievement:](v7);
      }
      id v12 = &stru_26D0EC7B0;
      goto LABEL_47;
    }
    long long v21 = [v7 template];
    id v22 = [v21 uniqueName];
    uint64_t v23 = ACHMonthlyChallengeTypeFromTemplateUniqueName(v22);

    ACHWorkoutLocationTypeForMonthlyChallengeType(v23);
    [MEMORY[0x263F0A8F8] _workoutActivityTypeFromString:v10];
    FILocalizedActivityNameWithFormattingPrefixAndIsLocationAgnosticPlural();
    id v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v15 = ACHLogDefault();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
LABEL_47:

      goto LABEL_8;
    }
    v17 = [v7 template];
    v18 = [v17 uniqueName];
    *(_DWORD *)buf = 138543874;
    id v76 = v6;
    __int16 v77 = 2114;
    v78 = v18;
    __int16 v79 = 2114;
    v80 = v12;
    _os_log_impl(&dword_21F582000, v15, OS_LOG_TYPE_DEFAULT, "Value from placeholder %{public}@ for template: %{public}@: %{public}@", buf, 0x20u);
    goto LABEL_26;
  }
  if ([v6 isEqualToString:@"pace_to_reach_goal"])
  {
    uint64_t v24 = [v7 template];
    uint64_t v25 = ACHUnitForTemplateAndActivityMoveMode(v24, self->_activityMoveMode);

    uint64_t v26 = [v7 template];
    int IsMonthlyChallenge = ACHTemplateIsMonthlyChallenge(v26);

    id v12 = (__CFString *)&unk_26D0FB0B0;
    if (!IsMonthlyChallenge || !v25) {
      goto LABEL_60;
    }
    id v28 = [v7 progress];
    [v28 doubleValueForUnit:v25];
    double v30 = v29;

    long long v31 = [v7 goal];
    [v31 doubleValueForUnit:v25];
    double v33 = v32;

    if (v33 - v30 >= 0.0) {
      double v34 = v33 - v30;
    }
    else {
      double v34 = 0.0;
    }
    id v35 = [(ACHAchievementLocalizationProvider *)self gregorianCalendar];
    id v36 = [(ACHAchievementLocalizationProvider *)self currentDate];
    v37 = [v35 components:28 fromDate:v36];

    uint64_t v38 = [v7 template];
    v39 = [v38 availabilityEnd];
    v40 = [v35 components:16 fromDateComponents:v37 toDateComponents:v39 options:0];

    uint64_t v41 = [v40 day];
    if (v41 < 0)
    {
      id v12 = (__CFString *)&unk_26D0FB0B0;
    }
    else
    {
      if (v41) {
        double v34 = v34 / (double)(v41 + 1);
      }
      id v12 = [NSNumber numberWithDouble:v34];
    }

    goto LABEL_56;
  }
  if ([v6 isEqualToString:@"number_of_times_earned"])
  {
    int v42 = ACHShouldUseNewAwardsSystem();
    v43 = NSNumber;
    if (v42)
    {
      uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "earnedInstanceCount"));
      goto LABEL_13;
    }
    int v10 = [v7 earnedInstances];
    objc_msgSend(v43, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
    id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if ([v6 isEqualToString:@"earned_date"])
  {
    if (ACHShouldUseNewAwardsSystem())
    {
      uint64_t v25 = [v7 relevantEarnedInstance];
    }
    else
    {
      __int16 v44 = [v7 earnedInstances];
      uint64_t v25 = [v44 lastObject];
    }
    id v45 = [(ACHAchievementLocalizationProvider *)self gregorianCalendar];
    uint64_t v46 = [v25 earnedDateComponents];
    id v12 = [v45 dateFromComponents:v46];

LABEL_59:
    goto LABEL_60;
  }
  if ([v6 isEqualToString:@"current_date"])
  {
    uint64_t v8 = [(ACHAchievementLocalizationProvider *)self currentDate];
    goto LABEL_13;
  }
  if ([v6 isEqualToString:@"monthly_challenge_month"])
  {
    v47 = [v7 template];
    uint64_t v25 = [v47 uniqueName];

    id v35 = [v25 componentsSeparatedByString:@"_"];
    v48 = [v35 lastObject];
    v49 = objc_msgSend(v35, "objectAtIndex:", objc_msgSend(v35, "count") - 2);
    v50 = [(ACHAchievementLocalizationProvider *)self gregorianCalendar];
    id v51 = objc_alloc_init(MEMORY[0x263EFF918]);
    [v51 setDay:15];
    objc_msgSend(v51, "setMonth:", objc_msgSend(v48, "integerValue"));
    objc_msgSend(v51, "setYear:", objc_msgSend(v49, "integerValue"));
    id v12 = [v50 dateFromComponents:v51];

LABEL_56:
LABEL_60:

    goto LABEL_14;
  }
  if (![v6 isEqualToString:@"seymour_workout_modality"])
  {
    if ([v6 isEqualToString:@"seymour_workout_milestone"])
    {
      v63 = [v7 template];
      v64 = [v63 uniqueName];
      int v10 = [v64 componentsSeparatedByString:@"-"];

      v15 = [v10 lastObject];
      if (!v15)
      {
        v17 = ACHLogDefault();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[ACHAchievementLocalizationProvider _valueFromPlaceholder:withAchievement:].cold.4(v7);
        }
        id v12 = (__CFString *)&unk_26D0FB0B0;
        goto LABEL_27;
      }
      v17 = objc_alloc_init(MEMORY[0x263F08A30]);
      [v17 setNumberStyle:1];
      v65 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US"];
      [v17 setLocale:v65];

      id v12 = [v17 numberFromString:v15];
      v18 = ACHLogDefault();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
LABEL_26:

LABEL_27:
        goto LABEL_47;
      }
      v19 = [v7 template];
      v66 = [v19 uniqueName];
      *(_DWORD *)buf = 138543874;
      id v76 = v6;
      __int16 v77 = 2114;
      v78 = v66;
      __int16 v79 = 2114;
      v80 = v12;
      _os_log_impl(&dword_21F582000, v18, OS_LOG_TYPE_DEFAULT, "Value from placeholder %{public}@ for template: %{public}@: %{public}@", buf, 0x20u);

LABEL_21:
      goto LABEL_26;
    }
    if ([v6 isEqualToString:@"user_first_name"])
    {
      uint64_t v8 = [(ACHAchievementLocalizationProvider *)self name];
      goto LABEL_13;
    }
    if (![v6 isEqualToString:@"vocative_user_first_name"])
    {
      v68 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
      v69 = [v68 invertedSet];
      uint64_t v70 = [v6 rangeOfCharacterFromSet:v69];

      if (v70 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "integerValue"));
        goto LABEL_13;
      }
      v71 = [v7 customPlaceholderValues];
      int v10 = [v71 objectForKeyedSubscript:v6];

      uint64_t v72 = [v10 length];
      v73 = v10;
      if (!v72)
      {
        v74 = ACHLogDefault();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v76 = v6;
          _os_log_impl(&dword_21F582000, v74, OS_LOG_TYPE_DEFAULT, "Unknown localization placeholder: %@", buf, 0xCu);
        }

        v73 = v6;
      }
      id v11 = v73;
      goto LABEL_7;
    }
    uint64_t v25 = [(ACHAchievementLocalizationProvider *)self currentLocale];
    id v67 = [NSString alloc];
    id v45 = [(ACHAchievementLocalizationProvider *)self name];
    id v12 = (__CFString *)objc_msgSend(v67, "initWithFormat:locale:", @"%[VocativeName]@", v25, v45);
    goto LABEL_59;
  }
  v52 = [v7 template];
  v53 = [v52 uniqueName];
  v54 = [v53 componentsSeparatedByString:@"-"];

  if ((unint64_t)[v54 count] < 2)
  {
    v56 = v54;
    v55 = ACHLogDefault();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
      -[ACHAchievementLocalizationProvider _valueFromPlaceholder:withAchievement:](v7);
    }
    id v12 = &stru_26D0EC7B0;
  }
  else
  {
    v55 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v56 = v54;
    v57 = [v54 objectAtIndexedSubscript:1];
    v58 = v57;
    if (self->_wheelchairUser)
    {
      uint64_t v59 = [v57 stringByAppendingString:@"_WHEELCHAIR"];

      v58 = (void *)v59;
    }
    id v12 = [v55 localizedStringForKey:v58 value:&stru_26D0EC7B0 table:@"Localizable"];
    v60 = ACHLogDefault();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      v61 = [v7 template];
      v62 = [v61 uniqueName];
      *(_DWORD *)buf = 138543874;
      id v76 = v6;
      __int16 v77 = 2114;
      v78 = v62;
      __int16 v79 = 2114;
      v80 = v12;
      _os_log_impl(&dword_21F582000, v60, OS_LOG_TYPE_DEFAULT, "Value from placeholder %{public}@ for template: %{public}@: %{public}@", buf, 0x20u);
    }
  }

LABEL_14:

  return v12;
}

- (id)_pluralizeLocalizedString:(id)a3 withAchievement:(id)a4
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v40 = a4;
  id v6 = v5;
  long long v51 = 0uLL;
  uint64_t v52 = 0;
  if (![v6 containsString:@"%#@"])
  {
    uint64_t v16 = [&unk_26D0FAFD8 objectAtIndexedSubscript:0];
    int v17 = [v6 containsString:v16];

    id v18 = v6;
    if (!v17) {
      goto LABEL_50;
    }
    id v7 = [MEMORY[0x263F08B08] scannerWithString:v6];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    uint64_t v19 = [&unk_26D0FAFF0 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      id v38 = v6;
      int v21 = 0;
      uint64_t v22 = *(void *)v44;
      do
      {
        uint64_t v23 = 0;
        uint64_t v24 = v21;
        uint64_t v25 = (char *)&v51 + 8 * v21;
        do
        {
          if (*(void *)v44 != v22) {
            objc_enumerationMutation(&unk_26D0FAFF0);
          }
          uint64_t v26 = *(void *)(*((void *)&v43 + 1) + 8 * v23);
          [v7 setScanLocation:0];
          [v7 scanUpToString:v26 intoString:0];
          LODWORD(v26) = [v7 scanString:v26 intoString:0];
          id v42 = 0;
          [v7 scanUpToString:@"@" intoString:&v42];
          id v27 = v42;
          int v28 = [v7 scanString:@"@" intoString:0];
          if (v26) {
            BOOL v29 = v28 == 0;
          }
          else {
            BOOL v29 = 1;
          }
          if (!v29 && v24 + v23 <= 2)
          {
            long long v31 = [(ACHAchievementLocalizationProvider *)self _valueFromPlaceholder:v27 withAchievement:v40];
            if (objc_opt_respondsToSelector())
            {
              uint64_t v32 = [v31 integerValue];
            }
            else
            {
              double v33 = ACHLogDefault();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                id v50 = v27;
                _os_log_error_impl(&dword_21F582000, v33, OS_LOG_TYPE_ERROR, "Placeholder value for pluralization does not respond to -integerValue. Using zero instead for placeholder: %@", buf, 0xCu);
              }

              uint64_t v32 = 0;
            }
            *(void *)&v25[8 * v23] = v32;
          }
          ++v23;
        }
        while (v20 != v23);
        uint64_t v20 = [&unk_26D0FAFF0 countByEnumeratingWithState:&v43 objects:v48 count:16];
        int v21 = v24 + v23;
      }
      while (v20);
      id v6 = v38;
    }
    goto LABEL_39;
  }
  id v7 = [MEMORY[0x263F08B08] scannerWithString:v6];
  if ([v7 isAtEnd])
  {
LABEL_39:

    goto LABEL_41;
  }
  uint64_t v8 = 0;
  id v9 = 0;
  do
  {
    int v10 = v9;
    [v7 scanUpToString:@"%#@" intoString:0];
    int v11 = [v7 scanString:@"%#@" intoString:0];
    id v47 = v9;
    [v7 scanUpToString:@"@" intoString:&v47];
    id v9 = v47;

    int v12 = [v7 scanString:@"@" intoString:0];
    if (v11 && v12)
    {
      if (v8 <= 2)
      {
        uint64_t v13 = [(ACHAchievementLocalizationProvider *)self _valueFromPlaceholder:v9 withAchievement:v40];
        if (objc_opt_respondsToSelector())
        {
          uint64_t v14 = [v13 integerValue];
        }
        else
        {
          v15 = ACHLogDefault();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v50 = v9;
            _os_log_error_impl(&dword_21F582000, v15, OS_LOG_TYPE_ERROR, "Placeholder value for pluralization does not respond to -integerValue. Using zero instead for placeholder: %@", buf, 0xCu);
          }

          uint64_t v14 = 0;
        }
        *((void *)&v51 + v8) = v14;
      }
      ++v8;
    }
  }
  while (([v7 isAtEnd] & 1) == 0);

  if (v8 >= 4)
  {
    double v34 = ACHLogDefault();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      -[ACHAchievementLocalizationProvider _pluralizeLocalizedString:withAchievement:]((uint64_t)v6, v34);
    }
    id v18 = v6;
    goto LABEL_49;
  }
LABEL_41:
  id v41 = 0;
  objc_msgSend(NSString, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v6, @"%ld%ld%ld", &v41, v51, v52);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  double v34 = v41;

  if (!v18 && v34)
  {
    id v35 = ACHLogDefault();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      -[ACHAchievementLocalizationProvider _pluralizeLocalizedString:withAchievement:]();
    }

    id v18 = v6;
  }
LABEL_49:

LABEL_50:
  id v36 = v18;

  return v36;
}

- (id)_formatValue:(id)a3 forPlaceholder:(id)a4 usingFormatterNamed:(id)a5 template:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if ([a4 isEqualToString:@"daily_target"])
  {
    uint64_t v13 = [v12 dailyTargetCanonicalUnit];
    uint64_t v14 = [(ACHAchievementLocalizationProvider *)self _formatValue:v10 usingFormatterNamed:v11 template:v12 forCanonicalUnit:v13];
  }
  else
  {
    uint64_t v14 = [(ACHAchievementLocalizationProvider *)self _formatValue:v10 usingFormatterNamed:v11 template:v12 forCanonicalUnit:0];
  }

  return v14;
}

- (id)_formatValue:(id)a3 usingFormatterNamed:(id)a4 template:(id)a5 forCanonicalUnit:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v11 isEqualToString:@"count"])
  {
LABEL_2:
    uint64_t v14 = ACHFormatCount(v10);
LABEL_5:
    v15 = (void *)v14;
    goto LABEL_14;
  }
  if ([v11 isEqualToString:@"ordinal"])
  {
    uint64_t v14 = ACHFormatOrdinal(v10);
    goto LABEL_5;
  }
  if (![v11 isEqualToString:@"percentage"])
  {
    if ([v11 isEqualToString:@"calories"])
    {
      int v17 = [MEMORY[0x263F0A830] kilocalorieUnit];
      uint64_t v19 = self;
      id v20 = v10;
      int v21 = v17;
      uint64_t v22 = 3;
LABEL_12:
      uint64_t v18 = [(ACHAchievementLocalizationProvider *)v19 _formattedEnergyValue:v20 canonicalUnit:v21 unitStyle:v22];
      goto LABEL_13;
    }
    if ([v11 isEqualToString:@"medium_calories"])
    {
      int v17 = [MEMORY[0x263F0A830] kilocalorieUnit];
      uint64_t v19 = self;
      id v20 = v10;
      int v21 = v17;
      uint64_t v22 = 2;
      goto LABEL_12;
    }
    if ([v11 isEqualToString:@"calories_without_units"])
    {
      int v17 = [MEMORY[0x263F0A830] kilocalorieUnit];
      uint64_t v18 = [(ACHAchievementLocalizationProvider *)self _formattedEnergyValueWithoutUnit:v10 canonicalUnit:v17];
      goto LABEL_13;
    }
    if ([v11 isEqualToString:@"move_minutes"])
    {
      uint64_t v14 = [(ACHAchievementLocalizationProvider *)self _formattedMoveTimeValue:v10];
      goto LABEL_5;
    }
    if ([v11 isEqualToString:@"move_goal"])
    {
      uint64_t v14 = [(ACHAchievementLocalizationProvider *)self _formattedMoveGoal:v10 template:v12];
      goto LABEL_5;
    }
    if ([v11 isEqualToString:@"distance"])
    {
      uint64_t v24 = [(ACHAchievementLocalizationProvider *)self achUnitManager];

      if (v24)
      {
        if (v13)
        {
          id v25 = v13;
        }
        else
        {
          id v25 = [v12 canonicalUnit];
        }
        id v40 = v25;
        id v41 = [(ACHAchievementLocalizationProvider *)self achUnitManager];
        id v42 = [v41 userDistanceWalkingRunningHKUnit];

        if (v40 == v42)
        {
        }
        else
        {
          [v10 doubleValue];
          long long v43 = objc_msgSend(MEMORY[0x263F0A630], "quantityWithUnit:doubleValue:", v40);
          [v43 doubleValueForUnit:v42];
          long long v44 = objc_msgSend(NSNumber, "numberWithDouble:");

          long long v45 = [MEMORY[0x263F0A830] meterUnitWithMetricPrefix:9];
          int v46 = [v42 isEqual:v45];

          if (v46) {
            uint64_t v47 = 14;
          }
          else {
            uint64_t v47 = 1284;
          }
          v15 = ACHFormatDistanceWithUserUnit(v44, v47);

          id v10 = v44;
          if (v15) {
            goto LABEL_14;
          }
        }
      }
      uint64_t v14 = ACHFormatDistance(v10);
      goto LABEL_5;
    }
    if ([v11 isEqualToString:@"swim_distance"])
    {
      uint64_t v26 = [(ACHAchievementLocalizationProvider *)self achUnitManager];

      if (v26)
      {
        id v27 = [v12 canonicalUnit];
        int v28 = [(ACHAchievementLocalizationProvider *)self achUnitManager];
        BOOL v29 = [v28 userLapLengthHKUnit];

        [v10 doubleValue];
        double v30 = objc_msgSend(MEMORY[0x263F0A630], "quantityWithUnit:doubleValue:", v27);
        [v30 doubleValueForUnit:v29];
        long long v31 = objc_msgSend(NSNumber, "numberWithDouble:");

        uint64_t v32 = [MEMORY[0x263F0A830] meterUnit];
        LODWORD(v28) = [v29 isEqual:v32];

        BOOL v33 = v28 == 0;
        uint64_t v34 = 1283;
        goto LABEL_49;
      }
    }
    else
    {
      if (![v11 isEqualToString:@"elevation_gain"])
      {
        if ([v11 isEqualToString:@"duration"])
        {
          uint64_t v14 = ACHFormatDuration(v10);
          goto LABEL_5;
        }
        if ([v11 isEqualToString:@"minutes"])
        {
          uint64_t v14 = ACHFormatMinutes(v10);
          goto LABEL_5;
        }
        if ([v11 isEqualToString:@"days"])
        {
          uint64_t v14 = ACHFormatNumberOfDays(v10);
          goto LABEL_5;
        }
        if ([v11 isEqualToString:@"date"])
        {
          long long v51 = v10;
          uint64_t v52 = 0;
        }
        else if ([v11 isEqualToString:@"week"])
        {
          long long v51 = v10;
          uint64_t v52 = 4;
        }
        else if ([v11 isEqualToString:@"month"])
        {
          long long v51 = v10;
          uint64_t v52 = 5;
        }
        else if ([v11 isEqualToString:@"monthyear"])
        {
          long long v51 = v10;
          uint64_t v52 = 1;
        }
        else
        {
          if (![v11 isEqualToString:@"year"])
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              uint64_t v14 = [v10 description];
              goto LABEL_5;
            }
            goto LABEL_2;
          }
          long long v51 = v10;
          uint64_t v52 = 6;
        }
        uint64_t v14 = ACHFormatDateWithStyle(v51, v52);
        goto LABEL_5;
      }
      id v35 = [(ACHAchievementLocalizationProvider *)self achUnitManager];

      if (v35)
      {
        id v27 = [v12 canonicalUnit];
        id v36 = [(ACHAchievementLocalizationProvider *)self achUnitManager];
        v37 = [v36 userDistanceWalkingRunningHKUnit];

        id v38 = [MEMORY[0x263F0A830] mileUnit];
        int v39 = [v37 isEqual:v38];

        if (v39) {
          [MEMORY[0x263F0A830] footUnit];
        }
        else {
        BOOL v29 = [MEMORY[0x263F0A830] meterUnit];
        }

        [v10 doubleValue];
        double v30 = objc_msgSend(MEMORY[0x263F0A630], "quantityWithUnit:doubleValue:", v27);
        [v30 doubleValueForUnit:v29];
        long long v31 = objc_msgSend(NSNumber, "numberWithDouble:");

        v48 = [MEMORY[0x263F0A830] meterUnit];
        int v49 = [v29 isEqual:v48];

        BOOL v33 = v49 == 0;
        uint64_t v34 = 1282;
LABEL_49:
        if (v33) {
          uint64_t v50 = v34;
        }
        else {
          uint64_t v50 = 11;
        }
        v15 = ACHFormatDistanceWithUserUnitAndUnitStyle(v31, v50, 3, 0);

        id v10 = v31;
        if (v15) {
          goto LABEL_14;
        }
      }
    }
    uint64_t v14 = ACHFormatDistanceWithUserUnitAndUnitStyle(v10, 11, 3, 0);
    goto LABEL_5;
  }
  [v10 doubleValue];
  int v17 = [NSNumber numberWithDouble:v16 / 100.0];
  uint64_t v18 = ACHFormatPercent(v17);
LABEL_13:
  v15 = (void *)v18;

LABEL_14:

  return v15;
}

- (id)_allStringCombinationsWithPrefix:(id)a3 andSuffixes:(id)a4
{
  v19[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    uint64_t v8 = [(ACHAchievementLocalizationProvider *)self _calculateSuffixCombinations:v7];
    id v9 = objc_opt_new();
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    v15 = __83__ACHAchievementLocalizationProvider__allStringCombinationsWithPrefix_andSuffixes___block_invoke;
    double v16 = &unk_264512338;
    id v17 = v6;
    id v18 = v9;
    id v10 = v9;
    [v8 enumerateObjectsUsingBlock:&v13];
    id v11 = objc_msgSend(v10, "copy", v13, v14, v15, v16);
  }
  else
  {
    v19[0] = v6;
    id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
  }

  return v11;
}

- (id)_progressValueWithAchievement:(id)a3
{
  id v3 = a3;
  id v4 = [v3 template];
  id v5 = [v4 canonicalUnit];

  if (v5)
  {
    id v6 = NSNumber;
    id v7 = [v3 progress];
    [v7 doubleValueForUnit:v5];
    uint64_t v8 = objc_msgSend(v6, "numberWithDouble:");
  }
  else
  {
    uint64_t v8 = &unk_26D0FB0B0;
  }

  return v8;
}

- (id)_goalValueWithAchievement:(id)a3
{
  id v3 = a3;
  id v4 = [v3 template];
  id v5 = [v4 canonicalUnit];

  if (v5)
  {
    id v6 = NSNumber;
    id v7 = [v3 goal];
    [v7 doubleValueForUnit:v5];
    uint64_t v8 = objc_msgSend(v6, "numberWithDouble:");
  }
  else
  {
    uint64_t v8 = &unk_26D0FB0B0;
  }

  return v8;
}

- (ACHAchievementLocalizationProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)ACHAchievementLocalizationProvider;
  v2 = [(ACHAchievementLocalizationProvider *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
    gregorianCalendar = v2->_gregorianCalendar;
    v2->_gregorianCalendar = (NSCalendar *)v3;

    v2->_activityMoveMode = 1;
  }
  return v2;
}

- (void)setName:(id)a3
{
  id v8 = a3;
  id v4 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  id v5 = [v8 stringByTrimmingCharactersInSet:v4];

  objc_super v6 = (NSString *)[v5 length];
  if (v6) {
    objc_super v6 = (NSString *)v8;
  }
  name = self->_name;
  self->_name = v6;
}

- (id)currentDate
{
  v2 = [(ACHAchievementLocalizationProvider *)self currentDateOverride];
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x263EFF910] date];
  }
  id v5 = v4;

  return v5;
}

- (id)currentLocale
{
  v2 = [(ACHAchievementLocalizationProvider *)self currentLocaleOverride];
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x263EFF960] currentLocale];
  }
  id v5 = v4;

  return v5;
}

- (id)unachievedDescriptionForAchievement:(id)a3
{
  id v4 = a3;
  if (-[ACHAchievementLocalizationProvider paused](self, "paused") && [v4 isRingsBased])
  {
    id v5 = [MEMORY[0x263F0A980] sharedBehavior];
    int v6 = [v5 isStandalonePhoneFitnessMode];

    if (v6) {
      id v7 = (id)[@"ACHIEVEMENT_UNACHIEVED_RINGS_AWARD_PAUSED_DESCRIPTION" stringByAppendingString:@"_STANDALONE_PHONE"];
    }
    id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v9 = [v8 localizedStringForKey:@"ACHIEVEMENT_UNACHIEVED_RINGS_AWARD_PAUSED_DESCRIPTION" value:&stru_26D0EC7B0 table:@"Localizable"];
  }
  else
  {
    id v9 = [(ACHAchievementLocalizationProvider *)self localizedStringForKey:@"ACHIEVEMENT_UNACHIEVED_DESCRIPTION" withAchievement:v4 fitnessExperienceType:1];
  }

  return v9;
}

- (id)_descriptionKeyForLongestMoveStreak:(id)a3
{
  id v4 = a3;
  id v5 = [(ACHAchievementLocalizationProvider *)self gregorianCalendar];
  uint64_t v6 = [v4 relevantEarnedInstance];
  uint64_t v7 = [(id)v6 earnedDateComponents];
  id v8 = [v5 dateFromComponents:v7];

  id v9 = [(ACHAchievementLocalizationProvider *)self gregorianCalendar];
  LODWORD(v6) = [v9 isDateInYesterday:v8];

  id v10 = [(ACHAchievementLocalizationProvider *)self gregorianCalendar];
  LODWORD(v7) = [v10 isDateInToday:v8];

  int v11 = v6 | v7;
  if ([(ACHAchievementLocalizationProvider *)self paused])
  {
    id v12 = [v4 goal];
    uint64_t v13 = [v4 progress];
    uint64_t v14 = [v12 compare:v13];

    if (v14) {
      int v15 = v11;
    }
    else {
      int v15 = 1;
    }
    if (v15) {
      double v16 = @"ACHIEVEMENT_ACHIEVED_DESCRIPTION_ACTIVE_PAUSED";
    }
    else {
      double v16 = @"ACHIEVEMENT_ACHIEVED_DESCRIPTION_INACTIVE_PAUSED";
    }
  }
  else if (v11)
  {
    double v16 = @"ACHIEVEMENT_ACHIEVED_DESCRIPTION_ACTIVE";
  }
  else
  {
    double v16 = @"ACHIEVEMENT_ACHIEVED_DESCRIPTION_INACTIVE";
  }
  id v17 = v16;

  return v17;
}

- (id)achievedDescriptionForAchievement:(id)a3
{
  id v4 = a3;
  id v5 = [v4 template];
  uint64_t v6 = [v5 uniqueName];
  int v7 = [v6 isEqualToString:@"LongestMoveStreak"];

  if (v7)
  {
    id v8 = [(ACHAchievementLocalizationProvider *)self _descriptionKeyForLongestMoveStreak:v4];
  }
  else
  {
    id v8 = @"ACHIEVEMENT_ACHIEVED_DESCRIPTION";
  }
  id v9 = [(ACHAchievementLocalizationProvider *)self localizedStringForKey:v8 withAchievement:v4 fitnessExperienceType:1];

  return v9;
}

- (id)achievedShortDescriptionForAchievement:(id)a3
{
  return [(ACHAchievementLocalizationProvider *)self localizedStringForKey:@"ACHIEVEMENT_ACHIEVED_SHORT_DESCRIPTION" withAchievement:a3 fitnessExperienceType:1];
}

- (id)friendAchievedTitleForAchievement:(id)a3
{
  id v4 = a3;
  id v5 = [(ACHAchievementLocalizationProvider *)self localizedStringForKey:@"ACHIEVEMENT_ACHIEVED_FRIEND_TITLE" withAchievement:v4 fitnessExperienceType:1];
  if ([v5 isEqualToString:@"ACHIEVEMENT_ACHIEVED_FRIEND_TITLE"])
  {
    uint64_t v6 = [(ACHAchievementLocalizationProvider *)self titleForAchievement:v4];

    id v5 = (void *)v6;
  }

  return v5;
}

- (id)friendAchievedDescriptionForAchievement:(id)a3
{
  return [(ACHAchievementLocalizationProvider *)self localizedStringForKey:@"ACHIEVEMENT_ACHIEVED_FRIEND_DESCRIPTION" withAchievement:a3 fitnessExperienceType:1];
}

- (id)_backDateStringForDate:(id)a3 achievement:(id)a4 dateStyle:(unint64_t)a5
{
  id v7 = a3;
  id v8 = [a4 template];
  id v9 = [v8 sourceName];
  int v10 = [v9 isEqualToString:@"MonthlyChallenges"];

  if (v10)
  {
    if (a5 > 2) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = qword_21F5C2710[a5];
    }
    uint64_t v12 = ACHFormatDateWithStyle(v7, v11);
  }
  else
  {
    uint64_t v12 = [MEMORY[0x263F08790] localizedStringFromDate:v7 dateStyle:a5 timeStyle:0];
  }
  uint64_t v13 = (void *)v12;

  return v13;
}

- (id)achievedAlertBackDescriptionForAchievement:(id)a3 sizeVariant:(int64_t)a4 dateSizeVariant:(int64_t)a5
{
  id v8 = a3;
  if ([v8 unearned])
  {
    id v9 = [(ACHAchievementLocalizationProvider *)self unachievedAlertBackDescriptionForAchievement:v8];
    goto LABEL_33;
  }
  if (ACHShouldUseNewAwardsSystem())
  {
    int v10 = [v8 relevantEarnedInstance];
  }
  else
  {
    uint64_t v11 = [v8 earnedInstances];
    int v10 = [v11 lastObject];
  }
  uint64_t v12 = [(ACHAchievementLocalizationProvider *)self gregorianCalendar];
  uint64_t v13 = [v10 earnedDateComponents];
  uint64_t v14 = [v12 dateFromComponents:v13];

  int v15 = [(ACHAchievementLocalizationProvider *)self name];
  double v16 = @"EARNED_BY_NAME_%@_ON_DATE_%@";
  if (!v15) {
    double v16 = @"EARNED_ON_DATE_%@";
  }
  id v17 = v16;

  if ((unint64_t)a4 >= 2)
  {
    if (a4 == 2)
    {
      uint64_t v19 = [(__CFString *)v17 stringByAppendingString:@"_SMALL"];

      if (a5) {
        uint64_t v18 = 1;
      }
      else {
        uint64_t v18 = 2;
      }
      id v17 = (__CFString *)v19;
    }
    else
    {
      uint64_t v18 = 0;
    }
  }
  else if (a5)
  {
    uint64_t v18 = 2;
  }
  else
  {
    uint64_t v18 = 3;
  }
  id v20 = [v8 template];
  int v21 = [v20 sourceName];
  int v22 = [v21 isEqualToString:@"MonthlyChallenges"];

  if (v22)
  {
    if ([(__CFString *)v17 isEqualToString:@"EARNED_ON_DATE_%@"])
    {
      uint64_t v23 = @"EARNED_ON_DATE_%@_MC";
    }
    else
    {
      if (![(__CFString *)v17 isEqualToString:@"EARNED_BY_NAME_%@_ON_DATE_%@"]) {
        goto LABEL_24;
      }
      uint64_t v23 = @"EARNED_BY_NAME_%@_ON_DATE_%@_MC";
    }

    id v17 = v23;
  }
LABEL_24:
  uint64_t v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v25 = [v24 localizedStringForKey:v17 value:&stru_26D0EC7B0 table:@"Localizable"];
  uint64_t v26 = [(ACHAchievementLocalizationProvider *)self _backDateStringForDate:v14 achievement:v8 dateStyle:v18];
  id v27 = [(ACHAchievementLocalizationProvider *)self name];

  int v28 = NSString;
  if (v27)
  {
    id v34 = 0;
    BOOL v29 = [(ACHAchievementLocalizationProvider *)self name];
    id v9 = [v28 localizedStringWithValidatedFormat:v25, @"%@%@", &v34, v29, v26 validFormatSpecifiers error];
    id v30 = v34;

    if (v9) {
      goto LABEL_32;
    }
LABEL_28:
    if (v30)
    {
      long long v31 = ACHLogDefault();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[ACHAchievementLocalizationProvider achievedAlertBackDescriptionForAchievement:sizeVariant:dateSizeVariant:]();
      }

      id v9 = v25;
    }
    goto LABEL_32;
  }
  id v33 = 0;
  id v9 = [NSString localizedStringWithValidatedFormat:v25, @"%@", &v33, v26 validFormatSpecifiers error];
  id v30 = v33;
  if (!v9) {
    goto LABEL_28;
  }
LABEL_32:

LABEL_33:

  return v9;
}

- (id)unachievedAlertDescriptionForAchievement:(id)a3 fitnessExperienceType:(unint64_t)a4
{
  return [(ACHAchievementLocalizationProvider *)self localizedStringForKey:@"ACHIEVEMENT_UNACHIEVED_ALERT_DESCRIPTION" withAchievement:a3 fitnessExperienceType:a4];
}

- (id)achievedAlertDescriptionForAchievement:(id)a3 fitnessExperienceType:(unint64_t)a4
{
  return [(ACHAchievementLocalizationProvider *)self localizedStringForKey:@"ACHIEVEMENT_ACHIEVED_ALERT_DESCRIPTION" withAchievement:a3 fitnessExperienceType:a4];
}

- (id)unachievedAlertBackDescriptionForAchievement:(id)a3
{
  return [(ACHAchievementLocalizationProvider *)self localizedStringForKey:@"ACHIEVEMENT_UNACHIEVED_ALERT_BACK_DESCRIPTION" withAchievement:a3 fitnessExperienceType:1];
}

- (id)shareDescriptionForAchievement:(id)a3
{
  id v4 = a3;
  if ([v4 unearned]) {
    id v5 = @"ACHIEVEMENT_SHARING_UNACHIEVED_DESCRIPTION";
  }
  else {
    id v5 = @"ACHIEVEMENT_SHARING_DESCRIPTION";
  }
  uint64_t v6 = [(ACHAchievementLocalizationProvider *)self localizedStringForKey:v5 withAchievement:v4 fitnessExperienceType:1];

  return v6;
}

- (id)_formattedMoveGoal:(id)a3 template:(id)a4
{
  int64_t activityMoveMode = self->_activityMoveMode;
  id v7 = a3;
  id v8 = ACHUnitForTemplateAndActivityMoveMode(a4, activityMoveMode);
  id v9 = [MEMORY[0x263F0A830] minuteUnit];
  int v10 = [v8 isEqual:v9];

  if (v10) {
    [(ACHAchievementLocalizationProvider *)self _formattedMoveTimeValue:v7];
  }
  else {
  uint64_t v11 = [(ACHAchievementLocalizationProvider *)self _formattedEnergyValue:v7 canonicalUnit:v8 unitStyle:3];
  }

  return v11;
}

- (id)_formattedEnergyValue:(id)a3 canonicalUnit:(id)a4 unitStyle:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = [(ACHAchievementLocalizationProvider *)self achUnitManager];

  if (v10)
  {
    uint64_t v11 = [(ACHAchievementLocalizationProvider *)self achUnitManager];
    uint64_t v12 = [v11 userActiveEnergyBurnedUnit];

    if (![v9 isEqual:v12])
    {
      [v8 doubleValue];
      int v15 = objc_msgSend(MEMORY[0x263F0A630], "quantityWithUnit:doubleValue:", v9);
      [v15 doubleValueForUnit:v12];
      uint64_t v14 = objc_msgSend(NSNumber, "numberWithDouble:");

      double v16 = [MEMORY[0x263F0A830] jouleUnitWithMetricPrefix:9];
      char v17 = [v12 isEqual:v16];

      if (v17)
      {
        uint64_t v18 = 14;
      }
      else
      {
        uint64_t v19 = [MEMORY[0x263F0A830] kilocalorieUnit];
        [v12 isEqual:v19];

        uint64_t v18 = 1794;
      }
      uint64_t v13 = ACHFormatEnergyWithUserUnitAndFormatterUnit(v14, v12, v18, a5);

      goto LABEL_9;
    }
  }
  uint64_t v13 = ACHFormatEnergyWithUserUnit(v8, 1794, a5);
  uint64_t v14 = v8;
LABEL_9:

  return v13;
}

- (id)_formattedEnergyValueWithoutUnit:(id)a3 canonicalUnit:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ACHAchievementLocalizationProvider *)self achUnitManager];

  if (v8)
  {
    id v9 = [(ACHAchievementLocalizationProvider *)self achUnitManager];
    int v10 = [v9 userActiveEnergyBurnedUnit];

    if (([v7 isEqual:v10] & 1) == 0)
    {
      [v6 doubleValue];
      uint64_t v11 = objc_msgSend(MEMORY[0x263F0A630], "quantityWithUnit:doubleValue:", v7);
      [v11 doubleValueForUnit:v10];
      uint64_t v12 = objc_msgSend(NSNumber, "numberWithDouble:");

      id v6 = (id)v12;
    }
  }
  uint64_t v13 = ACHFormatCount(v6);

  return v13;
}

- (id)_formattedMoveTimeValue:(id)a3
{
  return ACHFormatMoveMinutes(a3);
}

- (id)_achievementValueWithAchievement:(id)a3
{
  id v3 = a3;
  if (ACHShouldUseNewAwardsSystem())
  {
    id v4 = [v3 relevantEarnedInstance];
  }
  else
  {
    id v5 = [v3 earnedInstances];
    id v4 = [v5 lastObject];
  }
  id v6 = [v3 template];

  id v7 = [v6 canonicalUnit];

  id v8 = &unk_26D0FB0B0;
  if (v7 && v4)
  {
    id v9 = NSNumber;
    int v10 = [v4 value];
    [v10 doubleValueForUnit:v7];
    id v8 = objc_msgSend(v9, "numberWithDouble:");
  }

  return v8;
}

- (id)_quantityToGoalValueWithAchievement:(id)a3
{
  id v4 = a3;
  id v5 = [v4 template];
  id v6 = [v5 canonicalUnit];

  if (v6)
  {
    id v7 = [(ACHAchievementLocalizationProvider *)self _remainingProgressValueWithUnit:v6 achievement:v4];
  }
  else
  {
    id v7 = &unk_26D0FB0B0;
  }

  return v7;
}

- (id)_remainingProgressValueWithUnit:(id)a3 achievement:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 progress];
  [v7 doubleValueForUnit:v6];
  double v9 = v8;

  int v10 = [v5 goal];

  [v10 doubleValueForUnit:v6];
  double v12 = v11;

  double v13 = v12 - v9;
  if (v12 - v9 < 0.0) {
    double v13 = 0.0;
  }
  uint64_t v14 = NSNumber;

  return (id)[v14 numberWithDouble:v13];
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)wheelchairUser
{
  return self->_wheelchairUser;
}

- (int64_t)activityMoveMode
{
  return self->_activityMoveMode;
}

- (void)setActivityMoveMode:(int64_t)a3
{
  self->_int64_t activityMoveMode = a3;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (BOOL)isPregnant
{
  return self->_isPregnant;
}

- (void)setIsPregnant:(BOOL)a3
{
  self->_isPregnant = a3;
}

- (NSDate)currentDateOverride
{
  return self->_currentDateOverride;
}

- (void)setCurrentDateOverride:(id)a3
{
}

- (NSLocale)currentLocaleOverride
{
  return self->_currentLocaleOverride;
}

- (void)setCurrentLocaleOverride:(id)a3
{
}

- (NSCalendar)gregorianCalendar
{
  return self->_gregorianCalendar;
}

- (void)setGregorianCalendar:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
  objc_storeStrong((id *)&self->_currentLocaleOverride, 0);
  objc_storeStrong((id *)&self->_currentDateOverride, 0);
  objc_storeStrong((id *)&self->_achUnitManager, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)achievedAlertBackDescriptionForAchievement:sizeVariant:dateSizeVariant:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_21F582000, v0, OS_LOG_TYPE_ERROR, "Error formatting alert back description: %@", v1, 0xCu);
}

- (void)_localizedStringWithKey:(uint64_t)a1 withAchievement:(void *)a2 experienceType:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = [a2 template];
  id v6 = [v5 uniqueName];
  int v7 = 138543618;
  uint64_t v8 = a1;
  __int16 v9 = 2114;
  int v10 = v6;
  _os_log_error_impl(&dword_21F582000, a3, OS_LOG_TYPE_ERROR, "Invalid localization URL for key (%{public}@) for achievement (%{public}@}))", (uint8_t *)&v7, 0x16u);
}

- (void)_pluralizeLocalizedString:withAchievement:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_21F582000, v0, OS_LOG_TYPE_ERROR, "Error formatting pluarlized string: %@", v1, 0xCu);
}

- (void)_pluralizeLocalizedString:(uint64_t)a1 withAchievement:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 134218242;
  uint64_t v3 = 3;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_21F582000, a2, OS_LOG_TYPE_ERROR, "Cannot use more than %ld placeholder values in an achievement localized string. Failing string: \"%@\"", (uint8_t *)&v2, 0x16u);
}

- (void)_valueFromPlaceholder:(void *)a1 withAchievement:.cold.1(void *a1)
{
  v1 = [a1 template];
  int v2 = [v1 uniqueName];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21F582000, v3, v4, "No reference_progress_value custom placeholder set for achievement %{public}@ when it was localized.", v5, v6, v7, v8, v9);
}

- (void)_valueFromPlaceholder:(void *)a1 withAchievement:.cold.2(void *a1)
{
  v1 = [a1 template];
  int v2 = [v1 uniqueName];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21F582000, v3, v4, "No workout_type custom placeholder set for achievement %{public}@ when it was localized.", v5, v6, v7, v8, v9);
}

- (void)_valueFromPlaceholder:(void *)a1 withAchievement:.cold.3(void *a1)
{
  v1 = [a1 template];
  int v2 = [v1 uniqueName];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21F582000, v3, v4, "No seymour_workout_modality custom placeholder set for achievement %{public}@ when it was localized.", v5, v6, v7, v8, v9);
}

- (void)_valueFromPlaceholder:(void *)a1 withAchievement:.cold.4(void *a1)
{
  v1 = [a1 template];
  int v2 = [v1 uniqueName];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21F582000, v3, v4, "No seymour_workout_milestone custom placeholder set for achievement %{public}@ when it was localized.", v5, v6, v7, v8, v9);
}

@end