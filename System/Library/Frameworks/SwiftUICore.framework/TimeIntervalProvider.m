@interface TimeIntervalProvider
- (NSDate)endDate;
- (NSDate)startDate;
- (TimeIntervalProvider)initWithStartDate:(id)a3 endDate:(id)a4;
- (TimeIntervalProvider)initWithStartDate:(id)a3 endDate:(id)a4 calendar:(id)a5 locale:(id)a6 timeZone:(id)a7;
- (_NSRange)_rangeOfAnnontatedTime:(id)a3 matchingPattern:(id)a4;
- (_NSRange)_rangeOfDesignatorInAnnotatedTime:(id)a3;
- (_NSRange)_rangeOfHoursInAnnotatedTime:(id)a3;
- (id)_dateIntervalNarrowText;
- (id)_dateIntervalTextWithNarrow:(BOOL)a3;
- (id)_dateIntervalWideText;
- (id)_fallbackSequence;
- (id)_sessionTextForIndex:(int64_t)a3 context:(id)a4;
- (id)_startTimeDropMinutesText;
- (id)_startTimeFullText;
- (id)_stringByRemovingDesignatorRange:(_NSRange)a3 fromString:(id)a4;
- (id)_textForSequenceItem:(int64_t)a3;
- (id)_timeIntervalDropMinutesText;
- (id)_timeIntervalFullText;
- (id)_timeIntervalTextWithDropMinutes:(BOOL)a3 onlyStartDate:(BOOL)a4;
- (void)setEndDate:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation TimeIntervalProvider

- (TimeIntervalProvider)initWithStartDate:(id)a3 endDate:(id)a4
{
  v6 = (void *)MEMORY[0x263EFF8F0];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 currentCalendar];
  v10 = [MEMORY[0x263EFF960] currentLocale];
  v11 = [(TimeIntervalProvider *)self initWithStartDate:v8 endDate:v7 calendar:v9 locale:v10 timeZone:0];

  return v11;
}

- (TimeIntervalProvider)initWithStartDate:(id)a3 endDate:(id)a4 calendar:(id)a5 locale:(id)a6 timeZone:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  v18.receiver = self;
  v18.super_class = (Class)TimeIntervalProvider;
  v15 = [(BaseDateProvider *)&v18 initWithCalendar:a5 locale:a6 timeZone:a7];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_startDate, a3);
    objc_storeStrong((id *)&v16->_endDate, a4);
  }

  return v16;
}

- (id)_sessionTextForIndex:(int64_t)a3 context:(id)a4
{
  id v6 = a4;
  if (!self->_startDate || !self->_endDate) {
    goto LABEL_11;
  }
  if (!self->_dateFormatter)
  {
    id v7 = (NSDateFormatter *)objc_opt_new();
    dateFormatter = self->_dateFormatter;
    self->_dateFormatter = v7;

    v9 = [(BaseDateProvider *)self timeZone];

    if (v9)
    {
      v10 = [(BaseDateProvider *)self timeZone];
      [(NSDateFormatter *)self->_dateFormatter setTimeZone:v10];
    }
    v11 = [(BaseDateProvider *)self calendar];
    [(NSDateFormatter *)self->_dateFormatter setCalendar:v11];

    v12 = [(BaseDateProvider *)self locale];
    [(NSDateFormatter *)self->_dateFormatter setLocale:v12];
  }
  fallbackSequence = self->_fallbackSequence;
  if (!fallbackSequence)
  {
    id v14 = [(TimeIntervalProvider *)self _fallbackSequence];
    v15 = self->_fallbackSequence;
    self->_fallbackSequence = v14;

    fallbackSequence = self->_fallbackSequence;
  }
  if ([(NSArray *)fallbackSequence count] > a3)
  {
    v16 = [(NSArray *)self->_fallbackSequence objectAtIndex:a3];
    uint64_t v17 = [v16 integerValue];

    objc_super v18 = [(TimeIntervalProvider *)self _textForSequenceItem:v17];
  }
  else
  {
LABEL_11:
    objc_super v18 = 0;
  }

  return v18;
}

