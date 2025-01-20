@interface UNNotificationRequest(HKMenstrualCycles)
+ (id)_hkmc_notificationRequestWithCategory:()HKMenstrualCycles body:title:expirationDate:fertileWindowEndDayIndex:daysShiftedFromCalendarMethod:;
+ (id)_hkmc_notificationRequestWithContent:()HKMenstrualCycles;
+ (id)_hkmc_requestForCategoryIdentifier:()HKMenstrualCycles startDate:fertileWindowEndDayIndex:daysShiftedFromCalendarMethod:;
+ (id)hkmc_requestForCategoryIdentifier:()HKMenstrualCycles fertileWindowEndDayIndex:;
+ (id)hkmc_requestForCategoryIdentifier:()HKMenstrualCycles fertileWindowEndDayIndex:daysShiftedFromCalendarMethod:;
+ (uint64_t)hkmc_requestForCategoryIdentifier:()HKMenstrualCycles;
@end

@implementation UNNotificationRequest(HKMenstrualCycles)

+ (uint64_t)hkmc_requestForCategoryIdentifier:()HKMenstrualCycles
{
  return objc_msgSend(a1, "hkmc_requestForCategoryIdentifier:fertileWindowEndDayIndex:daysShiftedFromCalendarMethod:", a3, 0, 0);
}

+ (id)hkmc_requestForCategoryIdentifier:()HKMenstrualCycles fertileWindowEndDayIndex:daysShiftedFromCalendarMethod:
{
  v8 = (void *)MEMORY[0x263EFF910];
  id v9 = a5;
  id v10 = a3;
  v11 = [v8 date];
  v12 = objc_msgSend(a1, "_hkmc_requestForCategoryIdentifier:startDate:fertileWindowEndDayIndex:daysShiftedFromCalendarMethod:", v10, v11, a4, v9);

  return v12;
}

+ (id)hkmc_requestForCategoryIdentifier:()HKMenstrualCycles fertileWindowEndDayIndex:
{
  v6 = (void *)MEMORY[0x263EFF910];
  id v7 = a3;
  v8 = [v6 date];
  id v9 = objc_msgSend(a1, "_hkmc_requestForCategoryIdentifier:startDate:fertileWindowEndDayIndex:daysShiftedFromCalendarMethod:", v7, v8, a4, 0);

  return v9;
}

