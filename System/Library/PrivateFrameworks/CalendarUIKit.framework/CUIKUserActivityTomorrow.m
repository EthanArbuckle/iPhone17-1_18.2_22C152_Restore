@interface CUIKUserActivityTomorrow
- (BOOL)isTomorrow;
- (CUIKUserActivityTomorrow)initWithDate:(id)a3 view:(unint64_t)a4 calendar:(id)a5;
- (CUIKUserActivityTomorrow)initWithDictionary:(id)a3;
- (id)dictionary;
- (void)updateActivity:(id)a3;
@end

@implementation CUIKUserActivityTomorrow

- (CUIKUserActivityTomorrow)initWithDate:(id)a3 view:(unint64_t)a4 calendar:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)CUIKUserActivityTomorrow;
  v5 = [(CUIKUserActivityCalendarDate *)&v9 initWithDate:a3 view:a4 calendar:a5];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"View Tomorrow" value:&stru_1F187C430 table:0];
    [(CUIKUserActivity *)v5 setActivityTitle:v7];
  }
  return v5;
}

- (CUIKUserActivityTomorrow)initWithDictionary:(id)a3
{
  v4 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a3];
  v5 = [v4 valueForKey:@"com.apple.calendarUIKit.userActivity.date"];

  if (!v5)
  {
    v6 = NSNumber;
    v7 = [MEMORY[0x1E4F1C9C8] date];
    [v7 timeIntervalSinceReferenceDate];
    v8 = objc_msgSend(v6, "numberWithDouble:");
    [v4 setValue:v8 forKey:@"com.apple.calendarUIKit.userActivity.date"];
  }
  v11.receiver = self;
  v11.super_class = (Class)CUIKUserActivityTomorrow;
  objc_super v9 = [(CUIKUserActivityCalendarDate *)&v11 initWithDictionary:v4];

  return v9;
}

- (id)dictionary
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v8.receiver = self;
  v8.super_class = (Class)CUIKUserActivityTomorrow;
  v4 = [(CUIKUserActivityCalendarDate *)&v8 dictionary];
  v5 = (void *)[v3 initWithDictionary:v4];

  v6 = [NSNumber numberWithBool:1];
  [v5 setObject:v6 forKey:@"com.apple.calendarUIKit.userActivity.tomorrow"];

  return v5;
}

- (void)updateActivity:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CUIKUserActivityTomorrow;
  id v4 = a3;
  [(CUIKUserActivityCalendarDate *)&v9 updateActivity:v4];
  objc_msgSend(v4, "_setEligibleForPrediction:", 1, v9.receiver, v9.super_class);
  [v4 setEligibleForSearch:1];
  v5 = (void *)MEMORY[0x1E4F1CA80];
  v6 = [(CUIKUserActivityTomorrow *)self dictionary];
  v7 = [v6 allKeys];
  objc_super v8 = [v5 setWithArray:v7];

  [v8 removeObject:@"com.apple.calendarUIKit.userActivity.date"];
  [v8 removeObject:@"com.apple.calendarUIKit.userActivity.view"];
  [v4 setRequiredUserInfoKeys:v8];
}

- (BOOL)isTomorrow
{
  return 1;
}

@end