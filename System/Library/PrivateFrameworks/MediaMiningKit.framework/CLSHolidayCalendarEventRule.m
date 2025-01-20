@interface CLSHolidayCalendarEventRule
+ (id)localizedNameForName:(id)a3;
- (BOOL)_isMatchingOnlyLocalDate:(id)a3 countryCode:(id)a4;
- (BOOL)backfillForAllCountryCodes;
- (BOOL)backfillForCommonCelebratedCountryCodes;
- (BOOL)backfillForCommonCelebratedLanguages;
- (BOOL)backfillForCountryCode:(id)a3;
- (BOOL)backfillForLanguageCodes:(id)a3;
- (BOOL)evaluateOnlyTraits:(id)a3 evaluateLocationTraits:(BOOL)a4;
- (BOOL)evaluateWithLocalDate:(id)a3 traits:(id)a4 countryCode:(id)a5;
- (BOOL)isCelebration;
- (BOOL)isEqual:(id)a3;
- (BOOL)skipSceneCriteriaIfInteresting;
- (BOOL)triggerMemoryForAllLocales;
- (BOOL)triggerMemoryForCommonCelebratedCountryCodes;
- (BOOL)triggerMemoryForCountryCode:(id)a3;
- (CLSHolidayCalendarEventDateRuleDelegate)dateRuleDelegate;
- (CLSHolidayCalendarEventRule)initWithEventDescription:(id)a3;
- (CLSHolidayCalendarEventRuleRequiredTraits)requiredTraits;
- (NSArray)defaultDateRules;
- (NSDictionary)commonCelebratedCountryCodes;
- (NSDictionary)commonCelebratedLanguages;
- (NSString)localizedName;
- (NSString)name;
- (double)defaultLocationScore;
- (double)languageScoreForLanguageCode:(id)a3;
- (double)locationScoreForCountryCode:(id)a3;
- (id)_dateRuleForYear:(int64_t)a3 countryCode:(id)a4;
- (id)_dateRuleForYear:(int64_t)a3 supportedLocale:(id)a4;
- (id)_localeOverrideForDescription:(id)a3 uppercaseLocaleCode:(BOOL)a4;
- (id)_scoreForEventOverride:(id)a3 sceneNames:(id)a4;
- (id)allSceneNames;
- (id)description;
- (id)explicitlySupportedCountryCodes;
- (id)localDateByEvaluatingRuleForYear:(int64_t)a3 countryCode:(id)a4;
- (id)localDateByEvaluatingRuleForYear:(int64_t)a3 languageCode:(id)a4;
- (id)scoreForCountryCode:(id)a3 sceneNames:(id)a4;
- (id)scoreForLanguageCode:(id)a3 sceneNames:(id)a4;
- (unint64_t)category;
- (unint64_t)hash;
- (unint64_t)peopleTrait;
- (void)setDateRuleDelegate:(id)a3;
@end