- (_NSRange)_rangeOfDesignatorInAnnotatedTime:(id)a3
{
  NSUInteger v3 = [(TimeIntervalProvider *)self _rangeOfAnnontatedTime:a3 matchingPattern:&__block_literal_global_2];
  result.length = v4;
  result.location = v3;
  return result;
}

uint64_t __58__TimeIntervalProvider__rangeOfDesignatorInAnnotatedTime___block_invoke(uint64_t a1, void *a2)
{
  return [a2 hasPrefix:@"a"];
}

- (_NSRange)_rangeOfHoursInAnnotatedTime:(id)a3
{
  NSUInteger v3 = [(TimeIntervalProvider *)self _rangeOfAnnontatedTime:a3 matchingPattern:&__block_literal_global_11];
  result.length = v4;
  result.location = v3;
  return result;
}

uint64_t __53__TimeIntervalProvider__rangeOfHoursInAnnotatedTime___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (([v2 hasPrefix:@"H"] & 1) != 0
    || ([v2 hasPrefix:@"h"] & 1) != 0
    || ([v2 hasPrefix:@"K"] & 1) != 0)
  {
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v3 = [v2 hasPrefix:@"k"];
  }

  return v3;
}

- (_NSRange)_rangeOfAnnontatedTime:(id)a3 matchingPattern:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3010000000;
  v19 = "";
  long long v20 = xmmword_24619B510;
  uint64_t v7 = [v5 length];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __63__TimeIntervalProvider__rangeOfAnnontatedTime_matchingPattern___block_invoke;
  v13[3] = &unk_2651D44B0;
  id v8 = v6;
  id v14 = v8;
  v15 = &v16;
  objc_msgSend(v5, "enumerateAttributesInRange:options:usingBlock:", 0, v7, 0, v13);
  NSUInteger v9 = v17[4];
  NSUInteger v10 = v17[5];

  _Block_object_dispose(&v16, 8);
  NSUInteger v11 = v9;
  NSUInteger v12 = v10;
  result.length = v12;
  result.location = v11;
  return result;
}

void __63__TimeIntervalProvider__rangeOfAnnontatedTime_matchingPattern___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v10 = [a2 objectForKeyedSubscript:*MEMORY[0x263EFF460]];
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    *(void *)(v9 + 32) = a3;
    *(void *)(v9 + 40) = a4;
    *a5 = 1;
  }
}

- (id)_stringByRemovingDesignatorRange:(_NSRange)a3 fromString:(id)a4
{
  NSUInteger v4 = objc_msgSend(a4, "stringByReplacingCharactersInRange:withString:", a3.location, a3.length, &stru_26FA95DA0);
  id v5 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  id v6 = [v4 stringByTrimmingCharactersInSet:v5];

  return v6;
}

- (id)_fallbackSequence
{
  uint64_t v3 = [(BaseDateProvider *)self calendar];
  NSUInteger v4 = [(BaseDateProvider *)self timeZone];

  if (v4)
  {
    id v5 = [(BaseDateProvider *)self timeZone];
    [v3 setTimeZone:v5];
  }
  id v6 = [v3 components:16 fromDate:self->_startDate toDate:self->_endDate options:0];
  uint64_t v7 = [v6 day];

  if (v7)
  {
    id v8 = &unk_26FAA46C0;
    goto LABEL_9;
  }
  id v8 = [MEMORY[0x263EFF980] arrayWithObject:&unk_26FAA4630];
  uint64_t v9 = [v3 component:64 fromDate:self->_startDate];
  if (v9 | [v3 component:64 fromDate:self->_endDate])
  {
    [v8 addObject:&unk_26FAA4660];
    if (v9) {
      goto LABEL_9;
    }
  }
  else
  {
    [v8 addObject:&unk_26FAA4648];
    [v8 addObject:&unk_26FAA4660];
  }
  [v8 addObject:&unk_26FAA4678];
LABEL_9:

  return v8;
}

