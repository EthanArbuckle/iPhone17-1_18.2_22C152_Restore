@interface TTRModularLargeComplicationTemplateGenerator
- (CLKComplicationTemplate)lockedTemplate;
- (CLKComplicationTemplate)privacyTemplate;
- (CLKComplicationTemplate)templateForNoScheduledReminders;
- (id)_headerTextProviderForReminder:(id)a3;
- (id)_templateForOverdueCount:(int64_t)a3;
- (id)_templateForReminder:(id)a3;
- (id)_templateWithBody1TextProvider:(id)a3;
- (id)_templateWithHeaderTextProvider:(id)a3 body1TextProvider:(id)a4;
- (id)templateForTimelineModelEntry:(id)a3;
@end

@implementation TTRModularLargeComplicationTemplateGenerator

- (CLKComplicationTemplate)lockedTemplate
{
  v3 = RemindersUICoreBundleGet();
  v4 = [v3 localizedStringForKey:@"Unlock to view" value:@"Unlock to view" table:@"Localizable"];
  v5 = +[CLKSimpleTextProvider textProviderWithText:v4];
  v6 = [(TTRModularLargeComplicationTemplateGenerator *)self _templateWithBody1TextProvider:v5];

  return (CLKComplicationTemplate *)v6;
}

- (CLKComplicationTemplate)privacyTemplate
{
  v3 = RemindersUICoreBundleGet();
  v4 = [v3 localizedStringForKey:@"Reminders" value:@"Reminders" table:@"Localizable"];
  v5 = +[CLKSimpleTextProvider textProviderWithText:v4];
  v6 = [(TTRModularLargeComplicationTemplateGenerator *)self _templateWithBody1TextProvider:v5];

  return (CLKComplicationTemplate *)v6;
}

- (id)templateForTimelineModelEntry:(id)a3
{
  id v4 = a3;
  id v5 = [v4 overdueCount];
  v6 = [v4 representativeReminder];

  if (v6)
  {
    uint64_t v7 = [(TTRModularLargeComplicationTemplateGenerator *)self _templateForReminder:v6];
  }
  else
  {
    if ((uint64_t)v5 < 1) {
      [(TTRModularLargeComplicationTemplateGenerator *)self templateForNoScheduledReminders];
    }
    else {
    uint64_t v7 = [(TTRModularLargeComplicationTemplateGenerator *)self _templateForOverdueCount:v5];
    }
  }
  v8 = (void *)v7;

  return v8;
}

- (id)_templateWithHeaderTextProvider:(id)a3 body1TextProvider:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)CLKComplicationTemplateModularLargeStandardBody) initWithHeaderImageProvider:0 headerTextProvider:v6 body1TextProvider:v5];

  v8 = +[TTRComplicationAsset tintColor];
  [v7 setTintColor:v8];

  return v7;
}

- (id)_templateWithBody1TextProvider:(id)a3
{
  id v4 = a3;
  id v5 = +[CLKTextProvider ttr_remindersAppNameTextProvider];
  id v6 = [(TTRModularLargeComplicationTemplateGenerator *)self _templateWithHeaderTextProvider:v5 body1TextProvider:v4];

  return v6;
}

- (id)_templateForOverdueCount:(int64_t)a3
{
  id v5 = RemindersUICoreBundleGet();
  id v6 = [v5 localizedStringForKey:@"COMPLICATION_%@ Overdue" value:@"%@ Overdue" table:@"PluralLocalizable"];
  id v7 = +[NSNumber numberWithInteger:a3];
  v8 = +[CLKTextProvider textProviderWithFormat:](CLKTextProvider, "textProviderWithFormat:", v6, v7);
  v9 = [(TTRModularLargeComplicationTemplateGenerator *)self _templateWithBody1TextProvider:v8];

  return v9;
}

- (id)_headerTextProviderForReminder:(id)a3
{
  id v3 = a3;
  id v4 = [v3 dueDate];
  id v5 = (char *)[v4 precision];

  if (v5 == (unsigned char *)&dword_0 + 1)
  {
    id v6 = TTRComplicationCalendarCreate();
    id v4 = [v3 makeDueTimeTextProviderUsingCalendar:v6 dropMinutesForRoundHours:0];
  }
  else if (!v5)
  {
    id v4 = +[CLKTextProvider ttr_remindersTodayTextProvider];
  }

  return v4;
}

- (id)_templateForReminder:(id)a3
{
  id v4 = a3;
  id v5 = [(TTRModularLargeComplicationTemplateGenerator *)self _headerTextProviderForReminder:v4];
  id v6 = [v4 title];

  if (v6) {
    CFStringRef v7 = v6;
  }
  else {
    CFStringRef v7 = &stru_10780;
  }
  v8 = +[CLKSimpleTextProvider textProviderWithText:v7];
  v9 = [(TTRModularLargeComplicationTemplateGenerator *)self _templateWithHeaderTextProvider:v5 body1TextProvider:v8];

  return v9;
}

- (CLKComplicationTemplate)templateForNoScheduledReminders
{
  id v3 = RemindersUICoreBundleGet();
  id v4 = [v3 localizedStringForKey:@"Today complete" value:@"Today complete" table:@"Localizable"];
  id v5 = +[CLKSimpleTextProvider textProviderWithText:v4];
  id v6 = [(TTRModularLargeComplicationTemplateGenerator *)self _templateWithBody1TextProvider:v5];

  return (CLKComplicationTemplate *)v6;
}

@end