@implementation CLSHolidayCalendarEventRule

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commonCelebratedLanguages, 0);
  objc_storeStrong((id *)&self->_commonCelebratedCountryCodes, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_destroyWeak((id *)&self->_dateRuleDelegate);
  objc_storeStrong((id *)&self->_requiredTraits, 0);
  objc_storeStrong((id *)&self->_defaultDateRules, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (BOOL)backfillForCommonCelebratedLanguages
{
  return self->_backfillForCommonCelebratedLanguages;
}

- (BOOL)backfillForCommonCelebratedCountryCodes
{
  return self->_backfillForCommonCelebratedCountryCodes;
}

- (BOOL)backfillForAllCountryCodes
{
  return self->_backfillForAllCountryCodes;
}

- (BOOL)triggerMemoryForCommonCelebratedCountryCodes
{
  return self->_triggerMemoryForCommonCelebratedCountryCodes;
}

- (BOOL)triggerMemoryForAllLocales
{
  return self->_triggerMemoryForAllLocales;
}

- (BOOL)skipSceneCriteriaIfInteresting
{
  return self->_skipSceneCriteriaIfInteresting;
}

- (double)defaultLocationScore
{
  return self->_defaultLocationScore;
}

- (NSDictionary)commonCelebratedLanguages
{
  return self->_commonCelebratedLanguages;
}

- (NSDictionary)commonCelebratedCountryCodes
{
  return self->_commonCelebratedCountryCodes;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (CLSHolidayCalendarEventDateRuleDelegate)dateRuleDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dateRuleDelegate);
  return (CLSHolidayCalendarEventDateRuleDelegate *)WeakRetained;
}

- (CLSHolidayCalendarEventRuleRequiredTraits)requiredTraits
{
  return self->_requiredTraits;
}

- (NSArray)defaultDateRules
{
  return self->_defaultDateRules;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)hash
{
  return [(NSString *)self->_name hash];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  name = self->_name;
  v4 = [a3 name];
  LOBYTE(name) = [(NSString *)name isEqual:v4];

  return (char)name;
}

- (void)setDateRuleDelegate:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dateRuleDelegate);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_dateRuleDelegate, v4);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v6 = self->_defaultDateRules;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v31;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v31 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v30 + 1) + 8 * v10++) setDelegate:v4];
        }
        while (v8 != v10);
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v8);
    }

    v11 = [(NSDictionary *)self->_commonCelebratedCountryCodes allValues];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v35 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v27;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v27 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v26 + 1) + 8 * v15);
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          v17 = objc_msgSend(v16, "dateRuleOverrides", 0);
          uint64_t v18 = [v17 countByEnumeratingWithState:&v22 objects:v34 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v23;
            do
            {
              uint64_t v21 = 0;
              do
              {
                if (*(void *)v23 != v20) {
                  objc_enumerationMutation(v17);
                }
                [*(id *)(*((void *)&v22 + 1) + 8 * v21++) setDelegate:v4];
              }
              while (v19 != v21);
              uint64_t v19 = [v17 countByEnumeratingWithState:&v22 objects:v34 count:16];
            }
            while (v19);
          }

          ++v15;
        }
        while (v15 != v13);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v35 count:16];
      }
      while (v13);
    }
  }
}

- (BOOL)_isMatchingOnlyLocalDate:(id)a3 countryCode:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = +[CLSCalendar components:28 fromDate:v7];
  uint64_t v9 = -[CLSHolidayCalendarEventRule localDateByEvaluatingRuleForYear:countryCode:](self, "localDateByEvaluatingRuleForYear:countryCode:", [v8 year], v6);

  int64_t v10 = +[CLSCalendar compareDate:v9 toDate:v7 toUnitGranularities:28];
  return v10 == 0;
}

- (BOOL)backfillForLanguageCodes:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        if (self->_backfillForCommonCelebratedLanguages)
        {
          uint64_t v9 = -[NSDictionary objectForKeyedSubscript:](self->_commonCelebratedLanguages, "objectForKeyedSubscript:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);

          if (v9)
          {
            BOOL v10 = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_12:

  return v10;
}

- (BOOL)backfillForCountryCode:(id)a3
{
  id v4 = a3;
  if (self->_backfillForAllCountryCodes)
  {
    BOOL v5 = 1;
  }
  else if (self->_backfillForCommonCelebratedCountryCodes)
  {
    uint64_t v6 = [(NSDictionary *)self->_commonCelebratedCountryCodes objectForKeyedSubscript:v4];
    BOOL v5 = v6 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)triggerMemoryForCountryCode:(id)a3
{
  id v4 = a3;
  if (self->_triggerMemoryForAllLocales)
  {
    BOOL v5 = 1;
  }
  else if (self->_triggerMemoryForCommonCelebratedCountryCodes)
  {
    uint64_t v6 = [(NSDictionary *)self->_commonCelebratedCountryCodes objectForKeyedSubscript:v4];
    BOOL v5 = v6 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)peopleTrait
{
  return [(CLSHolidayCalendarEventRuleTraits *)self->_requiredTraits peopleTrait];
}

- (id)allSceneNames
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v4 = [(CLSHolidayCalendarEventRuleRequiredTraits *)self->_requiredTraits defaultScenesWithImportanceString];
  BOOL v5 = [v4 allKeys];
  [v3 addObjectsFromArray:v5];

  commonCelebratedCountryCodes = self->_commonCelebratedCountryCodes;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __44__CLSHolidayCalendarEventRule_allSceneNames__block_invoke;
  v17[3] = &unk_1E690E788;
  id v7 = v3;
  id v18 = v7;
  [(NSDictionary *)commonCelebratedCountryCodes enumerateKeysAndObjectsUsingBlock:v17];
  commonCelebratedLanguages = self->_commonCelebratedLanguages;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  long long v14 = __44__CLSHolidayCalendarEventRule_allSceneNames__block_invoke_2;
  long long v15 = &unk_1E690E788;
  id v16 = v7;
  id v9 = v7;
  [(NSDictionary *)commonCelebratedLanguages enumerateKeysAndObjectsUsingBlock:&v12];
  BOOL v10 = objc_msgSend(v9, "allObjects", v12, v13, v14, v15);

  return v10;
}

void __44__CLSHolidayCalendarEventRule_allSceneNames__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 sceneImportanceOverrides];
  if (v4)
  {
    BOOL v5 = *(void **)(a1 + 32);
    id v7 = v4;
    uint64_t v6 = [v4 allKeys];
    [v5 addObjectsFromArray:v6];

    id v4 = v7;
  }
}

void __44__CLSHolidayCalendarEventRule_allSceneNames__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 sceneImportanceOverrides];
  if (v4)
  {
    BOOL v5 = *(void **)(a1 + 32);
    id v7 = v4;
    uint64_t v6 = [v4 allKeys];
    [v5 addObjectsFromArray:v6];

    id v4 = v7;
  }
}

