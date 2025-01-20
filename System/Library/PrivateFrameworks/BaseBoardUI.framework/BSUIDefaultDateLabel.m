@interface BSUIDefaultDateLabel
+ (id)_currentCalendar;
- (BOOL)isAllDay;
- (BOOL)isDateWithinEffectiveAllDayRange:(id)a3;
- (BOOL)isEffectiveAllDay;
- (BOOL)isTimestamp;
- (BSUIDateLabelDelegate)delegate;
- (BSUIDefaultDateLabel)init;
- (NSDate)timeZoneRelativeStartDate;
- (id)_constructNonAllDayLabelStringWithDate:(char)a3 startTime:(int)a4 startIsToday:(int)a5 sameDayDates:(void *)a6 eventOngoing:(int)a7 withCurrentDate:(double)a8 forStartLabel:;
- (id)_localDateForDate:(void *)a3 inTimeZone:;
- (id)constructLabelString;
- (int64_t)labelType;
- (void)_configureTimer;
- (void)_forceUpdate;
- (void)_invalidateTimer;
- (void)_resetEffectiveAllDayState:(uint64_t)a1;
- (void)_resetModelProperties;
- (void)_updateTimerFired:(id)a3;
- (void)dealloc;
- (void)prepareForReuse;
- (void)setAllDay:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEndDate:(id)a3 withTimeZone:(id)a4;
- (void)setIsTimestamp:(BOOL)a3;
- (void)setLabelType:(int64_t)a3;
- (void)setStartDate:(id)a3 withTimeZone:(id)a4;
- (void)setTimeZoneRelativeEndDate:(id)a3;
- (void)setTimeZoneRelativeStartDate:(id)a3 absoluteStartDate:(id)a4;
- (void)startCoalescingUpdates;
- (void)stopCoalescingUpdates;
- (void)update;
- (void)updateTextIfNecessary;
- (void)updateTextIfNecessary:(uint64_t)a1;
@end

@implementation BSUIDefaultDateLabel

+ (id)_currentCalendar
{
  self;
  if (qword_1EB3A3988 != -1) {
    dispatch_once(&qword_1EB3A3988, &__block_literal_global_4);
  }
  v0 = (void *)_MergedGlobals_1;

  return v0;
}

uint64_t __40__BSUIDefaultDateLabel__currentCalendar__block_invoke()
{
  _MergedGlobals_1 = [MEMORY[0x1E4F1C9A8] autoupdatingCurrentCalendar];

  return MEMORY[0x1F41817F8]();
}

- (BSUIDefaultDateLabel)init
{
  v7.receiver = self;
  v7.super_class = (Class)BSUIDefaultDateLabel;
  v2 = [(BSUIDefaultDateLabel *)&v7 init];
  if (v2)
  {
    v3 = (NSDate *)objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    timeZoneRelativeStartDate = v2->_timeZoneRelativeStartDate;
    v2->_timeZoneRelativeStartDate = v3;

    v2->_allDay = 0;
    v2->_effectiveAllDay = 0;
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel__forceUpdate name:*MEMORY[0x1E4F4F608] object:0];
  }
  return v2;
}

- (void)dealloc
{
  -[BSUIDefaultDateLabel _invalidateTimer]((uint64_t)self);
  -[BSUIDefaultDateLabel _resetModelProperties]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)BSUIDefaultDateLabel;
  [(BSUIDefaultDateLabel *)&v3 dealloc];
}

- (void)_invalidateTimer
{
  if (a1)
  {
    [*(id *)(a1 + 840) invalidate];
    v2 = *(void **)(a1 + 840);
    *(void *)(a1 + 840) = 0;
  }
}

- (void)_resetModelProperties
{
  if (a1)
  {
    *(unsigned char *)(a1 + 848) = 0;
    *(unsigned char *)(a1 + 833) = 0;
    *(unsigned char *)(a1 + 834) = 0;
    v2 = *(void **)(a1 + 872);
    *(void *)(a1 + 872) = 0;

    objc_super v3 = *(void **)(a1 + 800);
    *(void *)(a1 + 800) = 0;

    -[BSUIDefaultDateLabel _resetEffectiveAllDayState:](a1);
  }
}

