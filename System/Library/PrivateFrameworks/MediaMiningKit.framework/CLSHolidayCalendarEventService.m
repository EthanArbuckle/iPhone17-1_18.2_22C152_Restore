@interface CLSHolidayCalendarEventService
- (CLSHolidayCalendarEventService)initWithEventRules:(id)a3 locale:(id)a4;
- (CLSHolidayCalendarEventService)initWithLocale:(id)a3;
- (CLSHolidayCalendarEventService)initWithLocale:(id)a3 calendarSourcesURL:(id)a4;
- (NSArray)eventRules;
- (NSLocale)locale;
- (id)_ruleWithUUID:(id)a3 countryCode:(id *)a4;
- (id)dateForRuleWithUUID:(id)a3 byEvaluatingForYear:(int64_t)a4;
- (id)eventRuleForHolidayName:(id)a3;
- (id)eventRuleForHolidayName:(id)a3 localDate:(id)a4;
- (id)eventRulesForLocalDate:(id)a3;
- (id)sceneNamesForHolidayName:(id)a3;
- (id)supportedLanguageCodes;
- (id)triggerHolidaysForCountryCode:(id)a3;
- (unint64_t)peopleTraitForHolidayName:(id)a3;
- (void)_enumerateEventRulesWithNames:(id)a3 betweenLocalDate:(id)a4 andLocalDate:(id)a5 supportedCountryCode:(id)a6 usingBlock:(id)a7;
- (void)enumerateEventRulesBetweenLocalDate:(id)a3 andLocalDate:(id)a4 supportedCountryCode:(id)a5 usingBlock:(id)a6;
- (void)enumerateEventRulesForAllCountriesBetweenLocalDate:(id)a3 andLocalDate:(id)a4 usingBlock:(id)a5;
- (void)enumerateEventRulesForAllCountriesWithNames:(id)a3 betweenLocalDate:(id)a4 andLocalDate:(id)a5 usingBlock:(id)a6;
- (void)enumerateEventRulesWithNames:(id)a3 betweenLocalDate:(id)a4 andLocalDate:(id)a5 usingBlock:(id)a6;
@end

@implementation CLSHolidayCalendarEventService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_eventRules, 0);
}

- (NSLocale)locale
{
  return self->_locale;
}

- (NSArray)eventRules
{
  return self->_eventRules;
}

- (id)_ruleWithUUID:(id)a3 countryCode:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v7 = self->_eventRules;
  uint64_t v24 = [(NSArray *)v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v24)
  {
    uint64_t v8 = *(void *)v31;
    v25 = v7;
    uint64_t v22 = *(void *)v31;
    v23 = a4;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v7);
        }
        v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        v11 = objc_msgSend(v10, "commonCelebratedCountryCodes", v22);
        v12 = [v11 allValues];

        uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v27;
          while (2)
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v27 != v15) {
                objc_enumerationMutation(v12);
              }
              v17 = *(void **)(*((void *)&v26 + 1) + 8 * j);
              v18 = [v17 uuid];
              char v19 = [v18 isEqualToString:v6];

              if (v19)
              {
                id *v23 = [v17 countryCode];
                id v20 = v10;

                v7 = v25;
                goto LABEL_19;
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v34 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }

        v7 = v25;
        uint64_t v8 = v22;
      }
      id v20 = 0;
      uint64_t v24 = [(NSArray *)v25 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v24);
  }
  else
  {
    id v20 = 0;
  }
LABEL_19:

  return v20;
}

- (id)dateForRuleWithUUID:(id)a3 byEvaluatingForYear:(int64_t)a4
{
  id v11 = 0;
  v5 = [(CLSHolidayCalendarEventService *)self _ruleWithUUID:a3 countryCode:&v11];
  id v6 = v11;
  v7 = [v5 _dateRuleForYear:a4 countryCode:v6];
  uint64_t v8 = v7;
  if (v7)
  {
    v9 = [v7 localDateByEvaluatingRuleForYear:a4];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)supportedLanguageCodes
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = self->_eventRules;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "commonCelebratedLanguages", (void)v14);
        v10 = v9;
        if (v9)
        {
          id v11 = [v9 allKeys];
          [v3 addObjectsFromArray:v11];
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  v12 = [v3 allObjects];

  return v12;
}