- (id)_scoreForEventOverride:(id)a3 sceneNames:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_alloc_init(CLSHolidayDetectedScenes);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        unint64_t v15 = -[CLSHolidayCalendarEventRuleRequiredTraits importanceForScene:](self->_requiredTraits, "importanceForScene:", v14, (void)v20);
        if (v6)
        {
          uint64_t v16 = [v6 sceneImportanceStringForSceneName:v14];
          if (v16)
          {
            uint64_t v17 = (void *)v16;
            unint64_t v18 = +[CLSHolidayCalendarEventRuleRequiredTraits importanceEnumForImportanceString:v16];

            if (v18) {
              unint64_t v15 = v18;
            }
          }
        }
        [(CLSHolidayDetectedScenes *)v8 recordDetectedSceneImportance:v15];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }

  return v8;
}

- (id)scoreForLanguageCode:(id)a3 sceneNames:(id)a4
{
  commonCelebratedLanguages = self->_commonCelebratedLanguages;
  id v7 = a4;
  uint64_t v8 = [(NSDictionary *)commonCelebratedLanguages objectForKeyedSubscript:a3];
  id v9 = [(CLSHolidayCalendarEventRule *)self _scoreForEventOverride:v8 sceneNames:v7];

  return v9;
}

- (id)scoreForCountryCode:(id)a3 sceneNames:(id)a4
{
  commonCelebratedCountryCodes = self->_commonCelebratedCountryCodes;
  id v7 = a4;
  uint64_t v8 = [(NSDictionary *)commonCelebratedCountryCodes objectForKeyedSubscript:a3];
  id v9 = [(CLSHolidayCalendarEventRule *)self _scoreForEventOverride:v8 sceneNames:v7];

  return v9;
}

- (double)languageScoreForLanguageCode:(id)a3
{
  id v3 = [(NSDictionary *)self->_commonCelebratedLanguages objectForKeyedSubscript:a3];
  id v4 = v3;
  if (v3)
  {
    [v3 locationScore];
    double v6 = v5;
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (double)locationScoreForCountryCode:(id)a3
{
  double defaultLocationScore = self->_defaultLocationScore;
  id v4 = [(NSDictionary *)self->_commonCelebratedCountryCodes objectForKeyedSubscript:a3];
  double v5 = v4;
  if (v4)
  {
    [v4 locationScore];
    double defaultLocationScore = v6;
  }

  return defaultLocationScore;
}

- (id)explicitlySupportedCountryCodes
{
  return [(NSDictionary *)self->_commonCelebratedCountryCodes allKeys];
}

- (unint64_t)category
{
  v2 = [(CLSHolidayCalendarEventRule *)self requiredTraits];
  unint64_t v3 = [v2 eventCategory];

  return v3;
}

- (BOOL)isCelebration
{
  v2 = [(CLSHolidayCalendarEventRule *)self requiredTraits];
  char v3 = [v2 isCelebration];

  return v3;
}

- (BOOL)evaluateOnlyTraits:(id)a3 evaluateLocationTraits:(BOOL)a4
{
  return [(CLSHolidayCalendarEventRuleRequiredTraits *)self->_requiredTraits evaluateWithTraits:a3 evaluateLocationTraits:a4];
}

- (id)_dateRuleForYear:(int64_t)a3 supportedLocale:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = v6;
  if (v6
    && ([v6 dateRuleOverrides],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 count],
        v8,
        v9))
  {
    uint64_t v10 = [v7 dateRuleOverrides];
  }
  else
  {
    uint64_t v10 = self->_defaultDateRules;
  }
  uint64_t v25 = v7;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v11 = v10;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    id v14 = 0;
    uint64_t v15 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if ([v17 hasExplicitYear])
        {
          if ([v17 matchesExplicitYear:a3]) {
            goto LABEL_27;
          }
        }
        else
        {
          int v18 = [v17 hasStartYear];
          int v19 = [v17 hasEndYear];
          int v20 = v19;
          if ((v18 & 1) != 0 || (v19 & 1) != 0 || v14)
          {
            int64_t v21 = [v17 startYear];
            int64_t v22 = [v17 endYear];
            if (((v18 | v20 ^ 1) & 1) == 0 && v22 >= a3
              || ((v20 | v18 ^ 1) & 1) == 0 && v21 <= a3
              || ((v18 ^ 1 | v20 ^ 1) & 1) == 0 && v21 <= a3 && v22 >= a3)
            {
LABEL_27:
              id v23 = v17;

              id v14 = v23;
              goto LABEL_29;
            }
          }
          else
          {
            id v14 = v17;
          }
        }
      }
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v14 = 0;
  }