- (void)prepareForReuse
{
  [(BSUIDefaultDateLabel *)self removeFromSuperview];
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v3;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(BSUIDefaultDateLabel *)self setTransform:v4];
  [(BSUIDefaultDateLabel *)self setAlpha:1.0];
  [(BSUIDefaultDateLabel *)self setHidden:0];
  [(BSUIDefaultDateLabel *)self setText:0];
  [(BSUIDefaultDateLabel *)self setDelegate:0];
  -[BSUIDefaultDateLabel _invalidateTimer]((uint64_t)self);
  -[BSUIDefaultDateLabel _resetModelProperties]((uint64_t)self);
}

- (void)setAllDay:(BOOL)a3
{
  if (self->_allDay != a3)
  {
    self->_allDay = a3;
    [(BSUIDefaultDateLabel *)self update];
  }
}

- (void)setIsTimestamp:(BOOL)a3
{
  if (self->_isTimestamp != a3)
  {
    self->_isTimestamp = a3;
    [(BSUIDefaultDateLabel *)self update];
  }
}

- (void)_configureTimer
{
  if (a1)
  {
    uint64_t v2 = objc_opt_class();
    if (v2 == objc_opt_class())
    {
      long long v3 = &OBJC_IVAR___BSUIDefaultDateLabel__timeZoneRelativeStartDate;
      [a1[109] timeIntervalSinceNow];
      if (v4 <= 0.0
        && (long long v3 = &OBJC_IVAR___BSUIDefaultDateLabel__timeZoneRelativeEndDate,
            [a1[100] timeIntervalSinceNow],
            v5 <= 0.0))
      {
        id v6 = 0;
      }
      else
      {
        id v6 = *(id *)((char *)a1 + *v3);
      }
      if (![a1[105] isValid]
        || ([a1[105] fireDate],
            objc_super v7 = objc_claimAutoreleasedReturnValue(),
            int v8 = [v7 isAfterDate:v6],
            v7,
            v8))
      {
        if (v6)
        {
          [a1[105] invalidate];
          id v9 = a1[105];
          a1[105] = 0;

          uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1CB00]) initWithFireDate:v6 interval:a1 target:sel__updateTimerFired_ selector:0 userInfo:0 repeats:0.0];
          id v11 = a1[105];
          a1[105] = (id)v10;

          v15[0] = 0;
          v15[1] = v15;
          v15[2] = 0x3032000000;
          v15[3] = __Block_byref_object_copy__2;
          v15[4] = __Block_byref_object_dispose__2;
          id v16 = a1[105];
          Main = CFRunLoopGetMain();
          v13 = (const void *)*MEMORY[0x1E4F1D418];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __39__BSUIDefaultDateLabel__configureTimer__block_invoke;
          block[3] = &unk_1E5ABD7E8;
          block[4] = v15;
          CFRunLoopPerformBlock(Main, v13, block);
          _Block_object_dispose(v15, 8);
        }
      }
    }
  }
}

void __39__BSUIDefaultDateLabel__configureTimer__block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) isValid])
  {
    uint64_t v2 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [v2 addTimer:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) forMode:*MEMORY[0x1E4F1C4B0]];
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  double v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

- (void)setTimeZoneRelativeStartDate:(id)a3 absoluteStartDate:(id)a4
{
  id v6 = a3;
  if (!-[NSDate isEqualToDate:](self->_timeZoneRelativeStartDate, "isEqualToDate:"))
  {
    objc_storeStrong((id *)&self->_timeZoneRelativeStartDate, a3);
    [(BSUIDefaultDateLabel *)self update];
    -[BSUIDefaultDateLabel _configureTimer]((id *)&self->super.super.super.super.isa);
  }
}

- (void)setTimeZoneRelativeEndDate:(id)a3
{
  id v5 = a3;
  if (!-[NSDate isEqualToDate:](self->_timeZoneRelativeEndDate, "isEqualToDate:"))
  {
    objc_storeStrong((id *)&self->_timeZoneRelativeEndDate, a3);
    [(BSUIDefaultDateLabel *)self update];
    -[BSUIDefaultDateLabel _configureTimer]((id *)&self->super.super.super.super.isa);
  }
}

- (void)setStartDate:(id)a3 withTimeZone:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v6)
  {
    -[BSUIDefaultDateLabel _localDateForDate:inTimeZone:]((uint64_t)self, v9, v6);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = v9;
  }
  int v8 = v7;
  [(BSUIDefaultDateLabel *)self setTimeZoneRelativeStartDate:v7 absoluteStartDate:v9];
}

