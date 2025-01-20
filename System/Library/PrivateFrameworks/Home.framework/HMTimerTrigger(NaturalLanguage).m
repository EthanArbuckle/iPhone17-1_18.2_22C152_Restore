@interface HMTimerTrigger(NaturalLanguage)
+ (id)_hf_naturalLanguageDetailsSentenceElementsWithRecurrences:()NaturalLanguage withOptions:;
+ (id)_hf_naturalLanguageNameWithOptions:()NaturalLanguage timeString:fireDate:recurrences:;
+ (id)hf_naturalLanguageDetailsWithRecurrences:()NaturalLanguage withOptions:;
+ (id)hf_naturalLanguageNameWithOptions:()NaturalLanguage fireDate:recurrences:;
+ (id)hf_naturalLanguageNameWithOptions:()NaturalLanguage significantEvent:offset:recurrences:;
+ (id)hf_recurrenceNaturalLanguageStringKeyWithOptions:()NaturalLanguage recurrences:intendedForTimeTriggerEditor:;
+ (id)hf_recurrenceNaturalLanguageStringWithRecurrences:()NaturalLanguage isEditor:;
+ (uint64_t)hf_recurrenceNaturalLanguageStringKeyWithOptions:()NaturalLanguage recurrences:;
+ (uint64_t)hf_recurrenceNaturalLanguageStringWithRecurrences:()NaturalLanguage;
- (id)_hf_naturalLanguageDetailsSentenceElementsWithOptions:()NaturalLanguage;
- (id)hf_naturalLanguageNameWithHome:()NaturalLanguage type:;
- (id)hf_naturalLanguageNameWithOptions:()NaturalLanguage;
@end

@implementation HMTimerTrigger(NaturalLanguage)

- (id)hf_naturalLanguageNameWithHome:()NaturalLanguage type:
{
  id v6 = a3;
  v7 = [[HFTriggerNaturalLanguageOptions alloc] initWithHome:v6 nameType:a4];

  v8 = objc_msgSend(a1, "hf_naturalLanguageNameWithOptions:", v7);

  return v8;
}

- (id)hf_naturalLanguageNameWithOptions:()NaturalLanguage
{
  id v4 = a3;
  v5 = [a1 recurrences];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v8 = (void *)MEMORY[0x263EFF8C0];
    v9 = [a1 recurrence];
    objc_msgSend(v8, "na_arrayWithSafeObject:", v9);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = _HFLocalizedStringWithDefaultValue(@"HFUnknownTimerTriggerName", @"HFUnknownTimerTriggerName", 1);
  v11 = [a1 fireDate];

  if (v11)
  {
    v12 = objc_opt_class();
    v13 = [a1 fireDate];
    uint64_t v14 = objc_msgSend(v12, "hf_naturalLanguageNameWithOptions:fireDate:recurrences:", v4, v13, v7);
  }
  else
  {
    v15 = [a1 significantEvent];

    if (!v15) {
      goto LABEL_9;
    }
    v16 = objc_opt_class();
    v13 = [a1 significantEvent];
    uint64_t v17 = [a1 significantEventOffset];
    uint64_t v14 = objc_msgSend(v16, "hf_naturalLanguageNameWithOptions:significantEvent:offset:recurrences:", v4, v13, v17, v7);

    v10 = (void *)v17;
  }

  v10 = (void *)v14;
LABEL_9:

  return v10;
}

+ (id)hf_naturalLanguageNameWithOptions:()NaturalLanguage fireDate:recurrences:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    v11 = [MEMORY[0x263F08790] localizedStringFromDate:v9 dateStyle:0 timeStyle:1];
    v12 = objc_msgSend(a1, "_hf_naturalLanguageNameWithOptions:timeString:fireDate:recurrences:", v8, v11, v9, v10);
  }
  else
  {
    NSLog(&cfstr_FiredateMustNo.isa);
    v12 = _HFLocalizedStringWithDefaultValue(@"HFUnknownTimerTriggerName", @"HFUnknownTimerTriggerName", 1);
  }

  return v12;
}

