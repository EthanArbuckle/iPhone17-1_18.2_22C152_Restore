@interface EKUICalendarListViewHeader
+ (BOOL)_isDateInCurrentYear:(id)a3 timeZone:(id)a4;
+ (id)_mainDateStringWithDate:(id)a3 timeZone:(id)a4 abbreviate:(BOOL)a5;
+ (id)_overlayCalendarDateStringWithDate:(id)a3;
+ (id)_weekNumberStringWithDate:(id)a3 timeZone:(id)a4;
- (EKUICalendarListViewHeader)initWithReuseIdentifier:(id)a3;
- (id)calendarListContentConfiguration;
- (void)configureWithDate:(id)a3 timeZone:(id)a4;
@end

@implementation EKUICalendarListViewHeader

- (EKUICalendarListViewHeader)initWithReuseIdentifier:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)EKUICalendarListViewHeader;
  v3 = [(EKUICalendarListViewHeader *)&v7 initWithReuseIdentifier:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(EKUICalendarListViewHeader *)v3 calendarListContentConfiguration];
    [(EKUICalendarListViewHeader *)v4 setContentConfiguration:v5];
  }
  return v4;
}

- (void)configureWithDate:(id)a3 timeZone:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  objc_super v7 = [(EKUICalendarListViewHeader *)self calendarListContentConfiguration];
  if (v19)
  {
    if (CUIKNSDateIsToday())
    {
      uint64_t v8 = CUIKAppTintColor();
    }
    else
    {
      v9 = [MEMORY[0x1E4F57838] calendarDateWithDate:v19 timeZone:v6];
      v10 = [v9 calendarDateForEndOfDay];
      v11 = [v10 date];
      v12 = CUIKNowDate();
      uint64_t v13 = [v11 compare:v12];

      if (v13 == -1) {
        [MEMORY[0x1E4FB1618] secondaryLabelColor];
      }
      else {
      uint64_t v8 = [MEMORY[0x1E4FB1618] labelColor];
      }
    }
    v14 = (void *)v8;
    [v7 setMainTextColor:v8];
    v15 = [(id)objc_opt_class() _mainDateStringWithDate:v19 timeZone:v6 abbreviate:0];
    [v7 setMainText:v15];

    v16 = [(id)objc_opt_class() _mainDateStringWithDate:v19 timeZone:v6 abbreviate:1];
    [v7 setMainTextAbbr:v16];

    v17 = [(id)objc_opt_class() _weekNumberStringWithDate:v19 timeZone:v6];
    [v7 setWeekNumberText:v17];

    v18 = [(id)objc_opt_class() _overlayCalendarDateStringWithDate:v19];
    [v7 setAltCalendarText:v18];

    [(EKUICalendarListViewHeader *)self setContentConfiguration:v7];
  }
}

+ (id)_overlayCalendarDateStringWithDate:(id)a3
{
  id v3 = a3;
  v4 = CUIKGetOverlayCalendar();
  if (v4)
  {
    v5 = [MEMORY[0x1E4F57B68] monthDayStringForDate:v3 inCalendar:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)_weekNumberStringWithDate:(id)a3 timeZone:(id)a4
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F57C00] sharedPreferences];
  int v6 = [v5 showWeekNumbers];

  if (v6)
  {
    objc_super v7 = [v4 localizedWeekNumber];
    uint64_t v8 = NSString;
    v9 = EventKitUIBundle();
    v10 = [v9 localizedStringForKey:@"W%@" value:&stru_1F0CC2140 table:0];
    v11 = objc_msgSend(v8, "localizedStringWithFormat:", v10, v7);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)_mainDateStringWithDate:(id)a3 timeZone:(id)a4 abbreviate:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  if (([a1 _isDateInCurrentYear:v8 timeZone:a4] & 1) != 0 || !v5)
  {
    v9 = CUIKLongEmDashDayStringForDate();
  }
  else
  {
    v9 = CUIKAbbreviatedEmDashDayStringForDate();
  }
  v10 = v9;
  v11 = [v9 localizedUppercaseString];

  return v11;
}

+ (BOOL)_isDateInCurrentYear:(id)a3 timeZone:(id)a4
{
  id v5 = a3;
  int v6 = (void *)MEMORY[0x1E4F57838];
  id v7 = a4;
  id v8 = CUIKNowDate();
  v9 = [v6 calendarDateWithDate:v8 timeZone:v7];

  v10 = [v9 calendarDateForYear];
  v11 = [v10 calendarDateForEndOfYear];
  v12 = [v10 date];
  uint64_t v13 = [v11 date];
  BOOL v14 = [v5 compare:v12] != -1 && objc_msgSend(v5, "compare:", v13) != 1;

  return v14;
}

- (id)calendarListContentConfiguration
{
  v2 = objc_alloc_init(EKUICalendarListContentConfiguration);
  id v3 = [MEMORY[0x1E4FB1618] labelColor];
  [(EKUICalendarListContentConfiguration *)v2 setMainTextColor:v3];

  id v4 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(EKUICalendarListContentConfiguration *)v2 setSecondaryTextColor:v4];

  return v2;
}

@end