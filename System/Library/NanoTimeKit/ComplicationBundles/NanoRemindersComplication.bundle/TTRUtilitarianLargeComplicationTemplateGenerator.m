@interface TTRUtilitarianLargeComplicationTemplateGenerator
- (CLKComplicationTemplate)lockedTemplate;
- (CLKComplicationTemplate)privacyTemplate;
- (CLKComplicationTemplate)templateForNoScheduledReminders;
- (id)_templateForOverdueCount:(int64_t)a3;
- (id)_templateForReminder:(id)a3;
- (id)templateForTimelineModelEntry:(id)a3;
@end

@implementation TTRUtilitarianLargeComplicationTemplateGenerator

- (CLKComplicationTemplate)lockedTemplate
{
  v2 = RemindersUICoreBundleGet();
  v3 = [v2 localizedStringForKey:@"UNLOCK TO VIEW" value:@"UNLOCK TO VIEW" table:@"Localizable"];
  v4 = +[CLKSimpleTextProvider textProviderWithText:v3];

  id v5 = [objc_alloc((Class)CLKComplicationTemplateUtilitarianLargeFlat) initWithTextProvider:v4];

  return (CLKComplicationTemplate *)v5;
}

- (CLKComplicationTemplate)privacyTemplate
{
  v2 = RemindersUICoreBundleGet();
  v3 = [v2 localizedStringForKey:@"Reminders" value:@"Reminders" table:@"Localizable"];
  v4 = +[CLKSimpleTextProvider textProviderWithText:v3];

  id v5 = [objc_alloc((Class)CLKComplicationTemplateUtilitarianLargeFlat) initWithTextProvider:v4];

  return (CLKComplicationTemplate *)v5;
}

- (id)templateForTimelineModelEntry:(id)a3
{
  id v4 = a3;
  id v5 = [v4 overdueCount];
  v6 = [v4 representativeReminder];

  if (v6)
  {
    uint64_t v7 = [(TTRUtilitarianLargeComplicationTemplateGenerator *)self _templateForReminder:v6];
  }
  else
  {
    if ((uint64_t)v5 < 1) {
      [(TTRUtilitarianLargeComplicationTemplateGenerator *)self templateForNoScheduledReminders];
    }
    else {
    uint64_t v7 = [(TTRUtilitarianLargeComplicationTemplateGenerator *)self _templateForOverdueCount:v5];
    }
  }
  v8 = (void *)v7;

  return v8;
}

- (id)_templateForOverdueCount:(int64_t)a3
{
  id v4 = RemindersUICoreBundleGet();
  id v5 = [v4 localizedStringForKey:@"COMPLICATION_%@ Reminders Overdue" value:@"%@ Reminders Overdue" table:@"PluralLocalizable"];
  v6 = +[NSNumber numberWithInteger:a3];
  uint64_t v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v6);

  v8 = RemindersUICoreBundleGet();
  v9 = [v8 localizedStringForKey:@"COMPLICATION_%@ Overdue" value:@"%@ Overdue" table:@"PluralLocalizable"];
  v10 = +[NSNumber numberWithInteger:a3];
  v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v10);

  v12 = +[CLKSimpleTextProvider textProviderWithText:v7 shortText:v11];
  id v13 = [objc_alloc((Class)CLKComplicationTemplateUtilitarianLargeFlat) initWithTextProvider:v12];

  return v13;
}

- (id)_templateForReminder:(id)a3
{
  id v3 = a3;
  id v4 = TTRComplicationCalendarCreate();
  id v5 = [v3 makeTitleAndExactDueDateTextProviderUsingCalendar:v4 dropMinutesForRoundHours:0];

  id v6 = [objc_alloc((Class)CLKComplicationTemplateUtilitarianLargeFlat) initWithTextProvider:v5];

  return v6;
}

- (CLKComplicationTemplate)templateForNoScheduledReminders
{
  v2 = RemindersUICoreBundleGet();
  id v3 = [v2 localizedStringForKey:@"No Reminders Due" value:@"No Reminders Due" table:@"Localizable"];
  id v4 = +[CLKSimpleTextProvider textProviderWithText:v3];

  id v5 = [objc_alloc((Class)CLKComplicationTemplateUtilitarianLargeFlat) initWithTextProvider:v4];

  return (CLKComplicationTemplate *)v5;
}

@end