LABEL_29:

  return v14;
}

- (id)_dateRuleForYear:(int64_t)a3 countryCode:(id)a4
{
  id v6 = [(NSDictionary *)self->_commonCelebratedCountryCodes objectForKeyedSubscript:a4];
  id v7 = [(CLSHolidayCalendarEventRule *)self _dateRuleForYear:a3 supportedLocale:v6];

  return v7;
}

- (id)localDateByEvaluatingRuleForYear:(int64_t)a3 languageCode:(id)a4
{
  id v6 = [(NSDictionary *)self->_commonCelebratedLanguages objectForKeyedSubscript:a4];
  if (v6)
  {
    id v7 = [(CLSHolidayCalendarEventRule *)self _dateRuleForYear:a3 supportedLocale:v6];
    uint64_t v8 = [v7 localDateByEvaluatingRuleForYear:a3];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)localDateByEvaluatingRuleForYear:(int64_t)a3 countryCode:(id)a4
{
  id v6 = [(NSDictionary *)self->_commonCelebratedCountryCodes objectForKeyedSubscript:a4];
  id v7 = [(CLSHolidayCalendarEventRule *)self _dateRuleForYear:a3 supportedLocale:v6];
  uint64_t v8 = [v7 localDateByEvaluatingRuleForYear:a3];

  return v8;
}

- (BOOL)evaluateWithLocalDate:(id)a3 traits:(id)a4 countryCode:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([(CLSHolidayCalendarEventRule *)self evaluateOnlyTraits:a4 evaluateLocationTraits:1])
  {
    BOOL v10 = [(CLSHolidayCalendarEventRule *)self _isMatchingOnlyLocalDate:v8 countryCode:v9];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)description
{
  char v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)CLSHolidayCalendarEventRule;
  id v4 = [(CLSHolidayCalendarEventRule *)&v7 description];
  double v5 = [v3 stringWithFormat:@"%@, name: %@", v4, self->_name];

  return v5;
}

- (id)_localeOverrideForDescription:(id)a3 uppercaseLocaleCode:(BOOL)a4
{
  BOOL v27 = a4;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  id v28 = (id)objc_claimAutoreleasedReturnValue();
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obuint64_t j = v4;
  uint64_t v29 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v29)
  {
    uint64_t v26 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v37 != v26) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        objc_super v7 = [v6 objectForKeyedSubscript:@"locale"];
        id v8 = v7;
        if (v27)
        {
          uint64_t v9 = [v7 uppercaseString];

          id v8 = (void *)v9;
        }
        BOOL v10 = [v6 objectForKeyedSubscript:@"uuid"];
        uint64_t v11 = [v6 objectForKeyedSubscript:@"dateRuleOverrides"];
        uint64_t v12 = [v6 objectForKeyedSubscript:@"locationScore"];
        [v12 doubleValue];
        double v14 = v13;

        id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        if (v11)
        {
          long long v30 = v11;
          uint64_t v31 = v10;
          long long v34 = 0u;
          long long v35 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          id v16 = v11;
          uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v40 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v33;
            do
            {
              for (uint64_t j = 0; j != v18; ++j)
              {
                if (*(void *)v33 != v19) {
                  objc_enumerationMutation(v16);
                }
                int64_t v21 = [[CLSHolidayCalendarEventDateRule alloc] initWithEventDescription:*(void *)(*((void *)&v32 + 1) + 8 * j)];
                [v15 addObject:v21];
              }
              uint64_t v18 = [v16 countByEnumeratingWithState:&v32 objects:v40 count:16];
            }
            while (v18);
          }

          uint64_t v11 = v30;
          BOOL v10 = v31;
        }
        int64_t v22 = [v6 objectForKeyedSubscript:@"sceneImportanceOverrides"];
        id v23 = [[CLSHolidayCalendarEventOverrides alloc] initWithUUID:v10 countryCode:v8 dateRuleOverrides:v15 locationScore:v22 sceneImportanceOverrides:v14];
        [v28 setObject:v23 forKeyedSubscript:v8];
      }
      uint64_t v29 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v29);
  }

  return v28;
}