+ (id)_hkmc_requestForCategoryIdentifier:()HKMenstrualCycles startDate:fertileWindowEndDayIndex:daysShiftedFromCalendarMethod:
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = v10;
  id v14 = v12;
  if ([v13 isEqualToString:@"MenstrualCyclesAppPlugin.AfterPeriodStart"])
  {
    v15 = @"NOTIFICATION_AFTER_PERIOD_START_BODY";
LABEL_9:
    uint64_t v16 = HKMCLocalizedString(v15);
LABEL_10:
    v17 = (void *)v16;
    goto LABEL_11;
  }
  if ([v13 isEqualToString:@"MenstrualCyclesAppPlugin.AfterLoggedPeriodEnd"])
  {
    v15 = @"NOTIFICATION_AFTER_LOGGED_PERIOD_END_BODY";
    goto LABEL_9;
  }
  if ([v13 isEqualToString:@"MenstrualCyclesAppPlugin.AfterUnloggedPeriodEnd"])
  {
    v15 = @"NOTIFICATION_AFTER_UNLOGGED_PERIOD_END_BODY";
    goto LABEL_9;
  }
  if ([v13 isEqualToString:@"MenstrualCyclesAppPlugin.BeforePeriodStart1Day"])
  {
    v15 = @"NOTIFICATION_BEFORE_PERIOD_START_TOMORROW_BODY";
    goto LABEL_9;
  }
  if ([v13 isEqualToString:@"MenstrualCyclesAppPlugin.UnconfirmedDeviation"])
  {
    uint64_t v16 = HKMCLocalizedStringSelene(@"NOTIFICATION_UNCONFIRMED_DEVIATION_BODY");
    goto LABEL_10;
  }
  v23 = a1;
  v24 = HKMCBeforePeriodStartDaysNotificationCategories();
  int v25 = [v24 containsObject:v13];

  if (v25)
  {
    v26 = NSString;
    v27 = @"NOTIFICATION_BEFORE_PERIOD_START_DAYS_BODY_%ld";
LABEL_50:
    v48 = HKMCLocalizedString(v27);
    v17 = objc_msgSend(v26, "localizedStringWithFormat:", v48, HKMCNotificationDateComponentScalarFromCategory((uint64_t)v13));

    goto LABEL_51;
  }
  v28 = HKMCBeforePeriodStartWeeksNotificationCategories();
  int v29 = [v28 containsObject:v13];

  if (v29)
  {
    v26 = NSString;
    v27 = @"NOTIFICATION_BEFORE_PERIOD_START_WEEKS_BODY_%ld";
    goto LABEL_50;
  }
  v46 = HKMCBeforeFertileWindowStartDaysNotificationCategories();
  int v47 = [v46 containsObject:v13];

  if (v47)
  {
    v26 = NSString;
    v27 = @"NOTIFICATION_BEFORE_FERTILE_WINDOW_START_DAYS_BODY_%ld";
    goto LABEL_50;
  }
  if ([@"MenstrualCyclesAppPlugin.UpdatedFertileWindowEnd" isEqualToString:v13])
  {
    v68 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
    v66 = objc_msgSend(MEMORY[0x263EFF910], "hk_dateOnDayIndex:atHour:calendar:", a5, 20, v68);
    id v69 = 0;
    int v49 = objc_msgSend(MEMORY[0x263F08790], "hkmc_shouldUseRelativeFormatForFertileWindowEndDate:gregorianCalendar:dateFormatArgumentOut:", v66, v68, &v69);
    id v50 = v69;
    v51 = NSString;
    if (v49) {
      v52 = @"NOTIFICATION_UPDATE_FERTILE_WINDOW_BODY_RELATIVE_%@";
    }
    else {
      v52 = @"NOTIFICATION_UPDATE_FERTILE_WINDOW_BODY_FULL_%@";
    }
    v53 = HKMCLocalizedString(v52);
    uint64_t v54 = objc_msgSend(v51, "stringWithFormat:", v53, v50);

    v17 = (void *)v54;
  }
  else
  {
    if (![@"MenstrualCyclesAppPlugin.OvulationConfirmed" isEqualToString:v13])
    {
      v17 = 0;
      goto LABEL_51;
    }
    uint64_t v55 = [v14 integerValue];
    v68 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
    v66 = objc_msgSend(MEMORY[0x263EFF910], "hk_dateOnDayIndex:atHour:calendar:", a5, 20, v68);
    id v69 = 0;
    int v56 = objc_msgSend(MEMORY[0x263F08790], "hkmc_shouldUseRelativeFormatForFertileWindowEndDate:gregorianCalendar:dateFormatArgumentOut:", v66, v68, &v69);
    id v57 = v69;
    v58 = NSString;
    v59 = @"NOTIFICATION_OVULATION_CONFIRMED_BODY_RELATIVE_%@";
    if (v55) {
      v59 = @"NOTIFICATION_SHIFTED_OVULATION_CONFIRMED_BODY_RELATIVE_%@";
    }
    v60 = @"NOTIFICATION_OVULATION_CONFIRMED_BODY_FULL_%@";
    if (v55) {
      v60 = @"NOTIFICATION_SHIFTED_OVULATION_CONFIRMED_BODY_FULL_%@";
    }
    if (v56) {
      v61 = v59;
    }
    else {
      v61 = v60;
    }
    v62 = HKMCLocalizedString(v61);
    uint64_t v63 = objc_msgSend(v58, "stringWithFormat:", v62, v57);

    v17 = (void *)v63;
  }

LABEL_51:
  a1 = v23;
