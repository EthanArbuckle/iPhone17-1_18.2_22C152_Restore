@interface DateProvider
- (BOOL)uppercase;
- (DateProvider)initWithDate:(id)a3 units:(unint64_t)a4;
- (DateProvider)initWithDate:(id)a3 units:(unint64_t)a4 calendar:(id)a5 locale:(id)a6 timeZone:(id)a7;
- (DateProvider)initWithDateFormat:(id)a3 calendar:(id)a4 locale:(id)a5 timeZone:(id)a6;
- (DateProvider)initWithDateFormatTemplate:(id)a3 calendar:(id)a4 locale:(id)a5 timeZone:(id)a6;
- (NSDate)date;
- (NSDateFormatter)dateFormatter;
- (NSString)dateFormat;
- (NSString)dateFormatTemplate;
- (id)_completeDateTemplateSeries;
- (id)_partialDateTemplateSeriesForUnits:(unint64_t)a3;
- (id)_sessionTextForIndex:(int64_t)a3 context:(id)a4;
- (int64_t)updateType;
- (unint64_t)_minCalendarUnitFromFormat:(id)a3;
- (unint64_t)calendarUnits;
- (unint64_t)updateWallClockAlignment;
- (void)_startSessionWithDate:(id)a3;
- (void)setCalendarUnits:(unint64_t)a3;
- (void)setDate:(id)a3;
- (void)setDateFormat:(id)a3;
- (void)setDateFormatTemplate:(id)a3;
- (void)setDateFormatter:(id)a3;
- (void)setUpdateWallClockAlignment:(unint64_t)a3;
- (void)setUppercase:(BOOL)a3;
@end

@implementation DateProvider

- (DateProvider)initWithDate:(id)a3 units:(unint64_t)a4
{
  v6 = (void *)MEMORY[0x263EFF8F0];
  id v7 = a3;
  v8 = [v6 currentCalendar];
  v9 = [MEMORY[0x263EFF960] currentLocale];
  v10 = [(DateProvider *)self initWithDate:v7 units:a4 calendar:v8 locale:v9 timeZone:0];

  return v10;
}

- (DateProvider)initWithDate:(id)a3 units:(unint64_t)a4 calendar:(id)a5 locale:(id)a6 timeZone:(id)a7
{
  id v13 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DateProvider;
  v14 = [(BaseDateProvider *)&v17 initWithCalendar:a5 locale:a6 timeZone:a7];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_date, a3);
    v15->_calendarUnits = a4;
  }

  return v15;
}

- (DateProvider)initWithDateFormat:(id)a3 calendar:(id)a4 locale:(id)a5 timeZone:(id)a6
{
  id v11 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DateProvider;
  v12 = [(BaseDateProvider *)&v16 initWithCalendar:a4 locale:a5 timeZone:a6];
  if (v12)
  {
    uint64_t v13 = [MEMORY[0x263EFF910] date];
    date = v12->_date;
    v12->_date = (NSDate *)v13;

    objc_storeStrong((id *)&v12->_dateFormat, a3);
    v12->_updateWallClockAlignment = [(DateProvider *)v12 _minCalendarUnitFromFormat:v11];
  }

  return v12;
}

- (DateProvider)initWithDateFormatTemplate:(id)a3 calendar:(id)a4 locale:(id)a5 timeZone:(id)a6
{
  id v11 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DateProvider;
  v12 = [(BaseDateProvider *)&v16 initWithCalendar:a4 locale:a5 timeZone:a6];
  if (v12)
  {
    uint64_t v13 = [MEMORY[0x263EFF910] date];
    date = v12->_date;
    v12->_date = (NSDate *)v13;

    objc_storeStrong((id *)&v12->_dateFormatTemplate, a3);
    v12->_updateWallClockAlignment = [(DateProvider *)v12 _minCalendarUnitFromFormat:v11];
  }

  return v12;
}

- (int64_t)updateType
{
  v3 = [(DateProvider *)self dateFormatTemplate];
  if (v3)
  {

    return 1;
  }
  else
  {
    v5 = [(DateProvider *)self dateFormat];
    int64_t v4 = v5 != 0;
  }
  return v4;
}

- (void)_startSessionWithDate:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_date, a3);
    id v5 = v6;
  }
}

