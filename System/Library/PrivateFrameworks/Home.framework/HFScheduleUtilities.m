@interface HFScheduleUtilities
+ (id)localizedDetailedStringForRule:(id)a3;
+ (id)localizedMainStringForRule:(id)a3;
+ (id)localizedStringForRule:(id)a3;
+ (id)localizedStringForSchedule:(id)a3;
+ (id)localizedStringFromScheduleType:(unint64_t)a3;
+ (id)sortComparatorForScheduleRules;
+ (id)sortedScheduleRules:(id)a3;
@end

@implementation HFScheduleUtilities

+ (id)localizedStringFromScheduleType:(unint64_t)a3
{
  switch(a3)
  {
    case 2uLL:
      v4 = @"HFScheduleType_Custom";
      goto LABEL_7;
    case 1uLL:
      v4 = @"HFScheduleType_SpecificDates";
      goto LABEL_7;
    case 0uLL:
      v4 = @"HFScheduleType_Always";
LABEL_7:
      _HFLocalizedStringWithDefaultValue(v4, v4, 1);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
  }
  v8 = [MEMORY[0x263F08690] currentHandler];
  v9 = [NSNumber numberWithUnsignedInteger:a3];
  [v8 handleFailureInMethod:a2, a1, @"HFScheduleUtilities.m", 26, @"Unknown schedule type [%@]", v9 object file lineNumber description];

  v5 = @"Unknown";
LABEL_9:
  return v5;
}

+ (id)localizedStringForSchedule:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = [v5 rules];
    v8 = [v7 anyObject];

    char v9 = [v8 isYearDayRule];
    v10 = [v6 rules];
    unint64_t v11 = [v10 count];

    if (v11 < 2)
    {
      uint64_t v16 = [a1 localizedStringForRule:v8];
    }
    else
    {
      if (v9) {
        v12 = @"HFSchedule_MultipleDates";
      }
      else {
        v12 = @"HFSchedule_MultipleTimes";
      }
      uint64_t v16 = _HFLocalizedStringWithDefaultValue(v12, v12, 1);
    }
    v15 = (void *)v16;
  }
  else
  {
    v13 = HFLogForCategory(0x46uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = NSStringFromSelector(a2);
      int v18 = 138412546;
      id v19 = a1;
      __int16 v20 = 2112;
      v21 = v14;
      _os_log_impl(&dword_20B986000, v13, OS_LOG_TYPE_DEFAULT, "%@: %@ No schedule provided. Returning default string with assumption that access is always allowed.", (uint8_t *)&v18, 0x16u);
    }
    v15 = [a1 localizedStringForRule:0];
  }

  return v15;
}

+ (id)localizedStringForRule:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = v5;
  if (!v5)
  {
    char v9 = HFLogForCategory(0x46uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      id v22 = a1;
      __int16 v23 = 2112;
      v24 = v10;
      _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "%@: %@ No rule provided. Returning default string with assumption that access is always allowed.", buf, 0x16u);
    }
    id v7 = a1;
    v8 = 0;
    goto LABEL_7;
  }
  if ([v5 isYearDayRule])
  {
    id v7 = a1;
    v8 = v6;
LABEL_7:
    unint64_t v11 = [v7 localizedMainStringForRule:v8];
    goto LABEL_8;
  }
  if ([v6 isWeekDayRule])
  {
    v13 = [a1 localizedMainStringForRule:v6];
    __int16 v20 = [a1 localizedDetailedStringForRule:v6];
    HFLocalizedStringWithFormat(@"HFScheduleRuleTimeInterval_FormatString", @"%@%@", v14, v15, v16, v17, v18, v19, (uint64_t)v13);
    unint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unint64_t v11 = &stru_26C081158;
  }
LABEL_8:

  return v11;
}

+ (id)localizedMainStringForRule:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = v5;
  if (!v5)
  {
    uint64_t v14 = HFLogForCategory(0x46uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      id v37 = a1;
      __int16 v38 = 2112;
      v39 = v15;
      _os_log_impl(&dword_20B986000, v14, OS_LOG_TYPE_DEFAULT, "%@: %@ No rule provided. Returning default main string with assumption that access is always allowed.", buf, 0x16u);
    }
    uint64_t v16 = @"HFScheduleType_Always";
    goto LABEL_8;
  }
  if ([v5 isYearDayRule])
  {
    id v7 = objc_alloc_init(MEMORY[0x263F08790]);
    [v7 setDateStyle:2];
    [v7 setTimeStyle:0];
    v8 = [v6 yearDayRule];
    char v9 = [v8 validFrom];

    v10 = [v6 yearDayRule];
    unint64_t v11 = [v10 validUntil];

    v12 = objc_msgSend(MEMORY[0x263EFF910], "hf_sharedCalendar");
    char v13 = [v12 isDateInToday:v9];

    if (v13) {
      _HFLocalizedStringWithDefaultValue(@"HFScheduleRuleDate_Today", @"HFScheduleRuleDate_Today", 1);
    }
    else {
    uint64_t v18 = [v7 stringFromDate:v9];
    }
    uint64_t v19 = [MEMORY[0x263EFF910] distantFuture];
    char v20 = [v19 isEqualToDate:v11];

    if (v20) {
      _HFLocalizedStringWithDefaultValue(@"HFScheduleRuleDate_Never", @"HFScheduleRuleDate_Never", 1);
    }
    else {
    v35 = [v7 stringFromDate:v11];
    }
    HFLocalizedStringWithFormat(@"HFScheduleRuleDateInterval_FormatString", @"%@%@", v21, v22, v23, v24, v25, v26, (uint64_t)v18);
    uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_18;
  }
  if (![v6 isWeekDayRule])
  {
    uint64_t v17 = &stru_26C081158;
    goto LABEL_19;
  }
  if ([v6 isAllDayWeekDayRule])
  {
    uint64_t v16 = @"HFScheduleRuleTime_AllDay";
LABEL_8:
    _HFLocalizedStringWithDefaultValue(v16, v16, 1);
    uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  id v7 = objc_alloc_init(MEMORY[0x263F087A8]);
  [v7 setDateStyle:0];
  [v7 setTimeStyle:1];
  v28 = objc_msgSend(MEMORY[0x263EFF910], "hf_sharedCalendar");
  v29 = [v6 weekDayRule];
  v30 = [v29 startTime];
  char v9 = [v28 dateFromComponents:v30];

  v31 = objc_msgSend(MEMORY[0x263EFF910], "hf_sharedCalendar");
  v32 = [v6 weekDayRule];
  v33 = [v32 endTime];
  v34 = [v31 dateFromComponents:v33];

  uint64_t v17 = [v7 stringFromDate:v9 toDate:v34];

LABEL_18:
LABEL_19:

  return v17;
}