- (id)eventRuleForHolidayName:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = self->_eventRules;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "name", (void)v16);
        int v13 = [v12 isEqual:v4];

        if (v13)
        {
          id v14 = v11;

          uint64_t v8 = v14;
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)triggerHolidaysForCountryCode:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_eventRules;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "triggerMemoryForCountryCode:", v4, (void)v13)) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)enumerateEventRulesBetweenLocalDate:(id)a3 andLocalDate:(id)a4 supportedCountryCode:(id)a5 usingBlock:(id)a6
{
}

- (void)enumerateEventRulesWithNames:(id)a3 betweenLocalDate:(id)a4 andLocalDate:(id)a5 usingBlock:(id)a6
{
}

- (void)enumerateEventRulesForAllCountriesWithNames:(id)a3 betweenLocalDate:(id)a4 andLocalDate:(id)a5 usingBlock:(id)a6
{
}

- (void)enumerateEventRulesForAllCountriesBetweenLocalDate:(id)a3 andLocalDate:(id)a4 usingBlock:(id)a5
{
}

- (void)_enumerateEventRulesWithNames:(id)a3 betweenLocalDate:(id)a4 andLocalDate:(id)a5 supportedCountryCode:(id)a6 usingBlock:(id)a7
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  long long v16 = v14;
  id v17 = v15;
  id v18 = a7;
  long long v19 = v13;
  v55 = (void (**)(void, void, void, void))v18;
  if (!v16 || !v13 || !v18 || [v13 compare:v16] == 1) {
    goto LABEL_41;
  }
  v64 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v13 endDate:v16];
  id v49 = v13;
  int64_t v20 = +[CLSCalendar yearFromDate:v13];
  v48 = v16;
  int64_t v59 = +[CLSCalendar yearFromDate:v16];
  int64_t v21 = v59 - 100;
  if (v20 > v59 - 100) {
    int64_t v21 = v20;
  }
  int64_t v53 = v21;
  unsigned __int8 v73 = 0;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  obuint64_t j = self->_eventRules;
  uint64_t v22 = [(NSArray *)obj countByEnumeratingWithState:&v69 objects:v76 count:16];
  if (!v22) {
    goto LABEL_40;
  }
  uint64_t v23 = v22;
  uint64_t v24 = *(void *)v70;
  uint64_t v50 = *(void *)v70;
  id v51 = v17;
  id v52 = v12;
  while (2)
  {
    uint64_t v25 = 0;
    uint64_t v54 = v23;
    do
    {
      if (*(void *)v70 != v24) {
        objc_enumerationMutation(obj);
      }
      long long v26 = *(void **)(*((void *)&v69 + 1) + 8 * v25);
      long long v27 = (void *)MEMORY[0x1D2602300]();
      if (!v12
        || ([v26 name],
            long long v28 = objc_claimAutoreleasedReturnValue(),
            int v29 = [v12 containsObject:v28],
            v28,
            v29))
      {
        v60 = [v26 explicitlySupportedCountryCodes];
        if (v17)
        {
          long long v30 = [v26 explicitlySupportedCountryCodes];
          int v31 = [v30 containsObject:v17];

          if (!v31)
          {
LABEL_35:

            goto LABEL_36;
          }
          v57 = v27;
          uint64_t v58 = v25;
          id v75 = v17;
          uint64_t v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v75 count:1];

          v60 = (void *)v32;
        }
        else
        {
          v57 = v27;
          uint64_t v58 = v25;
        }
        id v62 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        int64_t v33 = v53;
        if (v53 <= v59)
        {
          do
          {
            context = (void *)MEMORY[0x1D2602300]();
            long long v65 = 0u;
            long long v66 = 0u;
            long long v67 = 0u;
            long long v68 = 0u;
            id v63 = v60;
            uint64_t v34 = [v63 countByEnumeratingWithState:&v65 objects:v74 count:16];
            if (v34)
            {
              uint64_t v35 = v34;
              uint64_t v36 = *(void *)v66;
              do
              {
                for (uint64_t i = 0; i != v35; ++i)
                {
                  if (*(void *)v66 != v36) {
                    objc_enumerationMutation(v63);
                  }
                  uint64_t v38 = *(void *)(*((void *)&v65 + 1) + 8 * i);
                  v39 = (void *)MEMORY[0x1D2602300]();
                  v40 = [v26 localDateByEvaluatingRuleForYear:v33 countryCode:v38];
                  if (v40)
                  {
                    id v41 = objc_alloc(MEMORY[0x1E4F28C18]);
                    v42 = +[CLSCalendar startOfDayForDate:v40];
                    v43 = +[CLSCalendar endOfDayForDate:v40];
                    v44 = (void *)[v41 initWithStartDate:v42 endDate:v43];

                    if ([v64 intersectsDateInterval:v44]) {
                      [v62 addObject:v40];
                    }
                  }
                }
                uint64_t v35 = [v63 countByEnumeratingWithState:&v65 objects:v74 count:16];
              }
              while (v35);
            }
          }
          while (v33++ != v59);
        }
        if ([v62 count])
        {
          v46 = [v62 allObjects];
          ((void (**)(void, void *, void *, unsigned __int8 *))v55)[2](v55, v26, v46, &v73);
        }
        int v47 = v73;

        id v17 = v51;
        id v12 = v52;
        uint64_t v24 = v50;
        uint64_t v23 = v54;
        long long v27 = v57;
        uint64_t v25 = v58;
        if (v47)
        {

          goto LABEL_40;
        }
        goto LABEL_35;
      }
LABEL_36:
      ++v25;
    }
    while (v25 != v23);
    uint64_t v23 = [(NSArray *)obj countByEnumeratingWithState:&v69 objects:v76 count:16];
    if (v23) {
      continue;
    }
    break;
  }
