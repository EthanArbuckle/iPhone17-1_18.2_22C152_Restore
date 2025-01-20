@interface WDSleepScheduleListDataProvider
- (WDSleepScheduleListDataProvider)initWithDisplayType:(id)a3 profile:(id)a4;
- (id)sampleTypes;
- (id)secondaryTextForObject:(id)a3;
- (id)textForObject:(id)a3;
- (id)titleForSection:(unint64_t)a3;
- (int64_t)cellStyle;
- (unint64_t)numberOfSections;
- (void)removeObjectAtIndex:(unint64_t)a3 forSection:(unint64_t)a4 sectionRemoved:(BOOL *)a5;
@end

@implementation WDSleepScheduleListDataProvider

- (WDSleepScheduleListDataProvider)initWithDisplayType:(id)a3 profile:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)WDSleepScheduleListDataProvider;
  v4 = [(WDSampleListDataProvider *)&v12 initWithDisplayType:a3 profile:a4];
  if (v4)
  {
    v5 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x263F08790]);
    standaloneFormatter = v4->_standaloneFormatter;
    v4->_standaloneFormatter = v5;

    [(NSDateFormatter *)v4->_standaloneFormatter setFormattingContext:2];
    v7 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x263F08790]);
    listItemFormatter = v4->_listItemFormatter;
    v4->_listItemFormatter = v7;

    [(NSDateFormatter *)v4->_listItemFormatter setFormattingContext:5];
    uint64_t v9 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
    gregorianCalender = v4->_gregorianCalender;
    v4->_gregorianCalender = (NSCalendar *)v9;
  }
  return v4;
}

- (int64_t)cellStyle
{
  return 1;
}

- (unint64_t)numberOfSections
{
  v2 = [(WDSampleListDataProvider *)self samples];
  unint64_t v3 = [v2 count] > 0;

  return v3;
}

- (void)removeObjectAtIndex:(unint64_t)a3 forSection:(unint64_t)a4 sectionRemoved:(BOOL *)a5
{
  v7.receiver = self;
  v7.super_class = (Class)WDSleepScheduleListDataProvider;
  -[WDSampleListDataProvider removeObjectAtIndex:forSection:sectionRemoved:](&v7, sel_removeObjectAtIndex_forSection_sectionRemoved_, a3, a4);
  if (![(WDSleepScheduleListDataProvider *)self numberOfSections]) {
    *a5 = 1;
  }
}

- (id)titleForSection:(unint64_t)a3
{
  unint64_t v3 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
  v4 = [v3 localizedStringForKey:@"SLEEP_SCHEDULE_ALL_DATA_TITLE" value:&stru_26D2EA890 table:@"HealthUI-Localizable-Eucalyptus"];

  return v4;
}

- (id)sampleTypes
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F0A6E8] sleepScheduleType];
  v5[0] = v2;
  unint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)textForObject:(id)a3
{
  return (id)objc_msgSend(a3, "hk_localizedScheduledSleepDuration");
}

- (id)secondaryTextForObject:(id)a3
{
  return (id)objc_msgSend(a3, "hk_localizedWeekdaysListWithGregorianCalendar:standaloneFormatter:listItemFormatter:", self->_gregorianCalender, self->_standaloneFormatter, self->_listItemFormatter);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gregorianCalender, 0);
  objc_storeStrong((id *)&self->_listItemFormatter, 0);

  objc_storeStrong((id *)&self->_standaloneFormatter, 0);
}

@end