- (id)_localDateForDate:(void *)a3 inTimeZone:
{
  id v5 = a2;
  id v6 = a3;
  id v7 = 0;
  if (a1 && v5)
  {
    int v8 = +[BSUIDefaultDateLabel _currentCalendar]();
    [v8 setTimeZone:v6];
    id v9 = [v8 components:254 fromDate:v5];
    uint64_t v10 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
    [v8 setTimeZone:v10];

    uint64_t v11 = [v8 dateFromComponents:v9];
    v12 = (void *)v11;
    if (v11) {
      v13 = (void *)v11;
    }
    else {
      v13 = v5;
    }
    id v7 = v13;
  }

  return v7;
}

- (void)setEndDate:(id)a3 withTimeZone:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v6)
  {
    -[BSUIDefaultDateLabel _localDateForDate:inTimeZone:]((uint64_t)self, v9, v6);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = v9;
  }
  int v8 = v7;
  [(BSUIDefaultDateLabel *)self setTimeZoneRelativeEndDate:v7];
}

- (void)_resetEffectiveAllDayState:(uint64_t)a1
{
  *(unsigned char *)(a1 + 832) = 0;
  uint64_t v2 = *(void **)(a1 + 808);
  *(void *)(a1 + 808) = 0;

  uint64_t v3 = *(void **)(a1 + 824);
  *(void *)(a1 + 824) = 0;

  double v4 = *(void **)(a1 + 816);
  *(void *)(a1 + 816) = 0;
}

- (BOOL)isDateWithinEffectiveAllDayRange:(id)a3
{
  id v5 = a3;
  if (!self->_effectiveAllDayStartDate)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"BSUIDefaultDateLabel.m" lineNumber:284 description:@"Effective all-day start date was nil."];
  }
  if (!self->_effectiveAllDayEndDate)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"BSUIDefaultDateLabel.m" lineNumber:285 description:@"Effective all-day end date was nil."];
  }
  [v5 timeIntervalSinceReferenceDate];
  double v7 = v6;
  [(NSDate *)self->_effectiveAllDayStartDate timeIntervalSinceReferenceDate];
  if (v7 >= v8)
  {
    [(NSDate *)self->_effectiveAllDayEndDate timeIntervalSinceReferenceDate];
    BOOL v9 = v7 < v10;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)isEffectiveAllDay
{
  return self->_effectiveAllDay;
}

- (id)_constructNonAllDayLabelStringWithDate:(char)a3 startTime:(int)a4 startIsToday:(int)a5 sameDayDates:(void *)a6 eventOngoing:(int)a7 withCurrentDate:(double)a8 forStartLabel:
{
  id v15 = a2;
  id v16 = a6;
  if (a1)
  {
    v17 = [MEMORY[0x1E4F4F708] sharedInstance];
    v18 = [MEMORY[0x1E4F4F710] sharedInstance];
    v19 = v18;
    if ((a3 & 1) != 0 || a5)
    {
      if (a7)
      {
        if (a5)
        {
          v20 = +[NSBundle bs_baseBoardUIBundle]();
          v21 = [v20 localizedStringForKey:@"NOW" value:&stru_1EF5BC2D8 table:&stru_1EF5BC2D8];

LABEL_36:
          goto LABEL_37;
        }
      }
      else
      {
        [v15 timeIntervalSinceReferenceDate];
        if (!a4)
        {
          double v24 = v22;
          if (!objc_msgSend(v19, "isTomorrow:"))
          {
            if ([v19 isWithinNextWeek:v24]) {
              [v17 formatDateAsAbbreviatedDayOfWeekWithTime:v15];
            }
            else {
            uint64_t v23 = [v17 formatDateAsShortDayMonthWithTimeStyle:v15];
            }
            goto LABEL_29;
          }
          goto LABEL_17;
        }
      }
      uint64_t v23 = [v17 formatDateAsTimeStyle:v15];
    }
    else
    {
      if ([v18 isTomorrow:a8])
      {
        if (a7)
        {
LABEL_17:
          uint64_t v23 = [v17 formatDateAsRelativeDateAndTimeStyle:v15];
          goto LABEL_29;
        }
LABEL_35:
        v21 = 0;
        goto LABEL_36;
      }
      if ([v19 isWithinNextWeek:a8])
      {
        if ((a7 & 1) == 0) {
          goto LABEL_35;
        }
      }
      else
      {
        [v16 timeIntervalSinceReferenceDate];
        if (v25 < a8)
        {
          if (a7)
          {
            uint64_t v23 = [v17 formatDateAsShortDayMonthWithTimeStyle:v15];
            goto LABEL_29;
          }
          goto LABEL_35;
        }
        if ([v19 isYesterday:a8])
        {
          if (a7)
          {
            if (*(unsigned char *)(a1 + 849))
            {
              uint64_t v23 = [v17 formatDateAsRelativeDateStyle:v15];
              goto LABEL_29;
            }
            goto LABEL_17;
          }
          goto LABEL_35;
        }
        if (![v19 isWithinPrevWeek:1 includeToday:a8])
        {
          if (a7)
          {
            uint64_t v23 = [v17 formatDateAsDayMonthYearStyle:v15];
            goto LABEL_29;
          }
          goto LABEL_35;
        }
        if (!a7) {
          goto LABEL_35;
        }
      }
      uint64_t v23 = [v17 formatDateAsAbbreviatedDayOfWeekWithTime:v15];
    }
LABEL_29:
    v21 = (void *)v23;
    goto LABEL_36;
  }
  v21 = 0;
LABEL_37:

  return v21;
}