- (id)_sessionTextForIndex:(int64_t)a3 context:(id)a4
{
  id v6 = a4;
  if (self->_date)
  {
    id v7 = [(DateProvider *)self dateFormatter];
    [v7 setDateFormat:0];

    v8 = [(DateProvider *)self dateFormatTemplate];

    if (v8)
    {
      v9 = [(DateProvider *)self dateFormatter];
      v10 = [(DateProvider *)self dateFormatTemplate];
      [v9 setLocalizedDateFormatFromTemplate:v10];

LABEL_6:
      id v12 = [(DateProvider *)self dateFormatter];
      uint64_t v13 = [v12 stringFromDate:self->_date];
LABEL_7:

      goto LABEL_15;
    }
    dateFormat = self->_dateFormat;
    if (dateFormat)
    {
      v9 = [(DateProvider *)self dateFormatter];
      [v9 setDateFormat:dateFormat];
      goto LABEL_6;
    }
    templateSeries = self->_templateSeries;
    if (!templateSeries)
    {
      v15 = [(DateProvider *)self _completeDateTemplateSeries];
      objc_super v16 = self->_templateSeries;
      self->_templateSeries = v15;

      templateSeries = self->_templateSeries;
    }
    if ([(NSArray *)templateSeries count] > a3)
    {
      objc_super v17 = [(NSArray *)self->_templateSeries objectAtIndex:a3];
      v18 = [(BaseDateProvider *)self locale];
      id v19 = v17;
      id v20 = v18;
      if ([v19 isEqualToString:@"d"])
      {
        if (LocaleIsCJK(v20))
        {

LABEL_20:
          v24 = [(DateProvider *)self dateFormatter];
          [v24 setDateFormat:v19];
          goto LABEL_23;
        }
      }
      else if (_isWeekdayDayTemplate(v19))
      {
        v22 = [v20 objectForKey:*MEMORY[0x263EFF508]];
        int v23 = [v22 isEqualToString:@"en"];

        if (v23) {
          goto LABEL_20;
        }
LABEL_22:
        v24 = [(DateProvider *)self dateFormatter];
        [v24 setLocalizedDateFormatFromTemplate:v19];
LABEL_23:

        v25 = [(DateProvider *)self dateFormatter];
        id v26 = [v25 stringFromDate:self->_date];

        v27 = [(BaseDateProvider *)self locale];
        id v12 = v19;
        v28 = [@"MMMMM" stringByAppendingString:@"d"];
        int v29 = [v12 isEqualToString:v28];

        if (v29 && (LocaleIsCJK(v27) & 1) != 0)
        {

          v30 = [(DateProvider *)self dateFormatter];
          uint64_t v13 = [v30 stringFromDate:self->_date];
        }
        else
        {

          v31 = [(BaseDateProvider *)self locale];
          id v32 = v26;
          v33 = v32;
          if (_isWeekdayDayTemplate(v12))
          {
            v33 = v32;
            if (RemovesPunctuationFromWeekdayDay(v31))
            {
              if (!_removePunctuationIfNecessaryFromTextForTemplate_punctuationExceptDash)
              {
                v34 = [MEMORY[0x263F089C0] punctuationCharacterSet];
                [v34 removeCharactersInString:@"-"];
                v35 = (void *)_removePunctuationIfNecessaryFromTextForTemplate_punctuationExceptDash;
                _removePunctuationIfNecessaryFromTextForTemplate_punctuationExceptDash = (uint64_t)v34;
              }
              v36 = objc_msgSend(v32, "componentsSeparatedByCharactersInSet:");
              v33 = [v36 componentsJoinedByString:&stru_26FA95DA0];
            }
          }

          id v26 = v33;
          uint64_t v13 = v26;
        }

        goto LABEL_7;
      }

      goto LABEL_22;
    }
  }
  uint64_t v13 = 0;
LABEL_15:

  return v13;
}

- (NSDateFormatter)dateFormatter
{
  if (!self->_dateFormatter)
  {
    v3 = (NSDateFormatter *)objc_opt_new();
    dateFormatter = self->_dateFormatter;
    self->_dateFormatter = v3;

    [(NSDateFormatter *)self->_dateFormatter setFormattingContext:2];
    id v5 = [(BaseDateProvider *)self calendar];
    [(NSDateFormatter *)self->_dateFormatter setCalendar:v5];

    id v6 = [(BaseDateProvider *)self locale];
    [(NSDateFormatter *)self->_dateFormatter setLocale:v6];

    id v7 = [(BaseDateProvider *)self timeZone];

    if (v7)
    {
      v8 = [(BaseDateProvider *)self timeZone];
      [(NSDateFormatter *)self->_dateFormatter setTimeZone:v8];
    }
  }
  v9 = self->_dateFormatter;

  return v9;
}