- (id)_textForSequenceItem:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      id v5 = [(TimeIntervalProvider *)self _timeIntervalFullText];
      goto LABEL_11;
    case 1:
      id v5 = [(TimeIntervalProvider *)self _timeIntervalDropMinutesText];
      goto LABEL_11;
    case 2:
      id v5 = [(TimeIntervalProvider *)self _startTimeFullText];
      goto LABEL_11;
    case 3:
      id v5 = [(TimeIntervalProvider *)self _startTimeDropMinutesText];
      goto LABEL_11;
    case 4:
      id v5 = [(TimeIntervalProvider *)self _dateIntervalWideText];
      goto LABEL_11;
    case 5:
      id v5 = [(TimeIntervalProvider *)self _dateIntervalNarrowText];
LABEL_11:
      break;
    default:
      id v5 = 0;
      break;
  }
  return v5;
}

- (id)_timeIntervalFullText
{
  return [(TimeIntervalProvider *)self _timeIntervalTextWithDropMinutes:0 onlyStartDate:0];
}

- (id)_timeIntervalDropMinutesText
{
  return [(TimeIntervalProvider *)self _timeIntervalTextWithDropMinutes:1 onlyStartDate:0];
}

- (id)_startTimeFullText
{
  return [(TimeIntervalProvider *)self _timeIntervalTextWithDropMinutes:0 onlyStartDate:1];
}

- (id)_startTimeDropMinutesText
{
  return [(TimeIntervalProvider *)self _timeIntervalTextWithDropMinutes:1 onlyStartDate:1];
}

- (id)_dateIntervalWideText
{
  return [(TimeIntervalProvider *)self _dateIntervalTextWithNarrow:0];
}

- (id)_dateIntervalNarrowText
{
  return [(TimeIntervalProvider *)self _dateIntervalTextWithNarrow:1];
}

