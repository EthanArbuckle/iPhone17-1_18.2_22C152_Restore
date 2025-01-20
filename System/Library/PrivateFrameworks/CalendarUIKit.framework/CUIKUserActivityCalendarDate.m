@interface CUIKUserActivityCalendarDate
- (BOOL)isTomorrow;
- (CUIKUserActivityCalendarDate)initWithDate:(id)a3 view:(unint64_t)a4;
- (CUIKUserActivityCalendarDate)initWithDate:(id)a3 view:(unint64_t)a4 calendar:(id)a5;
- (CUIKUserActivityCalendarDate)initWithDictionary:(id)a3;
- (NSDate)date;
- (id)dictionary;
- (unint64_t)view;
- (void)updateActivity:(id)a3;
@end

@implementation CUIKUserActivityCalendarDate

- (void)updateActivity:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CUIKUserActivityCalendarDate;
  [(CUIKUserActivity *)&v5 updateActivity:v4];
  [v4 _setEligibleForPrediction:0];
  if ([(CUIKUserActivity *)self type] == 4097) {
    [v4 _setEligibleForUserActivityIndexing:0];
  }
}

- (CUIKUserActivityCalendarDate)initWithDate:(id)a3 view:(unint64_t)a4 calendar:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)CUIKUserActivityCalendarDate;
  v11 = [(CUIKUserActivity *)&v22 initWithType:4097];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_date, a3);
    v12->_view = a4;
    switch(a4)
    {
      case 0uLL:
        v14 = CUIKBundle();
        v15 = v14;
        v16 = @"Calendar";
        goto LABEL_9;
      case 1uLL:
        v14 = CUIKBundle();
        v15 = v14;
        v16 = @"Calendar Day View";
        goto LABEL_9;
      case 2uLL:
        v14 = CUIKBundle();
        v15 = v14;
        v16 = @"Calendar Week View";
        goto LABEL_9;
      case 3uLL:
      case 6uLL:
        v13 = +[CUIKDateStrings yearMonthStringForDate:v9 inCalendar:v10];
        [(CUIKUserActivity *)v12 setActivityTitle:v13];

        v14 = CUIKBundle();
        v15 = v14;
        v16 = @"Calendar Month View";
        goto LABEL_9;
      case 4uLL:
        v17 = +[CUIKDateStrings yearStringForDate:v9 inCalendar:v10];
        [(CUIKUserActivity *)v12 setActivityTitle:v17];

        v14 = CUIKBundle();
        v15 = v14;
        v16 = @"Calendar Year View";
        goto LABEL_9;
      case 5uLL:
        v14 = CUIKBundle();
        v15 = v14;
        v16 = @"Calendar List View";
LABEL_9:
        v18 = [v14 localizedStringForKey:v16 value:&stru_1F187C430 table:0];
        [(CUIKUserActivity *)v12 setActivitySubtitle:v18];

        break;
      default:
        break;
    }
    v19 = [(CUIKUserActivity *)v12 activityTitle];

    if (!v19)
    {
      v20 = +[CUIKDateStrings longStringForDate:v9 inCalendar:v10];
      [(CUIKUserActivity *)v12 setActivityTitle:v20];
    }
  }

  return v12;
}

- (id)dictionary
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v11.receiver = self;
  v11.super_class = (Class)CUIKUserActivityCalendarDate;
  id v4 = [(CUIKUserActivity *)&v11 dictionary];
  objc_super v5 = (void *)[v3 initWithDictionary:v4];

  v12[0] = @"com.apple.calendarUIKit.userActivity.date";
  v6 = NSNumber;
  [(NSDate *)self->_date timeIntervalSinceReferenceDate];
  v7 = objc_msgSend(v6, "numberWithDouble:");
  v12[1] = @"com.apple.calendarUIKit.userActivity.view";
  v13[0] = v7;
  v8 = [NSNumber numberWithUnsignedInteger:self->_view];
  v13[1] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  [v5 addEntriesFromDictionary:v9];

  return v5;
}

- (void).cxx_destruct
{
}

- (CUIKUserActivityCalendarDate)initWithDate:(id)a3 view:(unint64_t)a4
{
  v6 = (void *)MEMORY[0x1E4F1C9A8];
  id v7 = a3;
  v8 = [v6 currentCalendar];
  id v9 = [(CUIKUserActivityCalendarDate *)self initWithDate:v7 view:a4 calendar:v8];

  return v9;
}

- (CUIKUserActivityCalendarDate)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CUIKUserActivityCalendarDate;
  objc_super v5 = [(CUIKUserActivity *)&v14 initWithDictionary:v4];
  if (!v5)
  {
LABEL_8:
    id v7 = v5;
    goto LABEL_9;
  }
  char v13 = 0;
  [(id)objc_opt_class() _doubleFromDictionary:v4 key:@"com.apple.calendarUIKit.userActivity.date" error:&v13];
  if (!v13)
  {
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:v6];
    date = v5->_date;
    v5->_date = (NSDate *)v8;

    uint64_t v10 = [(id)objc_opt_class() _unsignedIntegerFromDictionary:v4 key:@"com.apple.calendarUIKit.userActivity.view" error:&v13];
    if (v13) {
      unint64_t v11 = 0;
    }
    else {
      unint64_t v11 = v10;
    }
    v5->_view = v11;
    goto LABEL_8;
  }
  id v7 = 0;
LABEL_9:

  return v7;
}

- (BOOL)isTomorrow
{
  return 0;
}

- (NSDate)date
{
  return self->_date;
}

- (unint64_t)view
{
  return self->_view;
}

@end