+ (id)hf_naturalLanguageNameWithOptions:()NaturalLanguage significantEvent:offset:recurrences:
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v11) {
    NSLog(&cfstr_Significanteve_2.isa);
  }
  uint64_t v14 = objc_msgSend((id)objc_opt_class(), "hf_localizedStringForSignficantEvent:offset:", v11, v12);
  v15 = objc_msgSend(a1, "_hf_naturalLanguageNameWithOptions:timeString:fireDate:recurrences:", v10, v14, 0, v13);

  return v15;
}

+ (uint64_t)hf_recurrenceNaturalLanguageStringKeyWithOptions:()NaturalLanguage recurrences:
{
  return objc_msgSend(a1, "hf_recurrenceNaturalLanguageStringKeyWithOptions:recurrences:intendedForTimeTriggerEditor:", a3, a4, 0);
}

+ (id)hf_recurrenceNaturalLanguageStringKeyWithOptions:()NaturalLanguage recurrences:intendedForTimeTriggerEditor:
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = [MEMORY[0x263EFF8F0] currentCalendar];
  if (!v8)
  {
    objc_msgSend(MEMORY[0x263EFF918], "hf_dailyWeekdayIntervalComponentsWithCalendar:", v9);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v8, "na_any:", &__block_literal_global_36))
  {
    id v10 = (void *)MEMORY[0x263EFFA08];
    id v11 = objc_msgSend(v8, "na_map:", &__block_literal_global_40);
    id v12 = [v10 setWithArray:v11];

    v52 = v12;
    id v13 = [v12 allObjects];
    uint64_t v14 = [v13 sortedArrayUsingSelector:sel_compare_];

    id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
    int v53 = a5;
    v54 = v7;
    if ([v9 firstWeekday] == 7) {
      uint64_t v16 = 0;
    }
    else {
      uint64_t v16 = [v9 firstWeekday] - 1;
    }
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v23 = v14;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v57 objects:v62 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      int v26 = 0;
      uint64_t v27 = *(void *)v58;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v58 != v27) {
            objc_enumerationMutation(v23);
          }
          v29 = *(void **)(*((void *)&v57 + 1) + 8 * i);
          if ([v29 integerValue] >= v16) {
            [v15 insertObject:v29 atIndex:v26++];
          }
          else {
            [v15 addObject:v29];
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v57 objects:v62 count:16];
      }
      while (v25);
    }

    uint64_t v30 = [v23 count];
    [v9 maximumRangeOfUnit:512];
    uint64_t v32 = v31;
    if (v30 == v31)
    {
      int v33 = 0;
      int v34 = 0;
    }
    else
    {
      v35 = [v15 indexesOfObjectsPassingTest:&__block_literal_global_46];
      if ([v35 count] != 2 || (uint64_t v36 = objc_msgSend(v35, "count"), v36 != objc_msgSend(v15, "count")))
      {
        if ([v35 count])
        {
        }
        else
        {
          uint64_t v37 = [v15 count];

          if (v37 == 5)
          {
            int v34 = 0;
            int v33 = 1;
            goto LABEL_34;
          }
        }
        int v33 = 0;
        int v34 = 0;
        if ((unint64_t)[v23 count] <= 1) {
          uint64_t v38 = 1;
        }
        else {
          uint64_t v38 = 3;
        }
LABEL_38:
        if ((v53 & 1) != 0 || [v54 formattingStyle] == 2 || objc_msgSend(v54, "formattingStyle") == v38)
        {
          if (v30 == v32)
          {
            v39 = [HFLocalizableStringKey alloc];
            if (v53) {
              v40 = @"HFDailyTimerTriggerDetailEvery";
            }
            else {
              v40 = @"HFDailyTimerTriggerDetail";
            }
          }
          else if (v34)
          {
            v39 = [HFLocalizableStringKey alloc];
            v40 = @"HFWeekendTimerTriggerDetail";
          }
          else
          {
            if (!v33)
            {
              id v7 = v54;
              if ([v23 count] == 1 || (objc_msgSend(v54, "shouldUseFullDayNames") & 1) != 0)
              {
                v44 = [v9 weekdaySymbols];
              }
              else
              {
                v44 = [v9 shortWeekdaySymbols];
              }
              v55[0] = MEMORY[0x263EF8330];
              v55[1] = 3221225472;
              v55[2] = __125__HMTimerTrigger_NaturalLanguage__hf_recurrenceNaturalLanguageStringKeyWithOptions_recurrences_intendedForTimeTriggerEditor___block_invoke_4;
              v55[3] = &unk_26408FA78;
              id v45 = v44;
              id v56 = v45;
              v46 = objc_msgSend(v15, "na_map:", v55);
              if ([v46 count])
              {
                uint64_t v47 = [MEMORY[0x263F08950] localizedStringByJoiningStrings:v46];
                v51 = (void *)v47;
                if (v53) {
                  v48 = @"HFSomeDaysTimerTriggerDetailEvery";
                }
                else {
                  v48 = @"HFSomeDaysTimerTriggerDetail";
                }
                uint64_t v61 = v47;
                int v42 = 1;
                v49 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", &v61, 1, HFLocalizableStringKey);
                uint64_t v32 = [v50 stringKeyWithKey:v48 arguments:v49];
              }
              else
              {
                int v42 = 0;
              }

LABEL_51:
              if (v42) {
                v22 = (void *)v32;
              }
              else {
                v22 = 0;
              }
              if (v42 || (v53 & 1) == 0) {
                goto LABEL_58;
              }
              goto LABEL_56;
            }
            v39 = [HFLocalizableStringKey alloc];
            v40 = @"HFWeekdayTimerTriggerDetail";
          }
          v41 = [(HFLocalizableStringKey *)v39 initWithKey:v40 argumentKeys:0];
        }
        else
        {
          v41 = objc_alloc_init(HFEmptyLocalizableStringKey);
        }
        uint64_t v32 = (uint64_t)v41;
        int v42 = 1;
        id v7 = v54;
        goto LABEL_51;
      }

      int v33 = 0;
      int v34 = 1;
    }