- (id)_timeIntervalTextWithDropMinutes:(BOOL)a3 onlyStartDate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (void *)MEMORY[0x263F08790];
  uint64_t v7 = _StandardTimeFormatTemplate;
  if (a3) {
    uint64_t v7 = &_NoMinutesTimeFormatTemplate;
  }
  id v8 = *v7;
  uint64_t v9 = [(BaseDateProvider *)self locale];
  id v10 = [v6 dateFormatFromTemplate:v8 options:0 locale:v9];

  char v50 = 0;
  NSUInteger v11 = [(BaseDateProvider *)self _timeFormatByRemovingWhitespaceAroundDesignatorOfTimeFormat:v10 designatorExists:&v50];

  [(NSDateFormatter *)self->_dateFormatter setDateFormat:v11];
  NSUInteger v12 = [(NSDateFormatter *)self->_dateFormatter _attributedStringWithFieldsFromDate:self->_startDate];
  id v13 = [v12 string];

  if (v13)
  {
    uint64_t v15 = [(TimeIntervalProvider *)self _rangeOfDesignatorInAnnotatedTime:v12];
    uint64_t v16 = v14;
    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v17 = 0;
      if (!v4)
      {
LABEL_6:
        uint64_t v18 = [(NSDateFormatter *)self->_dateFormatter _attributedStringWithFieldsFromDate:self->_endDate];
        id v13 = [v18 string];

        if (!v13)
        {
LABEL_28:

          goto LABEL_29;
        }
        uint64_t v19 = [(TimeIntervalProvider *)self _rangeOfDesignatorInAnnotatedTime:v18];
        uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
        v49 = v11;
        uint64_t v46 = v20;
        uint64_t v47 = v16;
        if (v19 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v22 = v18;
          unint64_t v23 = (unint64_t)v17;
          uint64_t v24 = 0;
        }
        else
        {
          uint64_t v26 = v19;
          v27 = v18;
          unint64_t v23 = (unint64_t)v17;
          v22 = v27;
          v28 = objc_msgSend(v27, "attributedSubstringFromRange:", v26, v20);
          uint64_t v24 = [v28 string];

          uint64_t v21 = v26;
        }
LABEL_12:
        v29 = [(BaseDateProvider *)self locale];
        v30 = LocalizedString(@"INTERVAL_HYPHEN_NARROW", v29);

        uint64_t v17 = (void *)v23;
        if (!(v23 | v24))
        {
          if (v4)
          {
            id v13 = [v12 string];
            uint64_t v18 = v22;
          }
          else
          {
            v33 = NSString;
            v34 = [v12 string];
            uint64_t v18 = v22;
            v35 = [v22 string];
            id v13 = [v33 stringWithFormat:@"%@%@%@", v34, v30, v35];
          }
          NSUInteger v11 = v49;
          goto LABEL_27;
        }
        v48 = (void *)v23;
        v31 = [v12 string];
        v32 = v31;
        if (v4)
        {
          id v13 = v31;
          v32 = v13;
          uint64_t v18 = v22;
          NSUInteger v11 = v49;
LABEL_26:

          uint64_t v17 = v48;
LABEL_27:

          goto LABEL_28;
        }
        uint64_t v18 = v22;
        v36 = [v22 string];
        id v45 = v30;
        if (v24 && [v48 isEqualToString:v24])
        {
          v43 = v36;
          v37 = [(BaseDateProvider *)self locale];
          BOOL v44 = DropLeftRedundantDesignator(v37);

          if (v44)
          {
            NSUInteger v11 = v49;
            v36 = v43;
            if (v15 != 0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v38 = [v12 string];
              uint64_t v39 = v15;
              v40 = (void *)v38;
              -[TimeIntervalProvider _stringByRemovingDesignatorRange:fromString:](self, "_stringByRemovingDesignatorRange:fromString:", v39, v47, v38);
              v32 = v41 = v32;
LABEL_34:
            }
          }
          else
          {
            NSUInteger v11 = v49;
            v36 = v43;
            if (v21 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v40 = [v18 string];
              -[TimeIntervalProvider _stringByRemovingDesignatorRange:fromString:](self, "_stringByRemovingDesignatorRange:fromString:", v21, v46, v40);
              v36 = v41 = v43;
              goto LABEL_34;
            }
          }
        }
        else
        {
          NSUInteger v11 = v49;
        }
        id v13 = (id)[objc_alloc(MEMORY[0x263F089D8]) initWithString:v32];
        [v13 appendString:v45];
        [v13 appendString:v36];

        goto LABEL_26;
      }
    }
    else
    {
      v25 = objc_msgSend(v12, "attributedSubstringFromRange:", v15, v14);
      uint64_t v17 = [v25 string];

      if (!v4) {
        goto LABEL_6;
      }
    }
    uint64_t v46 = 0;
    uint64_t v47 = v16;
    v49 = v11;
    unint64_t v23 = (unint64_t)v17;
    uint64_t v24 = 0;
    v22 = 0;
    uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_12;
  }
LABEL_29:

  return v13;
}

- (id)_dateIntervalTextWithNarrow:(BOOL)a3
{
  if (a3) {
    BOOL v4 = @"M/d";
  }
  else {
    BOOL v4 = @"MMM d";
  }
  [(NSDateFormatter *)self->_dateFormatter setLocalizedDateFormatFromTemplate:v4];
  id v5 = [(NSDateFormatter *)self->_dateFormatter stringFromDate:self->_startDate];
  id v6 = [(NSDateFormatter *)self->_dateFormatter stringFromDate:self->_endDate];
  uint64_t v7 = NSString;
  id v8 = [(BaseDateProvider *)self locale];
  uint64_t v9 = LocalizedString(@"INTERVAL_HYPHEN_WIDE", v8);
  id v10 = [v7 stringWithFormat:@"%@%@%@", v5, v9, v6];

  return v10;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_fallbackSequence, 0);

  objc_storeStrong((id *)&self->_dateFormatter, 0);
}

@end