LABEL_40:

  long long v16 = v48;
  long long v19 = v49;
LABEL_41:
}

- (id)eventRuleForHolidayName:(id)a3 localDate:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v18 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = self->_eventRules;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        if (self->_locale)
        {
          id v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          id v13 = [v12 name];
          if ([v13 isEqualToString:v6])
          {
            id v14 = [(NSLocale *)self->_locale countryCode];
            char v15 = [v12 _isMatchingOnlyLocalDate:v18 countryCode:v14];

            if (v15)
            {
              id v16 = v12;
              goto LABEL_14;
            }
          }
          else
          {
          }
        }
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }
  id v16 = 0;
LABEL_14:

  return v16;
}

- (id)eventRulesForLocalDate:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = self->_eventRules;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        locale = self->_locale;
        if (locale)
        {
          id v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          id v13 = [(NSLocale *)locale countryCode];
          int v14 = [v12 _isMatchingOnlyLocalDate:v4 countryCode:v13];

          if (v14) {
            [v5 addObject:v12];
          }
        }
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v5;
}

- (unint64_t)peopleTraitForHolidayName:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = self->_eventRules;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    unint64_t v9 = 127;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "name", (void)v15);
        char v13 = [v12 isEqualToString:v4];

        if (v13)
        {
          unint64_t v9 = [v11 peopleTrait];
          goto LABEL_12;
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    unint64_t v9 = 127;
  }
LABEL_12:

  return v9;
}

- (id)sceneNamesForHolidayName:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = self->_eventRules;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    unint64_t v9 = (void *)MEMORY[0x1E4F1CBF0];
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "name", (void)v15);
        char v13 = [v12 isEqualToString:v4];

        if (v13)
        {
          unint64_t v9 = [v11 allSceneNames];
          goto LABEL_12;
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    unint64_t v9 = (void *)MEMORY[0x1E4F1CBF0];
  }
LABEL_12:

  return v9;
}

- (CLSHolidayCalendarEventService)initWithLocale:(id)a3
{
  return [(CLSHolidayCalendarEventService *)self initWithLocale:a3 calendarSourcesURL:0];
}

- (CLSHolidayCalendarEventService)initWithLocale:(id)a3 calendarSourcesURL:(id)a4
{
  id v6 = a3;
  if (a4) {
    +[CLSHolidayCalendarEventRulesFactory eventRulesForSourcesURL:a4];
  }
  else {
  uint64_t v7 = +[CLSHolidayCalendarEventRulesFactory eventRules];
  }
  uint64_t v8 = [(CLSHolidayCalendarEventService *)self initWithEventRules:v7 locale:v6];

  return v8;
}

- (CLSHolidayCalendarEventService)initWithEventRules:(id)a3 locale:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CLSHolidayCalendarEventService;
  unint64_t v9 = [(CLSHolidayCalendarEventService *)&v21 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_eventRules, a3);
    objc_storeStrong((id *)&v10->_locale, a4);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v11 = v10->_eventRules;
    uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v15++), "setDateRuleDelegate:", v10, (void)v17);
        }
        while (v13 != v15);
        uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v13);
    }
  }
  return v10;
}

@end