- (id)constructLabelString
{
  int64_t labelType = self->_labelType;
  if (labelType == 2)
  {
    if (!self->_timeZoneRelativeStartDate)
    {
LABEL_18:
      v17 = &stru_1EF5BC2D8;
      goto LABEL_77;
    }
    goto LABEL_6;
  }
  if (labelType == 1)
  {
LABEL_6:
    uint64_t v4 = 800;
    goto LABEL_7;
  }
  if (labelType) {
    goto LABEL_8;
  }
  uint64_t v4 = 872;
LABEL_7:
  if (!*(Class *)((char *)&self->super.super.super.super.isa + v4)) {
    goto LABEL_18;
  }
LABEL_8:
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  double v6 = +[BSUIDefaultDateLabel _currentCalendar]();
  double v7 = [MEMORY[0x1E4F4F710] sharedInstance];
  v43 = [MEMORY[0x1E4F4F708] sharedInstance];
  int64_t v8 = self->_labelType;
  if (!self->_effectiveAllDay)
  {
    p_timeZoneRelativeStartDate = (void **)&self->_timeZoneRelativeStartDate;
    [(NSDate *)self->_timeZoneRelativeStartDate timeIntervalSinceReferenceDate];
    double v20 = v19;
    char v21 = objc_msgSend(v7, "isToday:");
    if (self->_timeZoneRelativeStartDate && self->_timeZoneRelativeEndDate)
    {
      int v22 = objc_msgSend(v6, "date:isSameDayAsDate:");
      if ([v5 isAfterDate:*p_timeZoneRelativeStartDate])
      {
        int v23 = [v5 isBeforeDate:self->_timeZoneRelativeEndDate];
LABEL_25:
        if (v8 == 2)
        {
          double v24 = -[BSUIDefaultDateLabel _constructNonAllDayLabelStringWithDate:startTime:startIsToday:sameDayDates:eventOngoing:withCurrentDate:forStartLabel:]((uint64_t)self, *p_timeZoneRelativeStartDate, v21, v22, v23, v5, 1, v20);
          -[BSUIDefaultDateLabel _constructNonAllDayLabelStringWithDate:startTime:startIsToday:sameDayDates:eventOngoing:withCurrentDate:forStartLabel:]((uint64_t)self, self->_timeZoneRelativeEndDate, v21, v22, v23, v5, 0, v20);
          id v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
          double v25 = NSString;
          +[NSBundle bs_baseBoardUIBundle]();
          v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v26 = [(__CFString *)v17 localizedStringForKey:@"DATE_RANGE_FORMAT_NEW" value:&stru_1EF5BC2D8 table:&stru_1EF5BC2D8];
          uint64_t v27 = objc_msgSend(v25, "stringWithFormat:", v26, v24, v15);

          id v13 = 0;
        }
        else
        {
          if (v8) {
            p_timeZoneRelativeStartDate = (void **)&self->_timeZoneRelativeEndDate;
          }
          id v13 = *p_timeZoneRelativeStartDate;
          if (v13)
          {
            -[BSUIDefaultDateLabel _constructNonAllDayLabelStringWithDate:startTime:startIsToday:sameDayDates:eventOngoing:withCurrentDate:forStartLabel:]((uint64_t)self, v13, v21, v22, v23, v5, v8 == 0, v20);
            v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v17 = &stru_1EF5BC2D8;
          }
          if (v8 != 1) {
            goto LABEL_75;
          }
          v34 = NSString;
          +[NSBundle bs_baseBoardUIBundle]();
          id v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
          double v24 = [(__CFString *)v15 localizedStringForKey:@"TO_TIME_FORMAT" value:&stru_1EF5BC2D8 table:&stru_1EF5BC2D8];
          uint64_t v27 = objc_msgSend(v34, "stringWithFormat:", v24, v17);
        }

        v17 = (__CFString *)v27;
LABEL_74:

LABEL_75:
        goto LABEL_76;
      }
    }
    else
    {
      int v22 = 0;
    }
    int v23 = 0;
    goto LABEL_25;
  }
  [(NSDate *)self->_effectiveAllDayStartDate timeIntervalSinceReferenceDate];
  double v10 = v9;
  [(NSDate *)self->_effectiveAllDayLastValidDate timeIntervalSinceReferenceDate];
  double v12 = v11;
  if ((unint64_t)(v8 - 1) > 1
    || ([v7 isToday:v11] & 1) != 0
    || ([v6 date:self->_effectiveAllDayStartDate isSameDayAsDate:self->_effectiveAllDayLastValidDate] & 1) != 0)
  {
    id v13 = 0;
  }
  else if ([v7 isTomorrow:v12])
  {
    v33 = +[NSBundle bs_baseBoardUIBundle]();
    id v13 = [v33 localizedStringForKey:@"TOMORROW" value:&stru_1EF5BC2D8 table:&stru_1EF5BC2D8];
  }
  else
  {
    int v38 = [v7 isWithinNextWeek:v12];
    effectiveAllDayLastValidDate = self->_effectiveAllDayLastValidDate;
    if (v38) {
      [v43 formatDateAsDayOfWeek:effectiveAllDayLastValidDate];
    }
    else {
    id v13 = [v43 formatDateAsAbbreviatedDayMonthStyle:effectiveAllDayLastValidDate];
    }
  }
  if ((v8 | 2) == 2)
  {
    if ([(BSUIDefaultDateLabel *)self isDateWithinEffectiveAllDayRange:v5])
    {
      v14 = +[NSBundle bs_baseBoardUIBundle]();
      id v15 = [v14 localizedStringForKey:@"TODAY" value:&stru_1EF5BC2D8 table:&stru_1EF5BC2D8];

      if (v13)
      {
        id v16 = NSString;
        +[NSBundle bs_baseBoardUIBundle]();
        if (v8 != 2) {
          v29 = {;
        }
          v35 = [v29 localizedStringForKey:@"TODAY_TO_DATE_FORMAT" value:&stru_1EF5BC2D8 table:&stru_1EF5BC2D8];
          objc_msgSend(v16, "stringWithFormat:", v35, v13);
          uint64_t v37 = LABEL_53:;
LABEL_72:
          v17 = (__CFString *)v37;

          goto LABEL_73;
        }
        v29 = LABEL_52:;
        v35 = [v29 localizedStringForKey:@"DATE_RANGE_FORMAT_NEW" value:&stru_1EF5BC2D8 table:&stru_1EF5BC2D8];
        objc_msgSend(v16, "stringWithFormat:", v35, v15, v13);
        goto LABEL_53;
      }
      goto LABEL_68;
    }
    if ([v7 isTomorrow:v10])
    {
      v30 = +[NSBundle bs_baseBoardUIBundle]();
      id v15 = [v30 localizedStringForKey:@"TOMORROW" value:&stru_1EF5BC2D8 table:&stru_1EF5BC2D8];

      if (v13)
      {
        id v16 = NSString;
        +[NSBundle bs_baseBoardUIBundle]();
        if (v8 != 2) {
          v29 = {;
        }
          v35 = [v29 localizedStringForKey:@"TOMORROW_TO_DATE_FORMAT" value:&stru_1EF5BC2D8 table:&stru_1EF5BC2D8];
          objc_msgSend(v16, "stringWithFormat:", v35, v13);
          goto LABEL_53;
        }
        goto LABEL_52;
      }
      goto LABEL_68;
    }
    [v5 timeIntervalSinceReferenceDate];
    if (v10 <= v31)
    {
      if ([v7 isYesterday:v12])
      {
        v36 = +[NSBundle bs_baseBoardUIBundle]();
        id v15 = [v36 localizedStringForKey:@"YESTERDAY" value:&stru_1EF5BC2D8 table:&stru_1EF5BC2D8];

        if (v13)
        {
          id v16 = NSString;
          +[NSBundle bs_baseBoardUIBundle]();
          if (v8 != 2) {
            v29 = {;
          }
            v35 = [v29 localizedStringForKey:@"YESTERDAY_TO_DATE_FORMAT" value:&stru_1EF5BC2D8 table:&stru_1EF5BC2D8];
            objc_msgSend(v16, "stringWithFormat:", v35, v13);
            goto LABEL_53;
          }
          goto LABEL_52;
        }
        goto LABEL_68;
      }
      int v40 = [v7 isWithinPrevWeek:1 includeToday:v12];
      v41 = self->_effectiveAllDayLastValidDate;
      if (v40)
      {
        id v15 = [v43 formatDateAsDayOfWeek:v41];
        if (v13)
        {
          v32 = NSString;
          +[NSBundle bs_baseBoardUIBundle]();
          if (v8 != 2) {
            v29 = {;
          }
            [v29 localizedStringForKey:@"DAYOFWEEK_TO_DATE_FORMAT" value:&stru_1EF5BC2D8 table:&stru_1EF5BC2D8];
            goto LABEL_67;
          }
          goto LABEL_66;
        }
      }
      else
      {
        id v15 = [v43 formatDateAsDayMonthYearStyle:v41];
        if (v13)
        {
          v32 = NSString;
          +[NSBundle bs_baseBoardUIBundle]();
          if (v8 != 2) {
            v29 = {;
          }
            [v29 localizedStringForKey:@"DAYMONTHYEAR_TO_DATE_FORMAT" value:&stru_1EF5BC2D8 table:&stru_1EF5BC2D8];
            goto LABEL_67;
          }
          goto LABEL_66;
        }
      }
    }
    else
    {
      id v15 = [v43 formatDateAsAbbreviatedDayMonthStyle:self->_effectiveAllDayStartDate];
      if (v13)
      {
        v32 = NSString;
        +[NSBundle bs_baseBoardUIBundle]();
        if (v8 != 2) {
          v29 = {;
        }
          [v29 localizedStringForKey:@"DAYMONTH_TO_DATE_FORMAT" value:&stru_1EF5BC2D8 table:&stru_1EF5BC2D8];
          v35 = LABEL_67:;
          uint64_t v37 = objc_msgSend(v32, "stringWithFormat:", v35, v15, v13);
          goto LABEL_72;
        }
        v29 = LABEL_66:;
        [v29 localizedStringForKey:@"DATE_RANGE_FORMAT_NEW" value:&stru_1EF5BC2D8 table:&stru_1EF5BC2D8];
        goto LABEL_67;
      }
    }
LABEL_68:
    id v15 = v15;
    v17 = v15;
    goto LABEL_74;
  }
  if (v13)
  {
    v28 = NSString;
    +[NSBundle bs_baseBoardUIBundle]();
    id v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v29 = [(__CFString *)v15 localizedStringForKey:@"TO_DATE_FORMAT" value:&stru_1EF5BC2D8 table:&stru_1EF5BC2D8];
    objc_msgSend(v28, "stringWithFormat:", v29, v13);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_73:

    goto LABEL_74;
  }
  v17 = &stru_1EF5BC2D8;
LABEL_76:

LABEL_77:

  return v17;
}

