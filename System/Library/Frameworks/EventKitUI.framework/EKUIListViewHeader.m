@interface EKUIListViewHeader
+ (BOOL)_isDateInCurrentYear:(id)a3 currentYearStart:(id *)a4 currentYearEnd:(id *)a5 timeZone:(id)a6;
+ (id)_stringForHeaderDate:(id)a3 currentYearStart:(id *)a4 currentYearEnd:(id *)a5 timeZone:(id)a6;
+ (id)headerWithTableView:(id)a3 reuseIdentifier:(id)a4 date:(id)a5 timeZone:(id)a6 currentYearStart:(id *)a7 currentYearEnd:(id *)a8;
@end

@implementation EKUIListViewHeader

+ (id)headerWithTableView:(id)a3 reuseIdentifier:(id)a4 date:(id)a5 timeZone:(id)a6 currentYearStart:(id *)a7 currentYearEnd:(id *)a8
{
  id v14 = a5;
  id v15 = a6;
  v16 = [a3 dequeueReusableHeaderFooterViewWithIdentifier:a4];
  v17 = [MEMORY[0x1E4FB1948] plainHeaderConfiguration];
  if (v14)
  {
    v18 = [a1 _stringForHeaderDate:v14 currentYearStart:a7 currentYearEnd:a8 timeZone:v15];
    [v17 setText:v18];
    [v17 setPrefersSideBySideTextAndSecondaryText:1];
    if (CUIKNSDateIsToday()) {
      CUIKAppTintColor();
    }
    else {
    v19 = [MEMORY[0x1E4FB1618] labelColor];
    }
    v20 = [v17 textProperties];
    [v20 setColor:v19];

    v21 = CUIKGetOverlayCalendar();
    if (v21)
    {
      v22 = [MEMORY[0x1E4F57B68] monthDayStringForDate:v14 inCalendar:v21];
      [v17 setSecondaryText:v22];
    }
    else
    {
      [v17 setSecondaryText:0];
    }
  }
  [v16 setContentConfiguration:v17];

  return v16;
}

+ (id)_stringForHeaderDate:(id)a3 currentYearStart:(id *)a4 currentYearEnd:(id *)a5 timeZone:(id)a6
{
  id v10 = a3;
  if ([a1 _isDateInCurrentYear:v10 currentYearStart:a4 currentYearEnd:a5 timeZone:a6]) {
    CUIKLongDayStringForDateNoYear();
  }
  else {
  v11 = CUIKLongDayStringForDate();
  }

  v12 = [v11 localizedUppercaseString];

  return v12;
}

+ (BOOL)_isDateInCurrentYear:(id)a3 currentYearStart:(id *)a4 currentYearEnd:(id *)a5 timeZone:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  if (!*a4)
  {
    v11 = (void *)MEMORY[0x1E4F57838];
    v12 = CUIKNowDate();
    v13 = [v11 calendarDateWithDate:v12 timeZone:v10];

    id v14 = [v13 calendarDateForYear];
    id v15 = [v14 calendarDateForEndOfYear];
    *a4 = [v14 date];
    *a5 = [v15 date];
  }
  BOOL v16 = objc_msgSend(v9, "compare:") != -1 && objc_msgSend(v9, "compare:", *a5) != 1;

  return v16;
}

@end