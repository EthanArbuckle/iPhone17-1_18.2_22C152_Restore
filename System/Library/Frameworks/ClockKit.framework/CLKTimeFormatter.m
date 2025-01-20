@interface CLKTimeFormatter
- (BOOL)_useNarrowDesignatorTextForGerman;
- (BOOL)forcesLatinNumbers;
- (BOOL)includeSeparatorInTimeSubstringFromSeparatorText;
- (BOOL)reportingLiveTime;
- (BOOL)showSeconds;
- (BOOL)suppressesDesignatorWhitespace;
- (BOOL)timeAndDesignatorTextHasDesignator;
- (BOOL)timeAndDesignatorTextStartsWithDesignator;
- (BOOL)zeroPadTimeSubstringToSeparatorText;
- (CLKTimeFormatter)init;
- (CLKTimeFormatter)initWithForcedNumberSystem:(unint64_t)a3;
- (CLKTimeFormatter)initWithForcedNumberSystem:(unint64_t)a3 clockTimer:(id)a4;
- (CLKTimeFormatter)initWithForcesLatinNumbers:(BOOL)a3;
- (CLKTimeFormatter)initWithForcesLatinNumbers:(BOOL)a3 clockTimer:(id)a4;
- (CLKTimeFormatterDelegate)delegate;
- (NSDate)overrideDate;
- (NSNumber)fontTrackingAttribute;
- (NSString)designatorText;
- (NSString)timeAndDesignatorText;
- (NSString)timeAndDesignatorTextWithoutMinutesIfZero;
- (NSString)timeSubstringFromSeparatorText;
- (NSString)timeSubstringToSeparatorText;
- (NSString)timeText;
- (NSTimeZone)timeZone;
- (_NSRange)blinkerRangeInTimeAndDesignatorText;
- (_NSRange)blinkerRangeInTimeSubstringFromSeparatorText;
- (_NSRange)blinkerRangeInTimeSubstringToSeparatorText;
- (_NSRange)blinkerRangeInTimeText;
- (_NSRange)designatorRangeInTimeAndDesignatorText;
- (_NSRange)designatorRangeInTimeAndDesignatorTextWithoutMinutesIfZero;
- (_NSRange)lastBlinkerRangeInTimeText;
- (_NSRange)rangeInTimeSubstringFromSecondsSeparatorText;
- (_NSRange)separatorNSRangeInTimeText:(id)a3;
- (_NSRange)separatorRangeInTimeAndDesignatorText;
- (_NSRange)separatorRangeInTimeText;
- (double)timeOffset;
- (id)_blinkerRangeInTimeAndDesignatorText;
- (id)_blinkerRangeInTimeSubstringFromSeparatorText;
- (id)_blinkerRangeInTimeSubstringToSeparatorText;
- (id)_blinkerRangeInTimeText;
- (id)_designatorRangeInText:(id)a3;
- (id)_designatorRangeInTimeAndDesignatorText;
- (id)_designatorRangeInTimeAndDesignatorTextWithoutMinutesIfZero;
- (id)_lastBlinkerRangeInTimeText;
- (id)_rangeInTimeSubstringFromSecondsSeparatorText;
- (id)_separatorRangeInTimeAndDesignatorText;
- (id)_separatorRangeInTimeText;
- (id)_timeAndDesignatorFormatter;
- (id)timeTextForNumberSystem:(unint64_t)a3;
- (unint64_t)forcedNumberSystem;
- (void)_handleSignificantTimeChange;
- (void)_invalidateDate:(id)a3;
- (void)_invalidateText;
- (void)_notifyReportingLiveTimeDidChange;
- (void)_notifyTextDidChange;
- (void)_setUseNarrowDesignatorTextForGerman:(BOOL)a3;
- (void)_startOrStopUpdatesIfNecessary;
- (void)_stopMinuteUpdates:(BOOL)a3;
- (void)_stopSecondsUpdates:(BOOL)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFontTrackingAttribute:(id)a3;
- (void)setForcedNumberSystem:(unint64_t)a3;
- (void)setIncludeSeparatorInTimeSubstringFromSeparatorText:(BOOL)a3;
- (void)setOverrideDate:(id)a3;
- (void)setPaused:(BOOL)a3 forReason:(id)a4;
- (void)setShowSeconds:(BOOL)a3;
- (void)setSuppressesDesignatorWhitespace:(BOOL)a3;
- (void)setTimeOffset:(double)a3;
- (void)setTimeZone:(id)a3;
- (void)setZeroPadTimeSubstringToSeparatorText:(BOOL)a3;
@end

@implementation CLKTimeFormatter

- (CLKTimeFormatter)init
{
  return [(CLKTimeFormatter *)self initWithForcesLatinNumbers:0];
}

- (CLKTimeFormatter)initWithForcesLatinNumbers:(BOOL)a3
{
  return [(CLKTimeFormatter *)self initWithForcesLatinNumbers:a3 clockTimer:0];
}

- (CLKTimeFormatter)initWithForcedNumberSystem:(unint64_t)a3
{
  return [(CLKTimeFormatter *)self initWithForcedNumberSystem:a3 clockTimer:0];
}

- (CLKTimeFormatter)initWithForcesLatinNumbers:(BOOL)a3 clockTimer:(id)a4
{
  return [(CLKTimeFormatter *)self initWithForcedNumberSystem:a3 - 1 clockTimer:a4];
}