- (id)_completeDateTemplateSeries
{
  unint64_t calendarUnits = self->_calendarUnits;
  int64_t v4 = [MEMORY[0x263EFF980] array];
  if ((calendarUnits & 0x21C) != 0) {
    uint64_t v5 = calendarUnits & 0x21C;
  }
  else {
    uint64_t v5 = 16;
  }
  do
  {
    id v6 = [(DateProvider *)self _partialDateTemplateSeriesForUnits:v5];
    [v4 addObjectsFromArray:v6];

    if ((v5 & 8) != 0) {
      uint64_t v7 = -9;
    }
    else {
      uint64_t v7 = -17;
    }
    if ((v5 & 0x200) != 0) {
      uint64_t v7 = -513;
    }
    if ((v5 & 4) != 0) {
      uint64_t v7 = -5;
    }
    v5 &= v7;
  }
  while (v5);

  return v4;
}

- (id)_partialDateTemplateSeriesForUnits:(unint64_t)a3
{
  v23[3] = *MEMORY[0x263EF8340];
  int64_t v4 = objc_opt_new();
  uint64_t v5 = v4;
  if (a3 == 528)
  {
    [v4 addObject:@"EEEE d"];
    [v5 addObject:@"EEE d"];
    id v6 = v5;
    goto LABEL_23;
  }
  if ((~a3 & 0x208) != 0)
  {
    if ((a3 & 8) != 0)
    {
      [v4 addObject:@"MMMM"];
      v8 = @"MMM";
    }
    else if ((a3 & 0x200) != 0)
    {
      [v4 addObject:@"EEEE"];
      v8 = @"EEE";
    }
    else
    {
      v8 = &stru_26FA95DA0;
    }
  }
  else
  {
    v23[0] = @"MMMMEEEE";
    v23[1] = @"MMMMEEE";
    v23[2] = @"MMMEEEE";
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:3];
    [v5 addObjectsFromArray:v7];

    v8 = @"MMMEEE";
  }
  [v5 addObject:v8];
  if ((a3 & 0x10) == 0)
  {
    v9 = &stru_26FA95DA0;
    if ((a3 & 4) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  v9 = [&stru_26FA95DA0 stringByAppendingString:@"d"];
  if ((a3 & 4) != 0)
  {
LABEL_14:
    uint64_t v10 = [(__CFString *)v9 stringByAppendingString:@"y"];

    v9 = (__CFString *)v10;
  }
LABEL_15:
  id v6 = [MEMORY[0x263EFF980] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v5;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_super v16 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "stringByAppendingString:", v9, (void)v18);
        [v6 addObject:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

LABEL_23:

  return v6;
}

- (unint64_t)_minCalendarUnitFromFormat:(id)a3
{
  id v4 = a3;
  if (![v4 length]) {
    goto LABEL_9;
  }
  if ([v4 isEqualToString:@"a"])
  {
    unint64_t SkeletonFromTemplate = 32;
    goto LABEL_10;
  }
  id v6 = [(BaseDateProvider *)self locale];
  unint64_t SkeletonFromTemplate = _CFDateFormatterCreateSkeletonFromTemplate();

  if (!SkeletonFromTemplate) {
    goto LABEL_10;
  }
  uint64_t UnitsFromDateFormat = _CFCalendarGetUnitsFromDateFormat();
  CFRelease((CFTypeRef)SkeletonFromTemplate);
  if (!UnitsFromDateFormat)
  {
LABEL_9:
    unint64_t SkeletonFromTemplate = 0;
    goto LABEL_10;
  }
  uint64_t v8 = 0;
  while (1)
  {
    unint64_t SkeletonFromTemplate = qword_24619B220[v8];
    if ((SkeletonFromTemplate & UnitsFromDateFormat) != 0) {
      break;
    }
    if (++v8 == 14) {
      goto LABEL_9;
    }
  }
LABEL_10:

  return SkeletonFromTemplate;
}

- (unint64_t)updateWallClockAlignment
{
  return self->_updateWallClockAlignment;
}

- (void)setUpdateWallClockAlignment:(unint64_t)a3
{
  self->_updateWallClockAlignment = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (unint64_t)calendarUnits
{
  return self->_calendarUnits;
}

- (void)setCalendarUnits:(unint64_t)a3
{
  self->_unint64_t calendarUnits = a3;
}

- (BOOL)uppercase
{
  return self->_uppercase;
}

- (void)setUppercase:(BOOL)a3
{
  self->_uppercase = a3;
}

- (NSString)dateFormat
{
  return self->_dateFormat;
}

- (void)setDateFormat:(id)a3
{
}

- (NSString)dateFormatTemplate
{
  return self->_dateFormatTemplate;
}

- (void)setDateFormatTemplate:(id)a3
{
}

- (void)setDateFormatter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_dateFormatTemplate, 0);
  objc_storeStrong((id *)&self->_dateFormat, 0);
  objc_storeStrong((id *)&self->_date, 0);

  objc_storeStrong((id *)&self->_templateSeries, 0);
}

@end