LABEL_34:
    uint64_t v38 = 1;
    goto LABEL_38;
  }
  if ([v8 count] == 1)
  {
    uint64_t v17 = [v8 firstObject];
    v18 = objc_msgSend(MEMORY[0x263EFF918], "hf_dailyIntervalComponents");
    int v19 = objc_msgSend(v17, "hf_isEqualToHomeKitRecurrence:", v18);

    if (v19)
    {
      if (a5) {
        v20 = @"HFDailyTimerTriggerDetailEvery";
      }
      else {
        v20 = @"HFDailyTimerTriggerDetail";
      }
      v21 = +[HFLocalizableStringKey stringKeyWithKey:v20 argumentKeys:0];
      goto LABEL_57;
    }
  }
  if (!a5)
  {
    v22 = 0;
    goto LABEL_58;
  }
LABEL_56:
  v21 = [[HFLocalizableStringKey alloc] initWithKey:@"HFDailyTimerTriggerDetailNever" argumentKeys:0];
LABEL_57:
  v22 = v21;
LABEL_58:

  return v22;
}

+ (uint64_t)hf_recurrenceNaturalLanguageStringWithRecurrences:()NaturalLanguage
{
  return objc_msgSend(a1, "hf_recurrenceNaturalLanguageStringWithRecurrences:isEditor:", a3, 1);
}