- (CLKTimeFormatter)initWithForcedNumberSystem:(unint64_t)a3 clockTimer:(id)a4
{
  id v6 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CLKTimeFormatter;
  v7 = [(CLKTimeFormatter *)&v19 init];
  v8 = v7;
  if (v7)
  {
    v7->_forcedNumberSystem = a3;
    uint64_t v9 = [MEMORY[0x263F088B0] hashTableWithOptions:517];
    observers = v8->_observers;
    v8->_observers = (NSHashTable *)v9;

    uint64_t v11 = [MEMORY[0x263EFF9C0] set];
    reasonsToPause = v8->_reasonsToPause;
    v8->_reasonsToPause = (NSMutableSet *)v11;

    [(CLKTimeFormatter *)v8 _invalidateDate:0];
    if ([MEMORY[0x263F08B88] isMainThread])
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __58__CLKTimeFormatter_initWithForcedNumberSystem_clockTimer___block_invoke;
      block[3] = &unk_26440E580;
      v18 = v8;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
    else
    {
      [(CLKTimeFormatter *)v8 _startOrStopUpdatesIfNecessary];
    }
    v13 = [MEMORY[0x263F08A00] defaultCenter];
    [v13 addObserver:v8 selector:sel__invalidateText name:@"_FormatterCacheInvalidatedNotification" object:0];
    [v13 addObserver:v8 selector:sel__handleSignificantTimeChange name:*MEMORY[0x263F83390] object:0];
    v8->_includeSeparatorInTimeSubstringFromSeparatorText = 1;
    if (v6)
    {
      v14 = (CLKClockTimer *)v6;
    }
    else
    {
      v14 = +[CLKClockTimer sharedInstance];
    }
    timer = v8->_timer;
    v8->_timer = v14;
  }
  return v8;
}

uint64_t __58__CLKTimeFormatter_initWithForcedNumberSystem_clockTimer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startOrStopUpdatesIfNecessary];
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  if (self->_secondsUpdateToken) {
    -[CLKClockTimer stopUpdatesForToken:](self->_timer, "stopUpdatesForToken:");
  }
  if (self->_minutesUpdateToken) {
    -[CLKClockTimer stopUpdatesForToken:](self->_timer, "stopUpdatesForToken:");
  }
  v4.receiver = self;
  v4.super_class = (Class)CLKTimeFormatter;
  [(CLKTimeFormatter *)&v4 dealloc];
}

- (void)setPaused:(BOOL)a3 forReason:(id)a4
{
  reasonsToPause = self->_reasonsToPause;
  if (a3) {
    [(NSMutableSet *)reasonsToPause addObject:a4];
  }
  else {
    [(NSMutableSet *)reasonsToPause removeObject:a4];
  }

  [(CLKTimeFormatter *)self _startOrStopUpdatesIfNecessary];
}

- (void)setOverrideDate:(id)a3
{
  id v5 = a3;
  if (([v5 isEqualToDate:self->_overrideDate] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_overrideDate, a3);
    [(CLKTimeFormatter *)self _startOrStopUpdatesIfNecessary];
    [(CLKTimeFormatter *)self _invalidateDate:0];
  }
}

- (BOOL)reportingLiveTime
{
  return !self->_overrideDate && [(NSMutableSet *)self->_reasonsToPause count] == 0;
}

- (void)setTimeZone:(id)a3
{
  id v5 = a3;
  if (([v5 isEqualToTimeZone:self->_timeZone] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_timeZone, a3);
    [(CLKTimeFormatter *)self _invalidateText];
  }
}

- (void)setTimeOffset:(double)a3
{
  if (!CLKFloatEqualsFloat(a3, self->_timeOffset))
  {
    self->_timeOffset = a3;
    [(CLKTimeFormatter *)self _invalidateDate:0];
  }
}

- (void)setSuppressesDesignatorWhitespace:(BOOL)a3
{
  if (self->_suppressesDesignatorWhitespace != a3)
  {
    self->_suppressesDesignatorWhitespace = a3;
    [(CLKTimeFormatter *)self _invalidateText];
  }
}

- (BOOL)_useNarrowDesignatorTextForGerman
{
  return self->_useNarrowDesignatorTextForGerman;
}

- (void)_setUseNarrowDesignatorTextForGerman:(BOOL)a3
{
  if (self->_useNarrowDesignatorTextForGerman != a3)
  {
    self->_useNarrowDesignatorTextForGerman = a3;
    [(CLKTimeFormatter *)self _invalidateText];
  }
}

- (void)setForcedNumberSystem:(unint64_t)a3
{
  if (self->_forcedNumberSystem != a3)
  {
    self->_forcedNumberSystem = a3;
    [(CLKTimeFormatter *)self _invalidateText];
  }
}

- (NSString)timeText
{
  timeText = self->_timeText;
  if (!timeText)
  {
    objc_super v4 = +[_CLKTimeFormatterCache sharedInstance];
    id v5 = [v4 timeOnlyFormatterForTimeZone:self->_timeZone hasSeconds:self->_showSeconds forcedNumberSystem:self->_forcedNumberSystem];
    id v6 = [v5 stringFromDate:self->_date];
    v7 = self->_timeText;
    self->_timeText = v6;

    timeText = self->_timeText;
  }

  return timeText;
}

- (NSString)designatorText
{
  designatorText = self->_designatorText;
  if (!designatorText)
  {
    objc_super v4 = [(CLKTimeFormatter *)self _designatorRangeInTimeAndDesignatorText];
    id v5 = [(CLKTimeFormatter *)self timeAndDesignatorText];
    id v6 = [v4 substringFromString:v5];
    v7 = self->_designatorText;
    self->_designatorText = v6;

    designatorText = self->_designatorText;
  }

  return designatorText;
}