LABEL_11:

  id v18 = v13;
  v19 = HKMCBeforePeriodStartNotificationCategories();
  int v20 = [v19 containsObject:v18];

  if (v20)
  {
    v21 = @"NOTIFICATION_BEFORE_PERIOD_START_TITLE";
LABEL_31:
    uint64_t v22 = HKMCLocalizedString(v21);
    goto LABEL_32;
  }
  if ([@"MenstrualCyclesAppPlugin.AfterPeriodStart" isEqualToString:v18])
  {
    v21 = @"NOTIFICATION_AFTER_PERIOD_START_TITLE";
    goto LABEL_31;
  }
  if ([@"MenstrualCyclesAppPlugin.AfterLoggedPeriodEnd" isEqualToString:v18])
  {
    v21 = @"NOTIFICATION_AFTER_LOGGED_PERIOD_END_TITLE";
    goto LABEL_31;
  }
  if ([@"MenstrualCyclesAppPlugin.AfterUnloggedPeriodEnd" isEqualToString:v18])
  {
    v21 = @"NOTIFICATION_AFTER_UNLOGGED_PERIOD_END_TITLE";
    goto LABEL_31;
  }
  if ([@"MenstrualCyclesAppPlugin.UnconfirmedDeviation" isEqualToString:v18])
  {
    uint64_t v22 = HKMCLocalizedStringSelene(@"NOTIFICATION_UNCONFIRMED_DEVIATION_TITLE");
LABEL_32:
    v32 = (void *)v22;
    goto LABEL_33;
  }
  if ([@"MenstrualCyclesAppPlugin.OvulationConfirmed" isEqualToString:v18])
  {
    v21 = @"NOTIFICATION_OVULATION_CONFIRMED_TITLE";
    goto LABEL_31;
  }
  v30 = HKMCFertileWindowNotificationCategories();
  int v31 = [v30 containsObject:v18];

  if (v31)
  {
    v21 = @"NOTIFICATION_BEFORE_FERTILE_WINDOW_START_TITLE";
    goto LABEL_31;
  }
  v32 = 0;
LABEL_33:

  if (!v17)
  {
    v37 = 0;
    goto LABEL_45;
  }
  v67 = v17;
  id v33 = v18;
  id v34 = v11;
  v35 = [MEMORY[0x263F0A980] sharedBehavior];
  if ([v35 isAppleWatch])
  {
    v36 = 0;
LABEL_43:

    goto LABEL_44;
  }
  id v65 = v11;
  v38 = HKMCBeforePeriodStartDaysNotificationCategories();
  if ([v38 containsObject:v33])
  {
  }
  else
  {
    HKMCBeforeFertileWindowStartDaysNotificationCategories();
    v39 = a1;
    id v40 = v14;
    v42 = uint64_t v41 = a5;
    int v64 = [v42 containsObject:v33];

    a5 = v41;
    id v14 = v40;
    a1 = v39;

    if (!v64) {
      goto LABEL_41;
    }
  }
  uint64_t v43 = HKMCNotificationDateComponentScalarFromCategory((uint64_t)v33);
  if (v43 <= 6)
  {
    uint64_t v44 = v43;
    v35 = [MEMORY[0x263EFF8F0] currentCalendar];
    v36 = [v35 dateByAddingUnit:16 value:v44 toDate:v34 options:1024];
    id v11 = v65;
    goto LABEL_43;
  }
LABEL_41:
  v36 = 0;
  id v11 = v65;
LABEL_44:

  v17 = v67;
  v37 = objc_msgSend(a1, "_hkmc_notificationRequestWithCategory:body:title:expirationDate:fertileWindowEndDayIndex:daysShiftedFromCalendarMethod:", v33, v67, v32, v36, a5, v14);

LABEL_45:
  return v37;
}

+ (id)_hkmc_notificationRequestWithCategory:()HKMenstrualCycles body:title:expirationDate:fertileWindowEndDayIndex:daysShiftedFromCalendarMethod:
{
  v2 = objc_msgSend(MEMORY[0x263F1DEF0], "_hkmc_contentWithCategory:body:title:expirationDate:fertileWindowEndDayIndex:daysShiftedFromCalendarMethod:");
  v3 = objc_msgSend(a1, "_hkmc_notificationRequestWithContent:", v2);

  return v3;
}

+ (id)_hkmc_notificationRequestWithContent:()HKMenstrualCycles
{
  v3 = (void *)MEMORY[0x263F1DF68];
  id v4 = a3;
  v5 = [v3 soundWithAlertType:25];
  [v4 setSound:v5];

  v6 = (void *)MEMORY[0x263F1DF48];
  id v7 = [v4 categoryIdentifier];
  v8 = HKMCNotificationIdentifierForCategory(v7);
  id v9 = [v6 requestWithIdentifier:v8 content:v4 trigger:0];

  return v9;
}

@end