+ (id)hf_recurrenceNaturalLanguageStringWithRecurrences:()NaturalLanguage isEditor:
{
  id v6 = a3;
  id v7 = +[HFHomeKitDispatcher sharedDispatcher];
  id v8 = [v7 homeManager];
  id v9 = [v8 homes];
  id v10 = [v9 firstObject];
  id v11 = +[HFTriggerNaturalLanguageOptions optionsWithHome:v10 nameType:2];

  [v11 setShouldUseFullDayNames:1];
  id v12 = objc_msgSend(a1, "hf_recurrenceNaturalLanguageStringKeyWithOptions:recurrences:intendedForTimeTriggerEditor:", v11, v6, a4);

  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v13 = [v12 localizedStringWithArgumentBlock:0];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

+ (id)_hf_naturalLanguageNameWithOptions:()NaturalLanguage timeString:fireDate:recurrences:
{
  v65[2] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void *)MEMORY[0x263EFF8F0];
  id v14 = a6;
  id v15 = [v13 currentCalendar];
  if (qword_26AB2EF30 != -1) {
    dispatch_once(&qword_26AB2EF30, &__block_literal_global_77_0);
  }
  id v16 = (id)qword_26AB2EF38;
  if (qword_26AB2EF40 != -1) {
    dispatch_once(&qword_26AB2EF40, &__block_literal_global_84);
  }
  id v59 = (id)qword_26AB2EF48;
  if (qword_26AB2EF50 != -1) {
    dispatch_once(&qword_26AB2EF50, &__block_literal_global_91);
  }
  id v60 = (id)qword_26AB2EF58;
  v63[0] = MEMORY[0x263EF8330];
  v63[1] = 3221225472;
  v63[2] = __102__HMTimerTrigger_NaturalLanguage___hf_naturalLanguageNameWithOptions_timeString_fireDate_recurrences___block_invoke_7;
  v63[3] = &unk_264091718;
  v63[4] = v16;
  uint64_t v17 = __102__HMTimerTrigger_NaturalLanguage___hf_naturalLanguageNameWithOptions_timeString_fireDate_recurrences___block_invoke_7((uint64_t)v63);
  v18 = objc_msgSend(a1, "hf_recurrenceNaturalLanguageStringKeyWithOptions:recurrences:", v10, v14);

  uint64_t v61 = v16;
  v62 = v18;
  long long v58 = a1;
  if (v18)
  {
    int v19 = [v18 key];
    if (qword_26AB2EF70 != -1) {
      dispatch_once(&qword_26AB2EF70, &__block_literal_global_98);
    }
    id v20 = (id)qword_26AB2EF78;
    v21 = [v20 objectForKeyedSubscript:v19];

    if (v21)
    {
      v22 = [v20 objectForKeyedSubscript:v19];
      id v23 = +[HFLocalizableStringKey stringKeyWithKey:v22 argumentKeys:v17];
    }
    else
    {
      if (![v19 isEqualToString:@"HFSomeDaysTimerTriggerDetail"])
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v23 = +[HFLocalizableStringKey stringKeyWithKey:@"HFShortTimerTriggerName" argumentKeys:v17];
        }
        else
        {
          id v23 = 0;
        }
LABEL_17:

        if (!v12) {
          goto LABEL_24;
        }
        goto LABEL_18;
      }
      v65[0] = v61;
      v65[1] = v59;
      uint64_t v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v65 count:2];
      id v23 = +[HFLocalizableStringKey stringKeyWithKey:@"HFSomeDaysTimerTriggerName" argumentKeys:v24];

      v22 = [v62 localizedStringWithArgumentBlock:0];
      [v23 argumentMap];
      id v25 = v12;
      v27 = int v26 = v15;
      [v27 setObject:v22 forKeyedSubscript:v59];

      id v15 = v26;
      id v12 = v25;
    }

    v18 = v62;
    goto LABEL_17;
  }
  id v23 = 0;
  if (!v12)
  {
LABEL_24:
    if (!v11) {
      goto LABEL_35;
    }
LABEL_25:
    if (v23) {
      goto LABEL_35;
    }
    v29 = _HFLocalizedStringWithDefaultValue(@"HFTimerTriggerTimeStringSunrise", @"HFTimerTriggerTimeStringSunrise", 1);
    int v30 = [v11 isEqualToString:v29];

    if (v30)
    {
      uint64_t v31 = @"HFOnceSunriseTimerTriggerName";
    }
    else
    {
      uint64_t v32 = _HFLocalizedStringWithDefaultValue(@"HFTimerTriggerTimeStringSunset", @"HFTimerTriggerTimeStringSunset", 1);
      int v33 = [v11 isEqualToString:v32];

      if (!v33)
      {
        uint64_t v31 = @"HFOnceTimerTriggerName";
        int v34 = v17;
        goto LABEL_34;
      }
      uint64_t v31 = @"HFOnceSunsetTimerTriggerName";
    }
    int v34 = 0;
LABEL_34:
    id v23 = +[HFLocalizableStringKey stringKeyWithKey:v31 argumentKeys:v34];
    goto LABEL_35;
  }
LABEL_18:
  if (v23) {
    goto LABEL_24;
  }
  if ([v15 isDateInToday:v12])
  {
    v28 = @"HFTodayTimerTriggerName";
LABEL_23:
    id v23 = +[HFLocalizableStringKey stringKeyWithKey:v28 argumentKeys:v17];
    goto LABEL_24;
  }
  if ([v15 isDateInTomorrow:v12])
  {
    v28 = @"HFTomorrowTimerTriggerName";
    goto LABEL_23;
  }
  v35 = [MEMORY[0x263F08790] localizedStringFromDate:v12 dateStyle:1 timeStyle:1];
  v64 = v35;
  uint64_t v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v64 count:1];
  id v23 = +[HFLocalizableStringKey stringKeyWithKey:@"HFFormattedDateTimerTriggerName" arguments:v36];

  v18 = v62;
  if (v11) {
    goto LABEL_25;
  }