- (NSString)timeAndDesignatorText
{
  timeAndDesignatorText = self->_timeAndDesignatorText;
  if (!timeAndDesignatorText)
  {
    objc_super v4 = [(CLKTimeFormatter *)self _timeAndDesignatorFormatter];
    id v5 = [v4 stringFromDate:self->_date];

    id v6 = [(CLKTimeFormatter *)self _timeAndDesignatorFormatter];
    v7 = [v6 locale];
    v8 = [v7 objectForKey:*MEMORY[0x263EFF508]];

    if ([v8 isEqualToString:@"th"])
    {
      uint64_t v9 = [v5 stringByReplacingOccurrencesOfString:@"ก่อนเที่ยง" withString:@"AM"];

      uint64_t v10 = [v9 stringByReplacingOccurrencesOfString:@"หลังเที่ยง" withString:@"PM"];
      id v5 = v9;
    }
    else
    {
      if (!self->_useNarrowDesignatorTextForGerman || ![v8 isEqualToString:@"de"]) {
        goto LABEL_10;
      }
      if ([v5 rangeOfString:@"vorm."] != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v11 = [v5 stringByReplacingOccurrencesOfString:@"vorm." withString:@"v."];

        id v5 = (void *)v11;
      }
      if ([v5 rangeOfString:@"nachm."] == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_10;
      }
      uint64_t v10 = [v5 stringByReplacingOccurrencesOfString:@"nachm." withString:@"n."];
    }

    id v5 = (void *)v10;
LABEL_10:
    v12 = self->_timeAndDesignatorText;
    self->_timeAndDesignatorText = (NSString *)v5;

    timeAndDesignatorText = self->_timeAndDesignatorText;
  }

  return timeAndDesignatorText;
}

- (NSString)timeAndDesignatorTextWithoutMinutesIfZero
{
  p_timeAndDesignatorTextWithoutMinutesIfZero = (id *)&self->_timeAndDesignatorTextWithoutMinutesIfZero;
  timeAndDesignatorTextWithoutMinutesIfZero = self->_timeAndDesignatorTextWithoutMinutesIfZero;
  if (!timeAndDesignatorTextWithoutMinutesIfZero)
  {
    id v5 = [(CLKTimeFormatter *)self timeAndDesignatorText];
    unint64_t v6 = [(CLKTimeFormatter *)self separatorRangeInTimeAndDesignatorText];
    uint64_t v8 = v7;
    unint64_t v9 = [(CLKTimeFormatter *)self designatorRangeInTimeAndDesignatorText];
    if (v10)
    {
      if (v9 > v6)
      {
        uint64_t v11 = [(CLKTimeFormatter *)self timeSubstringFromSeparatorText];
        uint64_t v12 = [v11 length];

        v13 = objc_msgSend(v5, "substringWithRange:", v6 + v8, v12 - v8);
        LODWORD(v11) = [v13 isEqualToString:@"00"];

        if (v11)
        {
          uint64_t v14 = objc_msgSend(v5, "stringByReplacingCharactersInRange:withString:", v6, v12, &stru_26CCC52F8);
          id v15 = *p_timeAndDesignatorTextWithoutMinutesIfZero;
          id *p_timeAndDesignatorTextWithoutMinutesIfZero = (id)v14;
        }
      }
    }
    if (!*p_timeAndDesignatorTextWithoutMinutesIfZero) {
      objc_storeStrong(p_timeAndDesignatorTextWithoutMinutesIfZero, v5);
    }

    timeAndDesignatorTextWithoutMinutesIfZero = (NSString *)*p_timeAndDesignatorTextWithoutMinutesIfZero;
  }

  return timeAndDesignatorTextWithoutMinutesIfZero;
}

- (NSString)timeSubstringToSeparatorText
{
  if (!self->_timeSubstringToSeparatorText)
  {
    uint64_t v3 = [(CLKTimeFormatter *)self separatorRangeInTimeText];
    objc_super v4 = [(CLKTimeFormatter *)self timeText];
    id v5 = v4;
    if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      timeSubstringToSeparatorText = self->_timeSubstringToSeparatorText;
      self->_timeSubstringToSeparatorText = v4;
    }
    else
    {
      timeSubstringToSeparatorText = [(NSString *)v4 substringToIndex:v3];

      if (self->_zeroPadTimeSubstringToSeparatorText)
      {
        objc_msgSend(NSString, "localizedStringWithFormat:", @"%02d", objc_msgSend(timeSubstringToSeparatorText, "integerValue"));
        uint64_t v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v7 = timeSubstringToSeparatorText;
      }
      uint64_t v8 = self->_timeSubstringToSeparatorText;
      self->_timeSubstringToSeparatorText = v7;
    }
  }
  unint64_t v9 = self->_timeSubstringToSeparatorText;

  return v9;
}

- (void)setZeroPadTimeSubstringToSeparatorText:(BOOL)a3
{
  if (self->_zeroPadTimeSubstringToSeparatorText != a3)
  {
    self->_zeroPadTimeSubstringToSeparatorText = a3;
    self->_timeSubstringToSeparatorText = 0;
    MEMORY[0x270F9A758]();
  }
}

