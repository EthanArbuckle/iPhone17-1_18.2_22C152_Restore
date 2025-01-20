@interface MSSendLaterContext
+ (BOOL)shouldShowSendLaterDisclaimerAlertForContext:(unint64_t)a3;
+ (id)_configuredTitleForFormat:(id)a3 date:(id)a4;
+ (id)_nextMondayMorning;
+ (id)titleAndDateForSendLaterContext:(unint64_t)a3;
+ (unint64_t)contextForCurrentDate;
+ (unint64_t)contextForDate:(id)a3;
@end

@implementation MSSendLaterContext

+ (unint64_t)contextForCurrentDate
{
  v2 = [MEMORY[0x1E4F1C9C8] now];
  unint64_t v3 = +[MSSendLaterContext contextForDate:v2];

  return v3;
}

+ (unint64_t)contextForDate:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  v5 = (void *)[v4 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  v6 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  [v5 setTimeZone:v6];

  v21 = objc_msgSend(MEMORY[0x1E4F1C9C8], "ef_midnightInNdays:", 0);
  uint64_t v7 = [v5 dateBySettingHour:7 minute:30 second:0 ofDate:v3 options:0];
  v20 = (void *)v7;
  if (objc_msgSend(v3, "ef_isLaterThanOrEqualDate:", v21))
  {
    if (objc_msgSend(v3, "ef_isEarlierThanDate:", v7)) {
      unint64_t v8 = 35;
    }
    else {
      unint64_t v8 = 33;
    }
  }
  else
  {
    unint64_t v8 = 33;
  }
  v9 = [v5 dateBySettingHour:5 minute:0 second:0 ofDate:v3 options:0];
  v10 = [v5 dateBySettingHour:20 minute:30 second:0 ofDate:v3 options:0];
  if (objc_msgSend(v3, "ef_isLaterThanOrEqualDate:", v9)
    && objc_msgSend(v3, "ef_isEarlierThanDate:", v10))
  {
    v8 |= 4uLL;
  }
  v11 = [v5 dateBySettingHour:12 minute:0 second:0 ofDate:v3 options:0];
  v12 = objc_msgSend(MEMORY[0x1E4F1C9C8], "ef_midnightInNdays:", 1);
  if (objc_msgSend(v3, "ef_isLaterThanOrEqualDate:", v11)
    && objc_msgSend(v3, "ef_isEarlierThanDate:", v12))
  {
    v8 |= 8uLL;
  }
  v13 = [v5 components:512 fromDate:v3];
  uint64_t v14 = [v13 weekday];

  if (v14 == 1) {
    uint64_t v15 = -1;
  }
  else {
    uint64_t v15 = 6;
  }
  v16 = objc_msgSend(MEMORY[0x1E4F1C9C8], "ef_thisWeekday:hour:minute:second:", v15, 17, 0, 0);
  if (v14 == 1) {
    uint64_t v17 = 1;
  }
  else {
    uint64_t v17 = 8;
  }
  v18 = objc_msgSend(MEMORY[0x1E4F1C9C8], "ef_thisWeekday:hour:minute:second:", v17, 12, 0, 0);
  if (objc_msgSend(v3, "ef_isLaterThanOrEqualDate:", v16)
    && objc_msgSend(v3, "ef_isEarlierThanDate:", v18))
  {
    v8 |= 0x10uLL;
  }

  return v8;
}

+ (BOOL)shouldShowSendLaterDisclaimerAlertForContext:(unint64_t)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  char v5 = [v4 BOOLForKey:*MEMORY[0x1E4F601A0]];

  char v6 = v5 ^ 1;
  if (a3 == 1) {
    char v6 = 0;
  }
  if ((a3 & 0xFFFFFFFFFFFFFFDFLL) != 0) {
    return v6;
  }
  else {
    return 0;
  }
}

+ (id)titleAndDateForSendLaterContext:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      goto LABEL_4;
    case 2uLL:
      char v6 = objc_msgSend(MEMORY[0x1E4F1C9C8], "ef_morning");
      uint64_t v7 = (void *)MEMORY[0x1E4F60DF0];
      unint64_t v8 = [a1 _configuredTitleForFormat:@"Send at %@" date:v6];
      uint64_t v9 = [v7 pairWithFirst:v8 second:v6];
      goto LABEL_9;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_11;
    case 4uLL:
      char v6 = objc_msgSend(MEMORY[0x1E4F1C9C8], "ef_tonight");
      v10 = (void *)MEMORY[0x1E4F60DF0];
      unint64_t v8 = [a1 _configuredTitleForFormat:@"Send %@ Tonight" date:v6];
      uint64_t v9 = [v10 pairWithFirst:v8 second:v6];
      goto LABEL_9;
    case 8uLL:
      char v6 = objc_msgSend(MEMORY[0x1E4F1C9C8], "ef_tomorrowMorning");
      v11 = (void *)MEMORY[0x1E4F60DF0];
      unint64_t v8 = [a1 _configuredTitleForFormat:@"Send %@ Tomorrow" date:v6];
      uint64_t v9 = [v11 pairWithFirst:v8 second:v6];
      goto LABEL_9;
    default:
      if (a3 == 16)
      {
        char v6 = +[MSSendLaterContext _nextMondayMorning];
        v12 = (void *)MEMORY[0x1E4F60DF0];
        unint64_t v8 = [a1 _configuredTitleForFormat:@"Send %@ Monday" date:v6];
        uint64_t v9 = [v12 pairWithFirst:v8 second:v6];
LABEL_9:
        id v3 = (void *)v9;
      }
      else
      {
        if (a3 != 32) {
          goto LABEL_11;
        }
LABEL_4:
        char v5 = (void *)MEMORY[0x1E4F60DF0];
        char v6 = _EFLocalizedString();
        id v3 = [v5 pairWithFirst:v6 second:0];
      }

LABEL_11:
      return v3;
  }
}

+ (id)_nextMondayMorning
{
  id v2 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  id v3 = (void *)[v2 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  id v4 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  [v3 setTimeZone:v4];

  char v5 = [MEMORY[0x1E4F1C9C8] now];
  char v6 = [v3 components:512 fromDate:v5];
  uint64_t v7 = [v6 weekday];

  if (v7 == 1) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 9;
  }
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1C9C8], "ef_thisWeekday:hour:minute:second:", v8, 8, 0, 0);

  return v9;
}

+ (id)_configuredTitleForFormat:(id)a3 date:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28C10], "ef_formatterForStyle:", 4);
  uint64_t v8 = [v7 formattingContext];
  [v7 setFormattingContext:5];
  uint64_t v9 = [v7 stringFromDate:v6];
  v10 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v11 = [v10 component:32 fromDate:v6];
  v12 = NSString;
  v13 = _EFLocalizedString();
  uint64_t v14 = objc_msgSend(v12, "localizedStringWithFormat:", v13, v11, v9);

  [v7 setFormattingContext:v8];
  return v14;
}

@end