LABEL_35:
  uint64_t v37 = [v10 actions];
  uint64_t v38 = [v37 count];

  if (v38)
  {
    id v57 = v12;
    v39 = v15;
    v40 = [v10 actionNaturalLanguageOptions];
    [v40 setFormattingContext:5];

    v41 = [v10 actions];
    int v42 = [v10 actionNaturalLanguageOptions];
    v43 = +[HFActionNaturalLanguageUtilities hf_naturalLanguageDescriptionForActions:v41 withOptions:v42];

    v44 = [v23 key];
    id v45 = [v44 stringByAppendingString:@"_WithAction"];

    uint64_t v46 = _HFLocalizedStringWithDefaultValue(v45, 0, 0);
    if (v46)
    {
      uint64_t v47 = (void *)v46;
      uint64_t v48 = [v43 length];

      if (v48)
      {
        [v23 setKey:v45];
        v49 = [v23 argumentKeys];
        id v50 = [v49 arrayByAddingObject:v60];
        [v23 setArgumentKeys:v50];

        v51 = [v23 argumentMap];
        [v51 setObject:v43 forKeyedSubscript:v60];
      }
    }

    id v15 = v39;
    id v12 = v57;
    v18 = v62;
  }
  if (!v23
    || ([v23 argumentMap],
        v52 = objc_claimAutoreleasedReturnValue(),
        [v52 setObject:v11 forKeyedSubscript:v61],
        v52,
        [v23 localizedStringWithArgumentBlock:0],
        (int v53 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    int v53 = _HFLocalizedStringWithDefaultValue(@"HFUnknownTimerTriggerName", @"HFUnknownTimerTriggerName", 1);
  }
  if (![v10 nameType])
  {
    v54 = [v10 home];
    uint64_t v55 = objc_msgSend(v58, "hf_sanitizeTriggerName:home:", v53, v54);

    int v53 = (void *)v55;
    v18 = v62;
  }

  return v53;
}

- (id)_hf_naturalLanguageDetailsSentenceElementsWithOptions:()NaturalLanguage
{
  id v4 = a3;
  v5 = objc_opt_class();
  id v6 = [a1 recurrences];
  if (v6)
  {
    id v7 = objc_msgSend(v5, "_hf_naturalLanguageDetailsSentenceElementsWithRecurrences:withOptions:", v6, v4);
  }
  else
  {
    id v8 = (void *)MEMORY[0x263EFF8C0];
    id v9 = [a1 recurrence];
    id v10 = objc_msgSend(v8, "na_arrayWithSafeObject:", v9);
    id v7 = objc_msgSend(v5, "_hf_naturalLanguageDetailsSentenceElementsWithRecurrences:withOptions:", v10, v4);
  }
  return v7;
}

+ (id)hf_naturalLanguageDetailsWithRecurrences:()NaturalLanguage withOptions:
{
  v1 = objc_msgSend(a1, "_hf_naturalLanguageDetailsSentenceElementsWithRecurrences:withOptions:");
  v2 = (void *)[v1 mutableCopy];

  if ([v2 count])
  {
    if (qword_26AB2EF80 != -1) {
      dispatch_once(&qword_26AB2EF80, &__block_literal_global_146);
    }
    id v3 = (id)qword_26AB2EF88;
    [v3 setListStyle:2];
    id v4 = [v2 array];
    v5 = [v3 stringForObjectValue:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)_hf_naturalLanguageDetailsSentenceElementsWithRecurrences:()NaturalLanguage withOptions:
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263EFF9B0] orderedSet];
  id v8 = v5;
  if ([v8 count])
  {
    id v9 = objc_msgSend((id)objc_opt_class(), "hf_recurrenceNaturalLanguageStringKeyWithOptions:recurrences:", v6, v8);
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v10 = [v9 localizedStringWithArgumentBlock:0];
        [v7 addObject:v10];
      }
    }
  }
  id v11 = (void *)[v7 copy];

  return v11;
}

@end