- (NSString)timeSubstringFromSeparatorText
{
  if (!self->_timeSubstringFromSeparatorText)
  {
    uint64_t v3 = [(CLKTimeFormatter *)self separatorRangeInTimeText];
    if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      timeSubstringFromSeparatorText = self->_timeSubstringFromSeparatorText;
      self->_timeSubstringFromSeparatorText = (NSString *)&stru_26CCC52F8;
    }
    else
    {
      uint64_t v6 = v3;
      uint64_t v7 = v4;
      BOOL includeSeparatorInTimeSubstringFromSeparatorText = self->_includeSeparatorInTimeSubstringFromSeparatorText;
      unint64_t v9 = [(CLKTimeFormatter *)self timeText];
      timeSubstringFromSeparatorText = v9;
      if (includeSeparatorInTimeSubstringFromSeparatorText) {
        uint64_t v10 = v6;
      }
      else {
        uint64_t v10 = v6 + v7;
      }
      uint64_t v11 = [(NSString *)v9 substringFromIndex:v10];
      uint64_t v12 = self->_timeSubstringFromSeparatorText;
      self->_timeSubstringFromSeparatorText = v11;
    }
  }
  v13 = self->_timeSubstringFromSeparatorText;

  return v13;
}

- (void)setIncludeSeparatorInTimeSubstringFromSeparatorText:(BOOL)a3
{
  if (self->_includeSeparatorInTimeSubstringFromSeparatorText != a3)
  {
    self->_BOOL includeSeparatorInTimeSubstringFromSeparatorText = a3;
    self->_timeSubstringFromSeparatorText = 0;
    MEMORY[0x270F9A758]();
  }
}