- (CLSHolidayCalendarEventRule)initWithEventDescription:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)CLSHolidayCalendarEventRule;
  double v5 = [(CLSHolidayCalendarEventRule *)&v42 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    id v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v9 = [v8 localizedStringForKey:v5->_name value:v5->_name table:@"Localizable"];
    localizedName = v5->_localizedName;
    v5->_localizedName = (NSString *)v9;

    long long v37 = [v4 objectForKeyedSubscript:@"traits"];
    uint64_t v11 = [[CLSHolidayCalendarEventRuleRequiredTraits alloc] initWithDescription:v37];
    requiredTraits = v5->_requiredTraits;
    v5->_requiredTraits = v11;

    double v13 = [v4 objectForKeyedSubscript:@"dateRules"];
    long long v36 = [v4 objectForKeyedSubscript:@"commonCelebratedCountryCodes"];
    double v14 = [v4 objectForKeyedSubscript:@"commonCelebratedLanguages"];
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v13, "count"));
    id v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v16 = v13;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v39;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v39 != v19) {
            objc_enumerationMutation(v16);
          }
          int64_t v21 = [[CLSHolidayCalendarEventDateRule alloc] initWithEventDescription:*(void *)(*((void *)&v38 + 1) + 8 * v20)];
          [(NSArray *)v15 addObject:v21];

          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v38 objects:v43 count:16];
      }
      while (v18);
    }

    int64_t v22 = [v4 objectForKeyedSubscript:@"defaultLocationScore"];
    [v22 doubleValue];
    v5->_double defaultLocationScore = v23;

    long long v24 = [v4 objectForKeyedSubscript:@"triggerMemoryForAllLocales"];
    v5->_triggerMemoryForAllLocales = [v24 BOOLValue];

    uint64_t v25 = [v4 objectForKeyedSubscript:@"triggerMemoryForCommonCelebratedCountryCodes"];
    v5->_triggerMemoryForCommonCelebratedCountryCodes = [v25 BOOLValue];

    uint64_t v26 = [v4 objectForKeyedSubscript:@"backfillForAllCountryCodes"];
    v5->_backfillForAllCountryCodes = [v26 BOOLValue];

    BOOL v27 = [v4 objectForKeyedSubscript:@"backfillForCommonCelebratedCountryCodes"];
    v5->_backfillForCommonCelebratedCountryCodes = [v27 BOOLValue];

    id v28 = [v4 objectForKeyedSubscript:@"backfillForCommonCelebratedLanguages"];
    v5->_backfillForCommonCelebratedLanguages = [v28 BOOLValue];

    uint64_t v29 = [v4 objectForKeyedSubscript:@"skipSceneCriteriaIfInteresting"];
    v5->_skipSceneCriteriaIfInteresting = [v29 BOOLValue];

    uint64_t v30 = [(CLSHolidayCalendarEventRule *)v5 _localeOverrideForDescription:v36 uppercaseLocaleCode:1];
    commonCelebratedCountryCodes = v5->_commonCelebratedCountryCodes;
    v5->_commonCelebratedCountryCodes = (NSDictionary *)v30;

    uint64_t v32 = [(CLSHolidayCalendarEventRule *)v5 _localeOverrideForDescription:v14 uppercaseLocaleCode:0];
    commonCelebratedLanguages = v5->_commonCelebratedLanguages;
    v5->_commonCelebratedLanguages = (NSDictionary *)v32;

    defaultDateRules = v5->_defaultDateRules;
    v5->_defaultDateRules = v15;
  }
  return v5;
}

+ (id)localizedNameForName:(id)a3
{
  char v3 = (void *)MEMORY[0x1E4F28B50];
  id v4 = a3;
  double v5 = [v3 bundleForClass:objc_opt_class()];
  uint64_t v6 = [v5 localizedStringForKey:v4 value:v4 table:@"Localizable"];

  return v6;
}

@end