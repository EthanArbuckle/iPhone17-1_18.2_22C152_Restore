@interface CUIKUserActivityRemindersListDate
- (CUIKUserActivityRemindersListDate)initWithDate:(id)a3;
- (CUIKUserActivityRemindersListDate)initWithDate:(id)a3 calendar:(id)a4;
- (CUIKUserActivityRemindersListDate)initWithDictionary:(id)a3;
- (NSDate)date;
- (id)dictionary;
@end

@implementation CUIKUserActivityRemindersListDate

- (CUIKUserActivityRemindersListDate)initWithDate:(id)a3 calendar:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CUIKUserActivityRemindersListDate;
  v9 = [(CUIKUserActivity *)&v17 initWithType:3];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_date, a3);
    v11 = +[CUIKDateStrings mediumStringForDate:v7 inCalendar:v8];
    v12 = NSString;
    v13 = [MEMORY[0x1E4F28B50] mainBundle];
    v14 = [v13 localizedStringForKey:@"Reminders on date" value:@"Reminders on %@" table:0];
    v15 = objc_msgSend(v12, "localizedStringWithFormat:", v14, v11);
    [(CUIKUserActivity *)v10 setActivityTitle:v15];

    [(CUIKUserActivity *)v10 setActivitySubtitle:&stru_1F187C430];
  }

  return v10;
}

- (CUIKUserActivityRemindersListDate)initWithDate:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1C9A8];
  id v5 = a3;
  v6 = [v4 currentCalendar];
  id v7 = [(CUIKUserActivityRemindersListDate *)self initWithDate:v5 calendar:v6];

  return v7;
}

- (CUIKUserActivityRemindersListDate)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CUIKUserActivityRemindersListDate;
  id v5 = [(CUIKUserActivity *)&v12 initWithDictionary:v4];
  if (!v5) {
    goto LABEL_5;
  }
  char v11 = 0;
  [(id)objc_opt_class() _doubleFromDictionary:v4 key:@"com.apple.calendarUIKit.userActivity.date" error:&v11];
  if (!v11)
  {
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:v6];
    date = v5->_date;
    v5->_date = (NSDate *)v8;

LABEL_5:
    id v7 = v5;
    goto LABEL_6;
  }
  id v7 = 0;
LABEL_6:

  return v7;
}

- (id)dictionary
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v10.receiver = self;
  v10.super_class = (Class)CUIKUserActivityRemindersListDate;
  id v4 = [(CUIKUserActivity *)&v10 dictionary];
  id v5 = (void *)[v3 initWithDictionary:v4];

  char v11 = @"com.apple.calendarUIKit.userActivity.date";
  double v6 = NSNumber;
  [(NSDate *)self->_date timeIntervalSinceReferenceDate];
  id v7 = objc_msgSend(v6, "numberWithDouble:");
  v12[0] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  [v5 addEntriesFromDictionary:v8];

  return v5;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
}

@end