- (void)updateTextIfNecessary:(uint64_t)a1
{
  if (a1)
  {
    if ((a2 & 1) != 0 || !*(unsigned char *)(a1 + 833))
    {
      id v7 = [(id)a1 constructLabelString];
      uint64_t v3 = [(id)a1 text];
      char v4 = [v7 isEqual:v3];

      if ((v4 & 1) == 0)
      {
        [(id)a1 setText:v7];
        [(id)a1 setNeedsDisplay];
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 856));
        double v6 = WeakRetained;
        if (WeakRetained) {
          [WeakRetained dateLabelDidChange:a1];
        }
      }
    }
    else
    {
      *(unsigned char *)(a1 + 834) = 1;
    }
  }
}

- (void)_updateTimerFired:(id)a3
{
  [(BSUIDefaultDateLabel *)self update];
  -[BSUIDefaultDateLabel _invalidateTimer]((uint64_t)self);

  -[BSUIDefaultDateLabel _configureTimer]((id *)&self->super.super.super.super.isa);
}

- (void)updateTextIfNecessary
{
}

- (void)_forceUpdate
{
  if (self)
  {
    -[BSUIDefaultDateLabel _resetEffectiveAllDayState:]((uint64_t)self);
    if (self->_allDay)
    {
      timeZoneRelativeStartDate = self->_timeZoneRelativeStartDate;
      if (timeZoneRelativeStartDate)
      {
        [(NSDate *)timeZoneRelativeStartDate timeIntervalSinceReferenceDate];
        double v5 = v4;
        double v6 = BSDateAtStartOfDay();
        if (v6)
        {
          if (!self->_timeZoneRelativeStartDate) {
            goto LABEL_10;
          }
          [(NSDate *)self->_timeZoneRelativeEndDate timeIntervalSinceReferenceDate];
          if (v7 >= v5)
          {
            BSDateAtStartOfDay();
            int64_t v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
            if (!v8) {
              goto LABEL_13;
            }
            if (([v6 isEqualToDate:v8] & 1) == 0)
            {
              effectiveAllDayEndDate = [(NSDate *)v8 bs_dateByAddingDays:-1];
              if (effectiveAllDayEndDate)
              {
                self->_effectiveAllDay = 1;
                objc_storeStrong((id *)&self->_effectiveAllDayStartDate, v6);
                objc_storeStrong((id *)&self->_effectiveAllDayLastValidDate, effectiveAllDayEndDate);
                objc_storeStrong((id *)&self->_effectiveAllDayEndDate, v8);
              }
              goto LABEL_12;
            }

LABEL_10:
            objc_msgSend(v6, "bs_dateByAddingDays:", 1);
            int64_t v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
            if (v8)
            {
              self->_effectiveAllDay = 1;
              objc_storeStrong((id *)&self->_effectiveAllDayStartDate, v6);
              objc_storeStrong((id *)&self->_effectiveAllDayLastValidDate, v6);
              int64_t v8 = v8;
              effectiveAllDayEndDate = self->_effectiveAllDayEndDate;
              self->_effectiveAllDayEndDate = v8;
LABEL_12:
            }
LABEL_13:
          }
        }
      }
    }
  }

  -[BSUIDefaultDateLabel updateTextIfNecessary:]((uint64_t)self, 1);
}

