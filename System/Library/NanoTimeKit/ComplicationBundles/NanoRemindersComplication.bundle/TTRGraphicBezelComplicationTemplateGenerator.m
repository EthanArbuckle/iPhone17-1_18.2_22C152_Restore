@interface TTRGraphicBezelComplicationTemplateGenerator
- (CLKComplicationTemplate)lockedTemplate;
- (CLKComplicationTemplate)privacyTemplate;
- (TTRGraphicCircularComplicationTemplateGenerator)graphicCircularTemplateGenerator;
- (id)_templateWithTextProvider:(id)a3;
- (id)_textProviderForOverdueCount:(int64_t)a3;
- (id)_textProviderForRemainingDueTodayCount:(int64_t)a3;
- (id)_textProviderForReminder:(id)a3;
- (id)_textProviderForTimelineModelEntry:(id)a3;
- (id)templateForTimelineModelEntry:(id)a3;
@end

@implementation TTRGraphicBezelComplicationTemplateGenerator

- (CLKComplicationTemplate)lockedTemplate
{
  v3 = RemindersUICoreBundleGet();
  v4 = [v3 localizedStringForKey:@"Unlock to view" value:@"Unlock to view" table:@"Localizable"];
  v5 = +[CLKSimpleTextProvider textProviderWithText:v4];
  v6 = [(TTRGraphicBezelComplicationTemplateGenerator *)self _templateWithTextProvider:v5];

  return (CLKComplicationTemplate *)v6;
}

- (CLKComplicationTemplate)privacyTemplate
{
  v3 = RemindersUICoreBundleGet();
  v4 = [v3 localizedStringForKey:@"Reminders" value:@"Reminders" table:@"Localizable"];
  v5 = +[CLKSimpleTextProvider textProviderWithText:v4];
  v6 = [(TTRGraphicBezelComplicationTemplateGenerator *)self _templateWithTextProvider:v5];

  return (CLKComplicationTemplate *)v6;
}

- (id)templateForTimelineModelEntry:(id)a3
{
  v4 = [(TTRGraphicBezelComplicationTemplateGenerator *)self _textProviderForTimelineModelEntry:a3];
  v5 = [(TTRGraphicBezelComplicationTemplateGenerator *)self _templateWithTextProvider:v4];

  return v5;
}

- (TTRGraphicCircularComplicationTemplateGenerator)graphicCircularTemplateGenerator
{
  v2 = objc_alloc_init(TTRGraphicCircularComplicationTemplateGenerator);

  return v2;
}

- (id)_templateWithTextProvider:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)CLKComplicationTemplateGraphicBezelCircularText);
  v6 = [(TTRGraphicBezelComplicationTemplateGenerator *)self graphicCircularTemplateGenerator];
  v7 = [v6 complicationTemplate];
  id v8 = [v5 initWithCircularTemplate:v7 textProvider:v4];

  return v8;
}

- (id)_textProviderForTimelineModelEntry:(id)a3
{
  id v4 = a3;
  id v5 = [v4 overdueCount];
  id v6 = [v4 remainingDueTodayCount];
  if ((uint64_t)v5 < 1)
  {
    id v8 = v6;
    if ((uint64_t)v6 <= 1)
    {
      v10 = objc_msgSend(v4, "representativeReminder", v6);

      if (v10)
      {
        v11 = [v4 representativeReminder];
        v12 = [(TTRGraphicBezelComplicationTemplateGenerator *)self _textProviderForReminder:v11];

        goto LABEL_10;
      }
      v9 = self;
      id v8 = 0;
    }
    else
    {
      v9 = self;
    }
    uint64_t v7 = [(TTRGraphicBezelComplicationTemplateGenerator *)v9 _textProviderForRemainingDueTodayCount:v8];
  }
  else
  {
    uint64_t v7 = [(TTRGraphicBezelComplicationTemplateGenerator *)self _textProviderForOverdueCount:v5];
  }
  v12 = (void *)v7;
LABEL_10:

  return v12;
}

- (id)_textProviderForReminder:(id)a3
{
  id v3 = a3;
  id v4 = TTRComplicationCalendarCreate();
  id v5 = [v3 makeTitleAndExactDueDateTextProviderUsingCalendar:v4 dropMinutesForRoundHours:1];

  return v5;
}

- (id)_textProviderForRemainingDueTodayCount:(int64_t)a3
{
  id v4 = RemindersUICoreBundleGet();
  id v5 = [v4 localizedStringForKey:@"COMPLICATION_%@ Items Due Today" value:@"%@ Items Due Today" table:@"PluralLocalizable"];
  id v6 = +[NSNumber numberWithInteger:a3];
  uint64_t v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v6);

  id v8 = RemindersUICoreBundleGet();
  v9 = [v8 localizedStringForKey:@"COMPLICATION_%@ Items Today" value:@"%@ Items Today" table:@"PluralLocalizable"];
  v10 = +[NSNumber numberWithInteger:a3];
  v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v10);

  v12 = +[CLKSimpleTextProvider textProviderWithText:v7 shortText:v11];

  return v12;
}

- (id)_textProviderForOverdueCount:(int64_t)a3
{
  id v4 = RemindersUICoreBundleGet();
  id v5 = [v4 localizedStringForKey:@"COMPLICATION_%@ Overdue" value:@"%@ Overdue" table:@"PluralLocalizable"];
  id v6 = +[NSNumber numberWithInteger:a3];
  uint64_t v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v6);

  id v8 = +[CLKSimpleTextProvider textProviderWithText:v7];

  return v8;
}

@end