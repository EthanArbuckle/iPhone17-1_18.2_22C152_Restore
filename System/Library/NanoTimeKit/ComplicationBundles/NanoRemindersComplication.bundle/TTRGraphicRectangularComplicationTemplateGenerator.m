@interface TTRGraphicRectangularComplicationTemplateGenerator
- (CLKComplicationTemplate)lockedTemplate;
- (CLKComplicationTemplate)privacyTemplate;
- (CLKComplicationTemplateGraphicRectangularStandardBody)templateForNoScheduledReminders;
- (id)_templateForOverdueCount:(int64_t)a3;
- (id)_templateForReminder:(id)a3;
- (id)_templateWithBody1TextProvider:(id)a3;
- (id)templateForTimelineModelEntry:(id)a3;
@end

@implementation TTRGraphicRectangularComplicationTemplateGenerator

- (CLKComplicationTemplate)lockedTemplate
{
  v3 = RemindersUICoreBundleGet();
  v4 = [v3 localizedStringForKey:@"Unlock to view" value:@"Unlock to view" table:@"Localizable"];
  v5 = +[CLKSimpleTextProvider textProviderWithText:v4];
  v6 = [(TTRGraphicRectangularComplicationTemplateGenerator *)self _templateWithBody1TextProvider:v5];

  return (CLKComplicationTemplate *)v6;
}

- (CLKComplicationTemplate)privacyTemplate
{
  v3 = RemindersUICoreBundleGet();
  v4 = [v3 localizedStringForKey:@"Reminders" value:@"Reminders" table:@"Localizable"];
  v5 = +[CLKSimpleTextProvider textProviderWithText:v4];
  v6 = [(TTRGraphicRectangularComplicationTemplateGenerator *)self _templateWithBody1TextProvider:v5];

  return (CLKComplicationTemplate *)v6;
}

- (id)templateForTimelineModelEntry:(id)a3
{
  id v4 = a3;
  id v5 = [v4 overdueCount];
  v6 = [v4 representativeReminder];

  if (v6)
  {
    uint64_t v7 = [(TTRGraphicRectangularComplicationTemplateGenerator *)self _templateForReminder:v6];
  }
  else
  {
    if ((uint64_t)v5 < 1) {
      [(TTRGraphicRectangularComplicationTemplateGenerator *)self templateForNoScheduledReminders];
    }
    else {
    uint64_t v7 = [(TTRGraphicRectangularComplicationTemplateGenerator *)self _templateForOverdueCount:v5];
    }
  }
  v8 = (void *)v7;
  v9 = +[TTRComplicationAsset tintColor];
  v10 = [v8 headerTextProvider];
  [v10 setTintColor:v9];

  return v8;
}

- (id)_templateForOverdueCount:(int64_t)a3
{
  id v4 = RemindersUICoreBundleGet();
  id v5 = [v4 localizedStringForKey:@"COMPLICATION_%@ Overdue" value:@"%@ Overdue" table:@"PluralLocalizable"];
  v6 = +[NSNumber numberWithInteger:a3];
  uint64_t v7 = +[CLKTextProvider textProviderWithFormat:](CLKTextProvider, "textProviderWithFormat:", v5, v6);

  id v8 = objc_alloc((Class)CLKComplicationTemplateGraphicRectangularStandardBody);
  v9 = +[CLKTextProvider ttr_remindersAppNameTextProvider];
  id v10 = [v8 initWithHeaderImageProvider:0 headerTextProvider:v9 body1TextProvider:v7];

  return v10;
}

- (id)_templateForReminder:(id)a3
{
  id v3 = a3;
  id v4 = [v3 dueDate];
  id v5 = (char *)[v4 precision];

  if (v5 == (unsigned char *)&dword_0 + 1)
  {
    uint64_t v7 = TTRComplicationCalendarCreate();
    v6 = [v3 makeDueTimeTextProviderUsingCalendar:v7 dropMinutesForRoundHours:0];
  }
  else if (v5)
  {
    v6 = 0;
  }
  else
  {
    v6 = +[CLKTextProvider ttr_remindersTodayTextProvider];
  }
  uint64_t v8 = [v3 title];
  v9 = (void *)v8;
  if (v8) {
    CFStringRef v10 = (const __CFString *)v8;
  }
  else {
    CFStringRef v10 = &stru_10780;
  }
  v11 = +[CLKSimpleTextProvider textProviderWithText:v10];

  id v12 = [objc_alloc((Class)CLKComplicationTemplateGraphicRectangularStandardBody) initWithHeaderImageProvider:0 headerTextProvider:v6 body1TextProvider:v11];

  return v12;
}

- (id)_templateWithBody1TextProvider:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)CLKComplicationTemplateGraphicRectangularStandardBody);
  id v5 = +[CLKTextProvider ttr_remindersAppNameTextProvider];
  id v6 = [v4 initWithHeaderImageProvider:0 headerTextProvider:v5 body1TextProvider:v3];

  return v6;
}

- (CLKComplicationTemplateGraphicRectangularStandardBody)templateForNoScheduledReminders
{
  id v3 = RemindersUICoreBundleGet();
  id v4 = [v3 localizedStringForKey:@"Today complete" value:@"Today complete" table:@"Localizable"];
  id v5 = +[CLKSimpleTextProvider textProviderWithText:v4];
  id v6 = [(TTRGraphicRectangularComplicationTemplateGenerator *)self _templateWithBody1TextProvider:v5];

  return (CLKComplicationTemplateGraphicRectangularStandardBody *)v6;
}

@end