- (void)update
{
  if (self->_isCoalescingUpdates) {
    self->_needsUpdateFromCoalesce = 1;
  }
  else {
    [(BSUIDefaultDateLabel *)self _forceUpdate];
  }
}

- (void)startCoalescingUpdates
{
  self->_isCoalescingUpdates = 1;
}

- (void)stopCoalescingUpdates
{
  if (self->_isCoalescingUpdates)
  {
    self->_isCoalescingUpdates = 0;
    if (self->_needsUpdateFromCoalesce)
    {
      [(BSUIDefaultDateLabel *)self _forceUpdate];
      self->_needsUpdateFromCoalesce = 0;
    }
  }
}

- (BOOL)isAllDay
{
  return self->_allDay;
}

- (BSUIDateLabelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BSUIDateLabelDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)labelType
{
  return self->_labelType;
}

- (void)setLabelType:(int64_t)a3
{
  self->_int64_t labelType = a3;
}

- (BOOL)isTimestamp
{
  return self->_isTimestamp;
}

- (NSDate)timeZoneRelativeStartDate
{
  return self->_timeZoneRelativeStartDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZoneRelativeStartDate, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_updateTimer, 0);
  objc_storeStrong((id *)&self->_effectiveAllDayEndDate, 0);
  objc_storeStrong((id *)&self->_effectiveAllDayLastValidDate, 0);
  objc_storeStrong((id *)&self->_effectiveAllDayStartDate, 0);

  objc_storeStrong((id *)&self->_timeZoneRelativeEndDate, 0);
}

@end