- (_NSRange)designatorRangeInTimeAndDesignatorText
{
  v2 = [(CLKTimeFormatter *)self _designatorRangeInTimeAndDesignatorText];
  uint64_t v3 = [v2 range];
  NSUInteger v5 = v4;

  NSUInteger v6 = v3;
  NSUInteger v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (_NSRange)designatorRangeInTimeAndDesignatorTextWithoutMinutesIfZero
{
  v2 = [(CLKTimeFormatter *)self _designatorRangeInTimeAndDesignatorTextWithoutMinutesIfZero];
  uint64_t v3 = [v2 range];
  NSUInteger v5 = v4;

  NSUInteger v6 = v3;
  NSUInteger v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (BOOL)timeAndDesignatorTextHasDesignator
{
  return [(CLKTimeFormatter *)self designatorRangeInTimeAndDesignatorText] != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)timeAndDesignatorTextStartsWithDesignator
{
  return [(CLKTimeFormatter *)self designatorRangeInTimeAndDesignatorText] == 0;
}

- (_NSRange)separatorRangeInTimeText
{
  v2 = [(CLKTimeFormatter *)self _separatorRangeInTimeText];
  uint64_t v3 = [v2 range];
  NSUInteger v5 = v4;

  NSUInteger v6 = v3;
  NSUInteger v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (_NSRange)separatorRangeInTimeAndDesignatorText
{
  v2 = [(CLKTimeFormatter *)self _separatorRangeInTimeAndDesignatorText];
  uint64_t v3 = [v2 range];
  NSUInteger v5 = v4;

  NSUInteger v6 = v3;
  NSUInteger v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (_NSRange)blinkerRangeInTimeText
{
  v2 = [(CLKTimeFormatter *)self _blinkerRangeInTimeText];
  uint64_t v3 = [v2 range];
  NSUInteger v5 = v4;

  NSUInteger v6 = v3;
  NSUInteger v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (_NSRange)lastBlinkerRangeInTimeText
{
  v2 = [(CLKTimeFormatter *)self _lastBlinkerRangeInTimeText];
  uint64_t v3 = [v2 range];
  NSUInteger v5 = v4;

  NSUInteger v6 = v3;
  NSUInteger v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (_NSRange)blinkerRangeInTimeAndDesignatorText
{
  v2 = [(CLKTimeFormatter *)self _blinkerRangeInTimeAndDesignatorText];
  uint64_t v3 = [v2 range];
  NSUInteger v5 = v4;

  NSUInteger v6 = v3;
  NSUInteger v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (_NSRange)blinkerRangeInTimeSubstringToSeparatorText
{
  v2 = [(CLKTimeFormatter *)self _blinkerRangeInTimeSubstringToSeparatorText];
  uint64_t v3 = [v2 range];
  NSUInteger v5 = v4;

  NSUInteger v6 = v3;
  NSUInteger v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (_NSRange)blinkerRangeInTimeSubstringFromSeparatorText
{
  v2 = [(CLKTimeFormatter *)self _blinkerRangeInTimeSubstringFromSeparatorText];
  uint64_t v3 = [v2 range];
  NSUInteger v5 = v4;

  NSUInteger v6 = v3;
  NSUInteger v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (_NSRange)rangeInTimeSubstringFromSecondsSeparatorText
{
  v2 = [(CLKTimeFormatter *)self _rangeInTimeSubstringFromSecondsSeparatorText];
  uint64_t v3 = [v2 range];
  NSUInteger v5 = v4;

  NSUInteger v6 = v3;
  NSUInteger v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (id)_designatorRangeInText:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(CLKTimeFormatter *)self _timeAndDesignatorFormatter];
  NSUInteger v6 = [v5 AMSymbol];
  NSUInteger v7 = [v5 PMSymbol];
  uint64_t v8 = [v5 locale];
  unint64_t v9 = [v8 objectForKey:*MEMORY[0x263EFF508]];

  if ([v9 isEqualToString:@"th"])
  {
    uint64_t v10 = [v6 stringByReplacingOccurrencesOfString:@"ก่อนเที่ยง" withString:@"AM"];

    uint64_t v11 = [v7 stringByReplacingOccurrencesOfString:@"หลังเที่ยง" withString:@"PM"];
    NSUInteger v6 = (void *)v10;
LABEL_3:

    NSUInteger v7 = (void *)v11;
    goto LABEL_9;
  }
  if (self->_useNarrowDesignatorTextForGerman && [v9 isEqualToString:@"de"])
  {
    if ([v6 rangeOfString:@"vorm."] != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v12 = [v6 stringByReplacingOccurrencesOfString:@"vorm." withString:@"v."];

      NSUInteger v6 = (void *)v12;
    }
    if ([v7 rangeOfString:@"nachm."] != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v11 = [v7 stringByReplacingOccurrencesOfString:@"nachm." withString:@"n."];
      goto LABEL_3;
    }
  }
LABEL_9:
  uint64_t v13 = [v4 rangeOfString:v6];
  if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v13 = [v4 rangeOfString:v7];
  }
  id v15 = +[_CLKTimeFormatterSubstringRange rangeWithRange:](_CLKTimeFormatterSubstringRange, "rangeWithRange:", v13, v14);

  return v15;
}

- (id)_designatorRangeInTimeAndDesignatorText
{
  designatorRangeInTimeAndDesignatorText = self->_designatorRangeInTimeAndDesignatorText;
  if (!designatorRangeInTimeAndDesignatorText)
  {
    id v4 = [(CLKTimeFormatter *)self timeAndDesignatorText];
    NSUInteger v5 = [(CLKTimeFormatter *)self _designatorRangeInText:v4];
    NSUInteger v6 = self->_designatorRangeInTimeAndDesignatorText;
    self->_designatorRangeInTimeAndDesignatorText = v5;

    designatorRangeInTimeAndDesignatorText = self->_designatorRangeInTimeAndDesignatorText;
  }

  return designatorRangeInTimeAndDesignatorText;
}

- (id)_designatorRangeInTimeAndDesignatorTextWithoutMinutesIfZero
{
  designatorRangeInTimeAndDesignatorTextWithoutMinutesIfZero = self->_designatorRangeInTimeAndDesignatorTextWithoutMinutesIfZero;
  if (!designatorRangeInTimeAndDesignatorTextWithoutMinutesIfZero)
  {
    id v4 = [(CLKTimeFormatter *)self timeAndDesignatorTextWithoutMinutesIfZero];
    NSUInteger v5 = [(CLKTimeFormatter *)self _designatorRangeInText:v4];
    NSUInteger v6 = self->_designatorRangeInTimeAndDesignatorTextWithoutMinutesIfZero;
    self->_designatorRangeInTimeAndDesignatorTextWithoutMinutesIfZero = v5;

    designatorRangeInTimeAndDesignatorTextWithoutMinutesIfZero = self->_designatorRangeInTimeAndDesignatorTextWithoutMinutesIfZero;
  }

  return designatorRangeInTimeAndDesignatorTextWithoutMinutesIfZero;
}

- (id)_separatorRangeInTimeText
{
  separatorRangeInTimeText = self->_separatorRangeInTimeText;
  if (!separatorRangeInTimeText)
  {
    id v4 = [(CLKTimeFormatter *)self timeText];
    uint64_t v5 = [(CLKTimeFormatter *)self separatorNSRangeInTimeText:v4];
    uint64_t v7 = v6;

    +[_CLKTimeFormatterSubstringRange rangeWithRange:](_CLKTimeFormatterSubstringRange, "rangeWithRange:", v5, v7);
    uint64_t v8 = (_CLKTimeFormatterSubstringRange *)objc_claimAutoreleasedReturnValue();
    unint64_t v9 = self->_separatorRangeInTimeText;
    self->_separatorRangeInTimeText = v8;

    separatorRangeInTimeText = self->_separatorRangeInTimeText;
  }

  return separatorRangeInTimeText;
}

- (id)_separatorRangeInTimeAndDesignatorText
{
  separatorRangeInTimeAndDesignatorText = self->_separatorRangeInTimeAndDesignatorText;
  if (!separatorRangeInTimeAndDesignatorText)
  {
    id v4 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
    uint64_t v5 = [v4 invertedSet];

    uint64_t v6 = [(CLKTimeFormatter *)self timeAndDesignatorText];
    uint64_t v7 = [v6 rangeOfCharacterFromSet:v5];
    uint64_t v9 = v8;

    +[_CLKTimeFormatterSubstringRange rangeWithRange:](_CLKTimeFormatterSubstringRange, "rangeWithRange:", v7, v9);
    uint64_t v10 = (_CLKTimeFormatterSubstringRange *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = self->_separatorRangeInTimeAndDesignatorText;
    self->_separatorRangeInTimeAndDesignatorText = v10;

    separatorRangeInTimeAndDesignatorText = self->_separatorRangeInTimeAndDesignatorText;
  }

  return separatorRangeInTimeAndDesignatorText;
}

- (id)_blinkerRangeInTimeText
{
  blinkerRangeInTimeText = self->_blinkerRangeInTimeText;
  if (!blinkerRangeInTimeText)
  {
    id v4 = [(CLKTimeFormatter *)self timeText];
    uint64_t v5 = [v4 _clkBlinkerRange];
    uint64_t v7 = v6;

    +[_CLKTimeFormatterSubstringRange rangeWithRange:](_CLKTimeFormatterSubstringRange, "rangeWithRange:", v5, v7);
    uint64_t v8 = (_CLKTimeFormatterSubstringRange *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = self->_blinkerRangeInTimeText;
    self->_blinkerRangeInTimeText = v8;

    blinkerRangeInTimeText = self->_blinkerRangeInTimeText;
  }

  return blinkerRangeInTimeText;
}

- (id)_lastBlinkerRangeInTimeText
{
  lastBlinkerRangeInTimeText = self->_lastBlinkerRangeInTimeText;
  if (!lastBlinkerRangeInTimeText)
  {
    id v4 = [(CLKTimeFormatter *)self timeText];
    uint64_t v5 = [v4 _clkBlinkerRangeByBackwardsSearch];
    uint64_t v7 = v6;

    +[_CLKTimeFormatterSubstringRange rangeWithRange:](_CLKTimeFormatterSubstringRange, "rangeWithRange:", v5, v7);
    uint64_t v8 = (_CLKTimeFormatterSubstringRange *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = self->_lastBlinkerRangeInTimeText;
    self->_lastBlinkerRangeInTimeText = v8;

    lastBlinkerRangeInTimeText = self->_lastBlinkerRangeInTimeText;
  }

  return lastBlinkerRangeInTimeText;
}

- (id)_blinkerRangeInTimeAndDesignatorText
{
  blinkerRangeInTimeAndDesignatorText = self->_blinkerRangeInTimeAndDesignatorText;
  if (!blinkerRangeInTimeAndDesignatorText)
  {
    id v4 = [(CLKTimeFormatter *)self timeAndDesignatorText];
    uint64_t v5 = [v4 _clkBlinkerRange];
    uint64_t v7 = v6;

    +[_CLKTimeFormatterSubstringRange rangeWithRange:](_CLKTimeFormatterSubstringRange, "rangeWithRange:", v5, v7);
    uint64_t v8 = (_CLKTimeFormatterSubstringRange *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = self->_blinkerRangeInTimeAndDesignatorText;
    self->_blinkerRangeInTimeAndDesignatorText = v8;

    blinkerRangeInTimeAndDesignatorText = self->_blinkerRangeInTimeAndDesignatorText;
  }

  return blinkerRangeInTimeAndDesignatorText;
}

- (id)_blinkerRangeInTimeSubstringToSeparatorText
{
  blinkerRangeInTimeSubstringToSeparatorText = self->_blinkerRangeInTimeSubstringToSeparatorText;
  if (!blinkerRangeInTimeSubstringToSeparatorText)
  {
    id v4 = [(CLKTimeFormatter *)self timeSubstringToSeparatorText];
    uint64_t v5 = [v4 _clkBlinkerRange];
    uint64_t v7 = v6;

    +[_CLKTimeFormatterSubstringRange rangeWithRange:](_CLKTimeFormatterSubstringRange, "rangeWithRange:", v5, v7);
    uint64_t v8 = (_CLKTimeFormatterSubstringRange *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = self->_blinkerRangeInTimeSubstringToSeparatorText;
    self->_blinkerRangeInTimeSubstringToSeparatorText = v8;

    blinkerRangeInTimeSubstringToSeparatorText = self->_blinkerRangeInTimeSubstringToSeparatorText;
  }

  return blinkerRangeInTimeSubstringToSeparatorText;
}

- (id)_blinkerRangeInTimeSubstringFromSeparatorText
{
  blinkerRangeInTimeSubstringFromSeparatorText = self->_blinkerRangeInTimeSubstringFromSeparatorText;
  if (!blinkerRangeInTimeSubstringFromSeparatorText)
  {
    id v4 = [(CLKTimeFormatter *)self timeSubstringFromSeparatorText];
    uint64_t v5 = [v4 _clkBlinkerRange];
    uint64_t v7 = v6;

    +[_CLKTimeFormatterSubstringRange rangeWithRange:](_CLKTimeFormatterSubstringRange, "rangeWithRange:", v5, v7);
    uint64_t v8 = (_CLKTimeFormatterSubstringRange *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = self->_blinkerRangeInTimeSubstringFromSeparatorText;
    self->_blinkerRangeInTimeSubstringFromSeparatorText = v8;

    blinkerRangeInTimeSubstringFromSeparatorText = self->_blinkerRangeInTimeSubstringFromSeparatorText;
  }

  return blinkerRangeInTimeSubstringFromSeparatorText;
}

- (id)_rangeInTimeSubstringFromSecondsSeparatorText
{
  rangeInTimeSubstringFromSecondsSeparatorText = self->_rangeInTimeSubstringFromSecondsSeparatorText;
  if (!rangeInTimeSubstringFromSecondsSeparatorText)
  {
    id v4 = [(CLKTimeFormatter *)self timeText];
    uint64_t v5 = [v4 _clkBlinkerRangeByBackwardsSearch];
    uint64_t v7 = v6;

    uint64_t v8 = v5 + v7;
    uint64_t v9 = [(CLKTimeFormatter *)self timeText];
    uint64_t v10 = [v9 length] - v8;

    +[_CLKTimeFormatterSubstringRange rangeWithRange:](_CLKTimeFormatterSubstringRange, "rangeWithRange:", v8, v10);
    uint64_t v11 = (_CLKTimeFormatterSubstringRange *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = self->_rangeInTimeSubstringFromSecondsSeparatorText;
    self->_rangeInTimeSubstringFromSecondsSeparatorText = v11;

    rangeInTimeSubstringFromSecondsSeparatorText = self->_rangeInTimeSubstringFromSecondsSeparatorText;
  }

  return rangeInTimeSubstringFromSecondsSeparatorText;
}

- (id)_timeAndDesignatorFormatter
{
  uint64_t v3 = +[_CLKTimeFormatterCache sharedInstance];
  id v4 = [v3 timeAndDesignatorFormatterForTimeZone:self->_timeZone suppressWhitespace:self->_suppressesDesignatorWhitespace forcedNumberSystem:self->_forcedNumberSystem];

  return v4;
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)_notifyTextDidChange
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = self->_observers;
  uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v8, "timeFormatterTextDidChange:", self, (void)v9);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_notifyReportingLiveTimeDidChange
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = self->_observers;
  uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v8, "timeFormatterReportingLiveTimeDidChange:", self, (void)v9);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_stopMinuteUpdates:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_minutesUpdateToken)
  {
    -[CLKClockTimer stopUpdatesForToken:](self->_timer, "stopUpdatesForToken:");
    minutesUpdateToken = self->_minutesUpdateToken;
    self->_minutesUpdateToken = 0;

    if (v3)
    {
      [(CLKTimeFormatter *)self _notifyReportingLiveTimeDidChange];
    }
  }
}

- (void)_stopSecondsUpdates:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_secondsUpdateToken)
  {
    -[CLKClockTimer stopUpdatesForToken:](self->_timer, "stopUpdatesForToken:");
    secondsUpdateToken = self->_secondsUpdateToken;
    self->_secondsUpdateToken = 0;

    if (v3)
    {
      [(CLKTimeFormatter *)self _notifyReportingLiveTimeDidChange];
    }
  }
}

- (void)_startOrStopUpdatesIfNecessary
{
  if ([(CLKTimeFormatter *)self reportingLiveTime])
  {
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __50__CLKTimeFormatter__startOrStopUpdatesIfNecessary__block_invoke;
    v10[3] = &unk_26440E3C0;
    objc_copyWeak(&v11, &location);
    BOOL v3 = (void *)MEMORY[0x21D4AACC0](v10);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __50__CLKTimeFormatter__startOrStopUpdatesIfNecessary__block_invoke_60;
    v8[3] = &unk_26440E3E8;
    objc_copyWeak(&v9, &location);
    uint64_t v4 = (void *)MEMORY[0x21D4AACC0](v8);
    if (self->_showSeconds)
    {
      [(CLKTimeFormatter *)self _stopMinuteUpdates:0];
      if (!self->_secondsUpdateToken)
      {
        uint64_t v5 = [(CLKClockTimer *)self->_timer startUpdatesWithUpdateFrequency:1 withHandler:v3 identificationLog:v4];
        secondsUpdateToken = self->_secondsUpdateToken;
        self->_secondsUpdateToken = v5;
LABEL_10:

        [(CLKTimeFormatter *)self _notifyReportingLiveTimeDidChange];
      }
    }
    else
    {
      [(CLKTimeFormatter *)self _stopSecondsUpdates:0];
      if (!self->_minutesUpdateToken)
      {
        uint64_t v7 = [(CLKClockTimer *)self->_timer startUpdatesWithUpdateFrequency:0 withHandler:v3 identificationLog:v4];
        secondsUpdateToken = self->_minutesUpdateToken;
        self->_minutesUpdateToken = v7;
        goto LABEL_10;
      }
    }
    [(CLKTimeFormatter *)self _invalidateDate:0];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
    return;
  }
  [(CLKTimeFormatter *)self _stopMinuteUpdates:1];

  [(CLKTimeFormatter *)self _stopSecondsUpdates:1];
}

void __50__CLKTimeFormatter__startOrStopUpdatesIfNecessary__block_invoke(uint64_t a1, void *a2, id *a3)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidateDate:*a3];
}

__CFString *__50__CLKTimeFormatter__startOrStopUpdatesIfNecessary__block_invoke_60(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained(WeakRetained + 31);
    uint64_t v4 = [v3 identifyingInfoForTimeFormatter:v2];
  }
  else
  {
    uint64_t v4 = @"ERROR - nil self";
  }

  return v4;
}

- (void)_invalidateDate:(id)a3
{
  id v4 = a3;
  overrideDate = self->_overrideDate;
  id v8 = v4;
  if (overrideDate)
  {
    id v6 = overrideDate;
  }
  else
  {
    uint64_t v7 = v4;
    if (!v4)
    {
      uint64_t v7 = +[CLKClockTimer now];
    }
    id v6 = [v7 dateByAddingTimeInterval:self->_timeOffset];
    if (!v8) {
  }
    }
  if (![(NSDate *)v6 isEqualToDate:self->_date])
  {
    objc_storeStrong((id *)&self->_date, v6);
    [(CLKTimeFormatter *)self _invalidateText];
  }
}

- (void)_invalidateText
{
  timeText = self->_timeText;
  self->_timeText = 0;

  designatorText = self->_designatorText;
  self->_designatorText = 0;

  timeAndDesignatorText = self->_timeAndDesignatorText;
  self->_timeAndDesignatorText = 0;

  timeAndDesignatorTextWithoutMinutesIfZero = self->_timeAndDesignatorTextWithoutMinutesIfZero;
  self->_timeAndDesignatorTextWithoutMinutesIfZero = 0;

  timeSubstringToSeparatorText = self->_timeSubstringToSeparatorText;
  self->_timeSubstringToSeparatorText = 0;

  timeSubstringFromSeparatorText = self->_timeSubstringFromSeparatorText;
  self->_timeSubstringFromSeparatorText = 0;

  timeRange = self->_timeRange;
  self->_timeRange = 0;

  designatorRangeInTimeAndDesignatorText = self->_designatorRangeInTimeAndDesignatorText;
  self->_designatorRangeInTimeAndDesignatorText = 0;

  designatorRangeInTimeAndDesignatorTextWithoutMinutesIfZero = self->_designatorRangeInTimeAndDesignatorTextWithoutMinutesIfZero;
  self->_designatorRangeInTimeAndDesignatorTextWithoutMinutesIfZero = 0;

  blinkerRangeInTimeText = self->_blinkerRangeInTimeText;
  self->_blinkerRangeInTimeText = 0;

  lastBlinkerRangeInTimeText = self->_lastBlinkerRangeInTimeText;
  self->_lastBlinkerRangeInTimeText = 0;

  blinkerRangeInTimeAndDesignatorText = self->_blinkerRangeInTimeAndDesignatorText;
  self->_blinkerRangeInTimeAndDesignatorText = 0;

  separatorRangeInTimeText = self->_separatorRangeInTimeText;
  self->_separatorRangeInTimeText = 0;

  separatorRangeInTimeAndDesignatorText = self->_separatorRangeInTimeAndDesignatorText;
  self->_separatorRangeInTimeAndDesignatorText = 0;

  rangeInTimeSubstringFromSecondsSeparatorText = self->_rangeInTimeSubstringFromSecondsSeparatorText;
  self->_rangeInTimeSubstringFromSecondsSeparatorText = 0;

  v18 = self->_lastBlinkerRangeInTimeText;
  self->_lastBlinkerRangeInTimeText = 0;

  [(CLKTimeFormatter *)self _notifyTextDidChange];
}

- (void)_handleSignificantTimeChange
{
  if (!self->_timeZone) {
    [(CLKTimeFormatter *)self _invalidateText];
  }
}

- (void)setShowSeconds:(BOOL)a3
{
  if (self->_showSeconds != a3)
  {
    self->_showSeconds = a3;
    [(CLKTimeFormatter *)self _invalidateText];
  }
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (double)timeOffset
{
  return self->_timeOffset;
}

- (BOOL)suppressesDesignatorWhitespace
{
  return self->_suppressesDesignatorWhitespace;
}

- (NSNumber)fontTrackingAttribute
{
  return self->_fontTrackingAttribute;
}

- (void)setFontTrackingAttribute:(id)a3
{
}

- (NSDate)overrideDate
{
  return self->_overrideDate;
}

- (unint64_t)forcedNumberSystem
{
  return self->_forcedNumberSystem;
}

- (BOOL)zeroPadTimeSubstringToSeparatorText
{
  return self->_zeroPadTimeSubstringToSeparatorText;
}

- (BOOL)includeSeparatorInTimeSubstringFromSeparatorText
{
  return self->_includeSeparatorInTimeSubstringFromSeparatorText;
}

- (BOOL)showSeconds
{
  return self->_showSeconds;
}

- (BOOL)forcesLatinNumbers
{
  return self->_forcesLatinNumbers;
}

- (CLKTimeFormatterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CLKTimeFormatterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_overrideDate, 0);
  objc_storeStrong((id *)&self->_fontTrackingAttribute, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_minutesUpdateToken, 0);
  objc_storeStrong((id *)&self->_secondsUpdateToken, 0);
  objc_storeStrong((id *)&self->_reasonsToPause, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_rangeInTimeSubstringFromSecondsSeparatorText, 0);
  objc_storeStrong((id *)&self->_blinkerRangeInTimeSubstringFromSeparatorText, 0);
  objc_storeStrong((id *)&self->_blinkerRangeInTimeSubstringToSeparatorText, 0);
  objc_storeStrong((id *)&self->_blinkerRangeInTimeAndDesignatorText, 0);
  objc_storeStrong((id *)&self->_lastBlinkerRangeInTimeText, 0);
  objc_storeStrong((id *)&self->_blinkerRangeInTimeText, 0);
  objc_storeStrong((id *)&self->_separatorRangeInTimeAndDesignatorText, 0);
  objc_storeStrong((id *)&self->_separatorRangeInTimeText, 0);
  objc_storeStrong((id *)&self->_timeRange, 0);
  objc_storeStrong((id *)&self->_designatorRangeInTimeAndDesignatorTextWithoutMinutesIfZero, 0);
  objc_storeStrong((id *)&self->_designatorRangeInTimeAndDesignatorText, 0);
  objc_storeStrong((id *)&self->_timeSubstringFromSeparatorText, 0);
  objc_storeStrong((id *)&self->_timeSubstringToSeparatorText, 0);
  objc_storeStrong((id *)&self->_timeAndDesignatorTextWithoutMinutesIfZero, 0);
  objc_storeStrong((id *)&self->_timeAndDesignatorText, 0);
  objc_storeStrong((id *)&self->_designatorText, 0);
  objc_storeStrong((id *)&self->_timeText, 0);

  objc_storeStrong((id *)&self->_date, 0);
}

- (id)timeTextForNumberSystem:(unint64_t)a3
{
  if (self->_forcedNumberSystem == a3)
  {
    id v4 = [(CLKTimeFormatter *)self timeText];
  }
  else
  {
    id v6 = +[_CLKTimeFormatterCache sharedInstance];
    uint64_t v7 = [v6 timeOnlyFormatterForTimeZone:self->_timeZone hasSeconds:self->_showSeconds forcedNumberSystem:a3];
    id v4 = [v7 stringFromDate:self->_date];
  }

  return v4;
}

- (_NSRange)separatorNSRangeInTimeText:(id)a3
{
  id v3 = (void *)MEMORY[0x263F08708];
  id v4 = a3;
  uint64_t v5 = [v3 decimalDigitCharacterSet];
  id v6 = [v5 invertedSet];

  uint64_t v7 = [v4 rangeOfCharacterFromSet:v6];
  NSUInteger v9 = v8;

  NSUInteger v10 = v7;
  NSUInteger v11 = v9;
  result.length = v11;
  result.id location = v10;
  return result;
}

@end