+ (id)localizedDetailedStringForRule:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    if ([v5 isYearDayRule])
    {
      _HFLocalizedStringWithDefaultValue(@"HFScheduleRuleTime_AllDay", @"HFScheduleRuleTime_AllDay", 1);
      id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else if ([v6 isWeekDayRule])
    {
      unint64_t v11 = [v6 weekDayRule];
      [v11 daysOfTheWeek];
      v12 = HMDaysOfTheWeekToDateComponents();

      objc_msgSend(MEMORY[0x263F0E860], "hf_recurrenceNaturalLanguageStringWithRecurrences:isEditor:", v12, 0);
      id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v7 = &stru_26C081158;
    }
    v10 = v7;
  }
  else
  {
    v8 = HFLogForCategory(0x46uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      char v9 = NSStringFromSelector(a2);
      int v14 = 138412546;
      id v15 = a1;
      __int16 v16 = 2112;
      uint64_t v17 = v9;
      _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "%@: %@ No rule provided. Returning empty detailed string.", (uint8_t *)&v14, 0x16u);
    }
    v10 = &stru_26C081158;
  }

  return v10;
}

+ (id)sortedScheduleRules:(id)a3
{
  id v4 = a3;
  id v5 = [a1 sortComparatorForScheduleRules];
  v6 = [v4 sortedArrayUsingComparator:v5];

  return v6;
}

+ (id)sortComparatorForScheduleRules
{
  return &__block_literal_global_147;
}

uint64_t __53__HFScheduleUtilities_sortComparatorForScheduleRules__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  objc_opt_class();
  id v6 = v4;
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  uint64_t v8 = v7;

  objc_opt_class();
  id v9 = v5;
  if (objc_opt_isKindOfClass()) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  uint64_t v11 = v10;

  if (!(v8 | v11))
  {
    objc_opt_class();
    id v12 = v6;
    if (objc_opt_isKindOfClass()) {
      char v13 = v12;
    }
    else {
      char v13 = 0;
    }
    id v14 = v13;

    objc_opt_class();
    id v15 = v9;
    if (objc_opt_isKindOfClass()) {
      __int16 v16 = v15;
    }
    else {
      __int16 v16 = 0;
    }
    id v17 = v16;

    uint64_t v8 = [v14 rule];
    uint64_t v11 = [v17 rule];
  }
  if ([(id)v8 isYearDayRule] && objc_msgSend((id)v11, "isYearDayRule"))
  {
    uint64_t v18 = [(id)v8 yearDayRule];
    uint64_t v19 = [(id)v11 yearDayRule];
    char v20 = [v18 validFrom];
    uint64_t v21 = [v19 validFrom];
    uint64_t v22 = [v20 compare:v21];

    if (v22)
    {
LABEL_26:

      goto LABEL_27;
    }
    uint64_t v23 = [v18 validUntil];
    uint64_t v24 = [v19 validUntil];
    uint64_t v25 = [v23 compare:v24];
    goto LABEL_22;
  }
  if ([(id)v8 isWeekDayRule] && objc_msgSend((id)v11, "isWeekDayRule"))
  {
    uint64_t v18 = [(id)v8 weekDayRule];
    uint64_t v19 = [(id)v11 weekDayRule];
    uint64_t v26 = objc_msgSend(MEMORY[0x263EFF910], "hf_sharedCalendar");
    v27 = [v18 startTime];
    v28 = [v26 dateFromComponents:v27];

    v29 = objc_msgSend(MEMORY[0x263EFF910], "hf_sharedCalendar");
    v30 = [v19 startTime];
    uint64_t v24 = [v29 dateFromComponents:v30];

    uint64_t v23 = v28;
    uint64_t v25 = [v28 compare:v24];
    if (!v25)
    {
      v31 = objc_msgSend(MEMORY[0x263EFF910], "hf_sharedCalendar");
      [v18 endTime];
      v32 = __int16 v38 = v28;
      id v37 = [v31 dateFromComponents:v32];

      v33 = objc_msgSend(MEMORY[0x263EFF910], "hf_sharedCalendar");
      v34 = [v19 endTime];
      v36 = [v33 dateFromComponents:v34];

      uint64_t v23 = v38;
      uint64_t v22 = [v37 compare:v36];

      goto LABEL_25;
    }
LABEL_22:
    uint64_t v22 = v25;
LABEL_25:

    goto LABEL_26;
  }
  uint64_t v22 = 1;
LABEL_27:

  return v22;
}

@end