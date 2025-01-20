@interface _MKLocalizedHoursBuilder
+ (id)hoursDelimeter;
+ (id)localizedHoursDayRangeString:(id)a3;
+ (id)localizedHoursStringNormalHours;
+ (id)localizedHoursStringSpecialHours;
+ (id)testGetDayOfWeekFormatterFull;
+ (id)testGetDayOfWeekFormatterShort;
+ (id)testGetHoursFormatter;
+ (id)testGetMonthAndDayFormatter;
- (BOOL)_isCurrentTimeSingular:(id)a3;
- (BOOL)_isOpenAtClosingSoon;
- (GEOBusinessHours)operatingHours;
- (NSArray)AMPMSymbols;
- (NSDate)compareDate;
- (NSString)localizedOpenState;
- (NSString)localizedOperatingHours;
- (NSTimeZone)timeZone;
- (UIColor)hoursStateLabelColor;
- (_MKLocalizedHoursBuilder)initWithBusinessHours:(id)a3 timeZone:(id)a4 localizedHoursStringOptions:(unint64_t)a5;
- (_MKLocalizedHoursBuilder)initWithBusinessHours:(id)a3 timeZone:(id)a4 localizedHoursStringOptions:(unint64_t)a5 conciseStyle:(BOOL)a6 openAt:(id)a7;
- (_MKLocalizedHoursBuilder)initWithMapItem:(id)a3 localizedHoursStringOptions:(unint64_t)a4;
- (_MKLocalizedHoursBuilder)initWithMapItem:(id)a3 localizedHoursStringOptions:(unint64_t)a4 conciseStyle:(BOOL)a5 openAt:(id)a6;
- (_MKLocalizedHoursBuilder)initWithMapItemForMessageForBusiness:(id)a3 localizedHoursStringOptions:(unint64_t)a4;
- (id)_findNextOperatingWeekday:(int64_t)a3;
- (id)_formatedOperatingHourString:(id)a3 timeZone:(id)a4 weekday:(int64_t)a5;
- (id)_formattedStringForHourRangesWithStartAndEndDates:(id)a3 timeZone:(id)a4;
- (id)_localizedTimeStringFromDate:(id)a3 timezone:(id)a4;
- (id)_updateLocalizedOperatingHoursString:(unint64_t)a3;
- (id)concatenateStrings:(id)a3 joinedByString:(id)a4;
- (id)formatData:(id)a3;
- (id)showClosingSoonHour:(id)a3 timeZone:(id)a4;
- (int64_t)state;
- (unint64_t)geoMapItemOpeningHourOptions;
- (unint64_t)localizedHoursStringOptions;
- (void)_commonInit;
- (void)_resetLocalizedBuilder:(BOOL)a3;
- (void)_resetLocalizedStrings:(BOOL)a3;
- (void)_updateLocalizedString;
- (void)calculateWidthsForData:(id)a3;
- (void)setCompareDate:(id)a3;
- (void)setGeoMapItemOpeningHourOptions:(unint64_t)a3;
- (void)setLocalizedHoursStringOptions:(unint64_t)a3;
- (void)setOperatingHours:(id)a3;
- (void)setTimeZone:(id)a3;
- (void)updateHoursLabelColor;
- (void)updateHoursLabelColorWithDefaultLabelColor:(id)a3;
@end

@implementation _MKLocalizedHoursBuilder

+ (id)testGetMonthAndDayFormatter
{
  return (id)_MergedGlobals_162;
}

+ (id)testGetDayOfWeekFormatterFull
{
  return (id)qword_1EB316078;
}

+ (id)testGetDayOfWeekFormatterShort
{
  return (id)qword_1EB316080;
}

+ (id)testGetHoursFormatter
{
  return (id)qword_1EB316088;
}

+ (id)localizedHoursStringNormalHours
{
  return _MKLocalizedStringFromThisBundle(@"Normal Hours");
}

+ (id)localizedHoursStringSpecialHours
{
  return _MKLocalizedStringFromThisBundle(@"Special Hours");
}

+ (id)hoursDelimeter
{
  return _MKLocalizedStringFromThisBundle(@", ");
}

+ (id)localizedHoursDayRangeString:(id)a3
{
  id v3 = a3;
  v4 = [v3 startDate];

  if (v4)
  {
    v5 = [v3 endDate];

    v6 = NSString;
    if (v5)
    {
      v7 = _MKLocalizedStringFromThisBundle(@"Placecard Full Hours Weekday Range");
      v8 = (void *)_MergedGlobals_162;
      v9 = [v3 startDate];
      v10 = [v8 stringFromDate:v9];
      v11 = (void *)_MergedGlobals_162;
      v12 = [v3 endDate];
      v13 = [v11 stringFromDate:v12];
      v14 = objc_msgSend(v6, "stringWithFormat:", v7, v10, v13);
    }
    else
    {
      v7 = _MKLocalizedStringFromThisBundle(@"Placecard Full Hours Starting Day");
      v15 = (void *)_MergedGlobals_162;
      v9 = [v3 startDate];
      v10 = [v15 stringFromDate:v9];
      v14 = objc_msgSend(v6, "stringWithFormat:", v7, v10);
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (_MKLocalizedHoursBuilder)initWithBusinessHours:(id)a3 timeZone:(id)a4 localizedHoursStringOptions:(unint64_t)a5
{
  return [(_MKLocalizedHoursBuilder *)self initWithBusinessHours:a3 timeZone:a4 localizedHoursStringOptions:a5 conciseStyle:0 openAt:0];
}

- (_MKLocalizedHoursBuilder)initWithBusinessHours:(id)a3 timeZone:(id)a4 localizedHoursStringOptions:(unint64_t)a5 conciseStyle:(BOOL)a6 openAt:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  v23.receiver = self;
  v23.super_class = (Class)_MKLocalizedHoursBuilder;
  v16 = [(_MKLocalizedHoursBuilder *)&v23 init];
  v17 = v16;
  if (v16)
  {
    [(_MKLocalizedHoursBuilder *)v16 _commonInit];
    v17->_isUsingConciseStyle = a6;
    objc_storeStrong((id *)&v17->_openAt, a7);
    v18 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v19 = [MEMORY[0x1E4F646C8] _geoMapItemOpeningHoursOptionsForBusinessHours:v13 compareDate:v18 timeZone:v14];
    if (!v14 || (unint64_t v20 = v19, (v19 & 1) != 0))
    {
      [(_MKLocalizedHoursBuilder *)v17 _resetLocalizedBuilder:v14 == 0];
    }
    else
    {
      objc_storeStrong((id *)&v17->_operatingHours, a3);
      v17->_geoMapItemOpeningHourOptions = v20;
      v17->_localizedHoursStringOptions = a5;
      compareDate = v17->_compareDate;
      v17->_compareDate = v18;

      [(_MKLocalizedHoursBuilder *)v17 setTimeZone:v14];
    }
  }

  return v17;
}

- (_MKLocalizedHoursBuilder)initWithMapItem:(id)a3 localizedHoursStringOptions:(unint64_t)a4
{
  id v6 = a3;
  v7 = [v6 _businessHours];
  v8 = [v7 objectAtIndex:0];
  v9 = [v6 timeZone];

  v10 = [(_MKLocalizedHoursBuilder *)self initWithBusinessHours:v8 timeZone:v9 localizedHoursStringOptions:a4 conciseStyle:0 openAt:0];
  return v10;
}

- (_MKLocalizedHoursBuilder)initWithMapItem:(id)a3 localizedHoursStringOptions:(unint64_t)a4 conciseStyle:(BOOL)a5 openAt:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a3;
  v12 = [v11 _businessHours];
  id v13 = [v12 objectAtIndex:0];
  id v14 = [v11 timeZone];

  id v15 = [(_MKLocalizedHoursBuilder *)self initWithBusinessHours:v13 timeZone:v14 localizedHoursStringOptions:a4 conciseStyle:v6 openAt:v10];
  return v15;
}

- (_MKLocalizedHoursBuilder)initWithMapItemForMessageForBusiness:(id)a3 localizedHoursStringOptions:(unint64_t)a4
{
  id v6 = a3;
  v7 = [v6 _geoMapItem];
  v8 = [v7 _messageLink];
  v9 = [v8 messageBusinessHours];
  id v10 = [v6 _geoMapItem];

  id v11 = [v10 _messageLink];
  v12 = [v11 timeZone];
  id v13 = [(_MKLocalizedHoursBuilder *)self initWithBusinessHours:v9 timeZone:v12 localizedHoursStringOptions:a4 conciseStyle:0 openAt:0];

  return v13;
}

- (void)_commonInit
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39___MKLocalizedHoursBuilder__commonInit__block_invoke;
  block[3] = &unk_1E54B8188;
  block[4] = self;
  if (onceToken != -1) {
    dispatch_once(&onceToken, block);
  }
}

- (void)_resetLocalizedBuilder:(BOOL)a3
{
  BOOL v3 = a3;
  *(_OWORD *)&self->_geoMapItemOpeningHourOptions = xmmword_18BD1B170;
  timeZone = self->_timeZone;
  self->_timeZone = 0;

  operatingHours = self->_operatingHours;
  self->_operatingHours = 0;

  v7 = [MEMORY[0x1E4F428B8] clearColor];
  hoursStateLabelColor = self->_hoursStateLabelColor;
  self->_hoursStateLabelColor = v7;

  self->_state = 0;

  [(_MKLocalizedHoursBuilder *)self _resetLocalizedStrings:v3];
}

- (void)_resetLocalizedStrings:(BOOL)a3
{
  localizedOpenState = self->_localizedOpenState;
  self->_localizedOpenState = (NSString *)&stru_1ED919588;

  localizedOperatingHours = self->_localizedOperatingHours;
  self->_localizedOperatingHours = (NSString *)&stru_1ED919588;
}

- (void)setTimeZone:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)&self->_timeZone, a3);
    [(id)_MergedGlobals_162 setTimeZone:self->_timeZone];
    [(id)qword_1EB316078 setTimeZone:v5];
    [(id)qword_1EB316080 setTimeZone:v5];
    [(id)qword_1EB316088 setTimeZone:v5];
    [(_MKLocalizedHoursBuilder *)self _updateLocalizedString];
  }
  else
  {
    [(_MKLocalizedHoursBuilder *)self _resetLocalizedBuilder:1];
  }
}

- (void)setGeoMapItemOpeningHourOptions:(unint64_t)a3
{
  if (self->_geoMapItemOpeningHourOptions != a3)
  {
    self->_geoMapItemOpeningHourOptions = a3;
    [(_MKLocalizedHoursBuilder *)self _updateLocalizedString];
  }
}

- (void)setLocalizedHoursStringOptions:(unint64_t)a3
{
  if (self->_localizedHoursStringOptions != a3)
  {
    self->_localizedHoursStringOptions = a3;
    [(_MKLocalizedHoursBuilder *)self _updateLocalizedString];
  }
}

- (void)setOperatingHours:(id)a3
{
  id v5 = (GEOBusinessHours *)a3;
  if (self->_operatingHours != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_operatingHours, a3);
    self->_geoMapItemOpeningHourOptions = [MEMORY[0x1E4F646C8] _geoMapItemOpeningHoursOptionsForBusinessHours:self->_operatingHours compareDate:self->_compareDate timeZone:self->_timeZone];
    [(_MKLocalizedHoursBuilder *)self _updateLocalizedString];
    id v5 = v6;
  }
}

- (NSString)localizedOperatingHours
{
  localizedOperatingHours = self->_localizedOperatingHours;
  if (!localizedOperatingHours)
  {
    [(_MKLocalizedHoursBuilder *)self _updateLocalizedString];
    localizedOperatingHours = self->_localizedOperatingHours;
  }

  return localizedOperatingHours;
}

- (NSString)localizedOpenState
{
  if (!self->_localizedOpenState) {
    [(_MKLocalizedHoursBuilder *)self _updateLocalizedString];
  }
  if ((self->_localizedHoursStringOptions & 0x40) != 0) {
    localizedOpenState = &stru_1ED919588;
  }
  else {
    localizedOpenState = (__CFString *)self->_localizedOpenState;
  }

  return (NSString *)localizedOpenState;
}

- (NSDate)compareDate
{
  compareDate = self->_compareDate;
  if (!compareDate)
  {
    v4 = [MEMORY[0x1E4F1C9C8] date];
    id v5 = self->_compareDate;
    self->_compareDate = v4;

    compareDate = self->_compareDate;
  }

  return compareDate;
}

- (UIColor)hoursStateLabelColor
{
  hoursStateLabelColor = self->_hoursStateLabelColor;
  if (!hoursStateLabelColor)
  {
    [(_MKLocalizedHoursBuilder *)self _updateLocalizedString];
    hoursStateLabelColor = self->_hoursStateLabelColor;
  }

  return hoursStateLabelColor;
}

- (void)_updateLocalizedString
{
  timeZone = self->_timeZone;
  if (timeZone && self->_operatingHours && (self->_geoMapItemOpeningHourOptions & 1) == 0)
  {
    v4 = [(_MKLocalizedHoursBuilder *)self _updateLocalizedOperatingHoursString:self->_localizedHoursStringOptions];
    localizedOperatingHours = self->_localizedOperatingHours;
    self->_localizedOperatingHours = v4;

    id v6 = [(_MKLocalizedHoursBuilder *)self _updateLocalizedOperatingHoursString:1];
    localizedOpenState = self->_localizedOpenState;
    self->_localizedOpenState = v6;

    [(_MKLocalizedHoursBuilder *)self updateHoursLabelColor];
  }
  else
  {
    [(_MKLocalizedHoursBuilder *)self _resetLocalizedStrings:timeZone == 0];
  }
}

- (int64_t)state
{
  if (self->_isClosedTodayAllDay || self->_isCurrentlyClosed) {
    return 1;
  }
  if (self->_isClosingSoon) {
    return 4;
  }
  if (self->_isOpeningSoon) {
    return 6;
  }
  if (self->_isPermanentlyClosed) {
    return 3;
  }
  if (self->_isTemporarilyClosed) {
    return 2;
  }
  if (self->_isOpenTodayAllDay) {
    return 5;
  }
  if (self->_isCurrentlyOpen) {
    return 5;
  }
  return 0;
}

- (id)_updateLocalizedOperatingHoursString:(unint64_t)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  unint64_t geoMapItemOpeningHourOptions = self->_geoMapItemOpeningHourOptions;
  *(int16x4_t *)v3.i8 = vdup_n_s16(geoMapItemOpeningHourOptions);
  v3.i32[0] &= 0xFF00FFu;
  v3.i16[2] = v3.u8[4];
  v3.i16[3] = v3.u8[6];
  *(uint16x4_t *)v3.i8 = vshl_u16(*(uint16x4_t *)v3.i8, (uint16x4_t)0xFFFBFFFAFFFEFFFDLL);
  v3.i32[0] &= 0xFF01FF01;
  v3.i16[2] &= 0xFF01u;
  v3.i16[3] &= 0xFF01u;
  *(_DWORD *)&self->_isClosedTodayAllDay = vmovn_s16(v3).u32[0];
  self->_isPermanentlyClosed = (geoMapItemOpeningHourOptions & 0x80) != 0;
  self->_isTemporarilyClosed = BYTE1(geoMapItemOpeningHourOptions) & 1;
  self->_isOpenTodayAllDay = (geoMapItemOpeningHourOptions & 0x10) != 0;
  self->_isCurrentlyOpen = (geoMapItemOpeningHourOptions & 2) != 0;
  if ((geoMapItemOpeningHourOptions & 0x80) != 0)
  {
    id v5 = @"Permanently Closed";
LABEL_18:
    _MKLocalizedStringFromThisBundle(v5);
    v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }
  if ((geoMapItemOpeningHourOptions >> 8))
  {
    id v5 = @"Temporarily Closed";
    goto LABEL_18;
  }
  char v6 = a3;
  v8 = (void *)MEMORY[0x1E4F64848];
  v9 = [(_MKLocalizedHoursBuilder *)self compareDate];
  id v10 = [(GEOBusinessHours *)self->_operatingHours placeDailyNormalizedHours];
  uint64_t v11 = [v8 getWeekdayForDate:v9 inNormalizedHours:v10 timeZone:self->_timeZone];

  v12 = (void *)MEMORY[0x1E4F64840];
  id v13 = [(GEOBusinessHours *)self->_operatingHours placeDailyHours];
  uint64_t v53 = v11;
  id v14 = [v12 getPlaceDailyHoursForWeekday:v11 placeDailyHours:v13];

  id v15 = objc_opt_new();
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  v54 = v14;
  v16 = [v14 openIntervals];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v55 objects:v63 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v56 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        uint64_t v22 = [v21 startDate];
        if (v22)
        {
          objc_super v23 = (void *)v22;
          v24 = [v21 endDate];

          if (v24)
          {
            v25 = [v21 startDate];
            [v15 addObject:v25];

            v26 = [v21 endDate];
            [v15 addObject:v26];
          }
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v55 objects:v63 count:16];
    }
    while (v18);
  }

  if (!MapsFeature_IsEnabled_SearchAndDiscovery() || !self->_isUsingConciseStyle)
  {
    if (self->_isClosedTodayAllDay)
    {
      if ((v6 & 0x10) == 0)
      {
        v29 = @"Closed Today";
LABEL_22:
        uint64_t v30 = _MKLocalizedStringFromThisBundle(v29);
LABEL_23:
        v28 = (__CFString *)v30;
LABEL_27:
        v27 = v54;
        goto LABEL_28;
      }
LABEL_26:
      v28 = &stru_1ED919588;
      goto LABEL_27;
    }
    if (self->_isOpenTodayAllDay)
    {
      if ((v6 & 0x28) != 0) {
        goto LABEL_26;
      }
      v37 = _MKLocalizedStringFromThisBundle(@"Placecard Full Hours, open");
      v38 = NSString;
      if ((v6 & 4) != 0) {
        v39 = (void *)qword_1EB316090;
      }
      else {
        v39 = (void *)qword_1EB316098;
      }
      v40 = [v39 stringFromTimeInterval:86400.0];
      objc_msgSend(v38, "localizedStringWithFormat:", v37, v40);
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_50:
      goto LABEL_27;
    }
    if (self->_isCurrentlyClosed)
    {
      if (self->_isOpeningSoon)
      {
        if (v6)
        {
          v29 = @"Opening Soon";
          goto LABEL_22;
        }
        if ((v6 & 2) == 0)
        {
          if (v6 < 0)
          {
            v32 = [(_MKLocalizedHoursBuilder *)self _formattedStringForHourRangesWithStartAndEndDates:v15 timeZone:self->_timeZone];
            uint64_t v33 = [v32 length];
            uint64_t v34 = _MKLocalizedStringFromThisBundle(@"Opening Soon");
            v28 = (__CFString *)v34;
            if (v33)
            {
              v62[0] = v34;
              v62[1] = v32;
              v35 = (void *)MEMORY[0x1E4F1C978];
              v36 = v62;
LABEL_77:
              v50 = [v35 arrayWithObjects:v36 count:2];
              uint64_t v51 = [(_MKLocalizedHoursBuilder *)self concatenateStrings:v50 joinedByString:@" · "];

              v28 = (__CFString *)v51;
              goto LABEL_27;
            }
            goto LABEL_78;
          }
          goto LABEL_54;
        }
        v37 = [(_MKLocalizedHoursBuilder *)self _formattedStringForHourRangesWithStartAndEndDates:v15 timeZone:self->_timeZone];
        if ([v37 length])
        {
          v41 = NSString;
          v42 = @"%@, Opening Soon";
LABEL_82:
          v52 = _MKLocalizedStringFromThisBundle(v42);
          objc_msgSend(v41, "stringWithFormat:", v52, v37);
          v28 = (__CFString *)objc_claimAutoreleasedReturnValue();

          goto LABEL_50;
        }
        v45 = @"Opening Soon";
      }
      else
      {
        if (v6)
        {
          v29 = @"Closed Now";
          goto LABEL_22;
        }
        if ((v6 & 2) == 0)
        {
          if (v6 < 0)
          {
            v32 = [(_MKLocalizedHoursBuilder *)self _formattedStringForHourRangesWithStartAndEndDates:v15 timeZone:self->_timeZone];
            uint64_t v46 = [v32 length];
            uint64_t v47 = _MKLocalizedStringFromThisBundle(@"Closed Now");
            v28 = (__CFString *)v47;
            if (v46)
            {
              v61[0] = v47;
              v61[1] = v32;
              v35 = (void *)MEMORY[0x1E4F1C978];
              v36 = v61;
              goto LABEL_77;
            }
            goto LABEL_78;
          }
          goto LABEL_54;
        }
        v37 = [(_MKLocalizedHoursBuilder *)self _formattedStringForHourRangesWithStartAndEndDates:v15 timeZone:self->_timeZone];
        if ([v37 length])
        {
          v41 = NSString;
          v42 = @"%@, Closed";
          goto LABEL_82;
        }
        v45 = @"Closed Now";
      }
    }
    else
    {
      if (!self->_isCurrentlyOpen) {
        goto LABEL_54;
      }
      if (self->_isClosingSoon)
      {
        if (v6)
        {
          v29 = @"Closing Soon";
          goto LABEL_22;
        }
        if ((v6 & 2) == 0)
        {
          if (v6 < 0)
          {
            v32 = [(_MKLocalizedHoursBuilder *)self _formattedStringForHourRangesWithStartAndEndDates:v15 timeZone:self->_timeZone];
            uint64_t v48 = [v32 length];
            uint64_t v49 = _MKLocalizedStringFromThisBundle(@"Closing Soon");
            v28 = (__CFString *)v49;
            if (v48)
            {
              v60[0] = v49;
              v60[1] = v32;
              v35 = (void *)MEMORY[0x1E4F1C978];
              v36 = v60;
              goto LABEL_77;
            }
            goto LABEL_78;
          }
          if ((v6 & 8) != 0) {
            goto LABEL_26;
          }
          goto LABEL_54;
        }
        v37 = [(_MKLocalizedHoursBuilder *)self _formattedStringForHourRangesWithStartAndEndDates:v15 timeZone:self->_timeZone];
        if ([v37 length])
        {
          v41 = NSString;
          v42 = @"%@, Closing Soon";
          goto LABEL_82;
        }
        v45 = @"Closing Soon";
      }
      else
      {
        if ((v6 & 8) != 0) {
          goto LABEL_26;
        }
        if (v6)
        {
          v29 = @"Open";
          goto LABEL_22;
        }
        if ((v6 & 2) == 0)
        {
          if (v6 < 0)
          {
            v32 = [(_MKLocalizedHoursBuilder *)self _formattedStringForHourRangesWithStartAndEndDates:v15 timeZone:self->_timeZone];
            uint64_t v43 = [v32 length];
            uint64_t v44 = _MKLocalizedStringFromThisBundle(@"Open");
            v28 = (__CFString *)v44;
            if (v43)
            {
              v59[0] = v44;
              v59[1] = v32;
              v35 = (void *)MEMORY[0x1E4F1C978];
              v36 = v59;
              goto LABEL_77;
            }
LABEL_78:

            goto LABEL_27;
          }
LABEL_54:
          uint64_t v30 = [(_MKLocalizedHoursBuilder *)self _formattedStringForHourRangesWithStartAndEndDates:v15 timeZone:self->_timeZone];
          goto LABEL_23;
        }
        v37 = [(_MKLocalizedHoursBuilder *)self _formattedStringForHourRangesWithStartAndEndDates:v15 timeZone:self->_timeZone];
        if ([v37 length])
        {
          v41 = NSString;
          v42 = @"%@, Open";
          goto LABEL_82;
        }
        v45 = @"Open";
      }
    }
    _MKLocalizedStringFromThisBundle(v45);
    v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_50;
  }
  v27 = v54;
  v28 = [(_MKLocalizedHoursBuilder *)self _formatedOperatingHourString:v54 timeZone:self->_timeZone weekday:v53];
LABEL_28:

LABEL_29:

  return v28;
}

- (id)_formatedOperatingHourString:(id)a3 timeZone:(id)a4 weekday:(int64_t)a5
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (self->_isClosedTodayAllDay)
  {
    id v10 = [(_MKLocalizedHoursBuilder *)self _findNextOperatingWeekday:a5];
    goto LABEL_37;
  }
  if (self->_isOpenTodayAllDay)
  {
    uint64_t v11 = NSString;
    v12 = _MKLocalizedStringFromThisBundle(@"Business Hours [Open All Day]");
    id v10 = [v11 stringWithFormat:v12];
    goto LABEL_36;
  }
  v12 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  [v12 setTimeZone:v9];
  if ([(GEOResultRefinementTime *)self->_openAt isSelected])
  {
    [(GEOResultRefinementTime *)self->_openAt timeStamp];
    if (v13 > 0.0)
    {
      id v14 = [v8 openIntervals];
      id v15 = [v14 lastObject];
      v16 = [v15 endDate];

      if (v16)
      {
        if ([(_MKLocalizedHoursBuilder *)self _isOpenAtClosingSoon])
        {
          id v10 = [(_MKLocalizedHoursBuilder *)self showClosingSoonHour:v16 timeZone:v9];
        }
        else
        {
          if ([(_MKLocalizedHoursBuilder *)self _isCurrentTimeSingular:v16]) {
            uint64_t v46 = @"Business Hours [Open till] 1:xx";
          }
          else {
            uint64_t v46 = @"Business Hours [Open till]";
          }
          uint64_t v47 = _MKLocalizedStringFromThisBundle(v46);
          uint64_t v48 = NSString;
          uint64_t v49 = [(_MKLocalizedHoursBuilder *)self _localizedTimeStringFromDate:v16 timezone:v9];
          objc_msgSend(v48, "stringWithFormat:", v47, v49);
          id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        id v10 = &stru_1ED919588;
      }
LABEL_35:

      goto LABEL_36;
    }
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obj = [v8 openIntervals];
  uint64_t v17 = [obj countByEnumeratingWithState:&v55 objects:v59 count:16];
  if (!v17) {
    goto LABEL_22;
  }
  uint64_t v18 = v17;
  uint64_t v54 = *(void *)v56;
  id v51 = v9;
  id v52 = v8;
  int64_t v50 = a5;
  while (2)
  {
    for (uint64_t i = 0; i != v18; ++i)
    {
      if (*(void *)v56 != v54) {
        objc_enumerationMutation(obj);
      }
      unint64_t v20 = *(void **)(*((void *)&v55 + 1) + 8 * i);
      v21 = [(_MKLocalizedHoursBuilder *)self compareDate];
      uint64_t v22 = [v12 component:32 fromDate:v21];

      objc_super v23 = [v20 startDate];
      uint64_t v24 = [v12 component:32 fromDate:v23];

      v25 = [v20 startDate];
      uint64_t v26 = [v12 component:64 fromDate:v25];

      v27 = [v20 endDate];
      v28 = [v20 startDate];
      [v27 timeIntervalSinceDate:v28];
      uint64_t v30 = (uint64_t)(v29 + (double)(60 * v26)) / 3600;

      uint64_t v31 = v30 + v24;
      v32 = [v20 endDate];
      uint64_t v33 = [v12 component:64 fromDate:v32];

      uint64_t v34 = [(_MKLocalizedHoursBuilder *)self compareDate];
      uint64_t v35 = [v12 component:64 fromDate:v34];

      if (v22 >= v31 && (v22 != v31 || v35 > v33)) {
        continue;
      }
      v16 = [v20 startDate];
      v37 = [v20 endDate];

      if (self->_isOpeningSoon && v16)
      {
        id v9 = v51;
        id v8 = v52;
        if ([(_MKLocalizedHoursBuilder *)self _isCurrentTimeSingular:v16]) {
          v38 = @"Business Hours [Opening Soon] 1:xx";
        }
        else {
          v38 = @"Business Hours [Opening Soon]";
        }
      }
      else
      {
        id v9 = v51;
        id v8 = v52;
        if (self->_isClosingSoon && v37)
        {
          id v10 = [(_MKLocalizedHoursBuilder *)self showClosingSoonHour:v37 timeZone:v51];
LABEL_34:

          goto LABEL_35;
        }
        if (self->_isCurrentlyOpen && v37)
        {
          if ([(_MKLocalizedHoursBuilder *)self _isCurrentTimeSingular:v37]) {
            v45 = @"Business Hours [Open till] 1:xx";
          }
          else {
            v45 = @"Business Hours [Open till]";
          }
          v39 = _MKLocalizedStringFromThisBundle(v45);
          v40 = NSString;
          v41 = self;
          v42 = v37;
          goto LABEL_33;
        }
        if (!self->_isCurrentlyClosed) {
          goto LABEL_51;
        }
        if (!v16)
        {
          a5 = v50;
          goto LABEL_23;
        }
        if ([(_MKLocalizedHoursBuilder *)self _isCurrentTimeSingular:v16]) {
          v38 = @"Business Hours [Closed till time] 1:xx";
        }
        else {
          v38 = @"Business Hours [Closed till time]";
        }
      }
      v39 = _MKLocalizedStringFromThisBundle(v38);
      v40 = NSString;
      v41 = self;
      v42 = v16;
LABEL_33:
      uint64_t v43 = [(_MKLocalizedHoursBuilder *)v41 _localizedTimeStringFromDate:v42 timezone:v9];
      objc_msgSend(v40, "stringWithFormat:", v39, v43);
      id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_34;
    }
    uint64_t v18 = [obj countByEnumeratingWithState:&v55 objects:v59 count:16];
    id v9 = v51;
    id v8 = v52;
    a5 = v50;
    if (v18) {
      continue;
    }
    break;
  }
LABEL_22:

  v37 = 0;
  v16 = 0;
  if (self->_isCurrentlyClosed)
  {
LABEL_23:
    id v10 = [(_MKLocalizedHoursBuilder *)self _findNextOperatingWeekday:a5];

    goto LABEL_36;
  }
LABEL_51:

  id v10 = &stru_1ED919588;
LABEL_36:

LABEL_37:

  return v10;
}

- (id)showClosingSoonHour:(id)a3 timeZone:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([(_MKLocalizedHoursBuilder *)self _isCurrentTimeSingular:v7]) {
    id v8 = @"Business Hours [Closing Soon] 1:xx";
  }
  else {
    id v8 = @"Business Hours [Closing Soon]";
  }
  id v9 = _MKLocalizedStringFromThisBundle(v8);
  id v10 = NSString;
  uint64_t v11 = [(_MKLocalizedHoursBuilder *)self _localizedTimeStringFromDate:v7 timezone:v6];

  v12 = objc_msgSend(v10, "stringWithFormat:", v9, v11);

  return v12;
}

- (BOOL)_isCurrentTimeSingular:(id)a3
{
  uint64_t v3 = qword_1EB3160A0;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_1EB3160A0, &__block_literal_global_77);
  }
  uint64_t v5 = [(id)qword_1EB3160A8 component:32 fromDate:v4];

  return v5 == 1;
}

- (id)_localizedTimeStringFromDate:(id)a3 timezone:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66___MKLocalizedHoursBuilder__localizedTimeStringFromDate_timezone___block_invoke;
  block[3] = &unk_1E54B8188;
  id v7 = v6;
  id v16 = v7;
  if (qword_1EB3160C8 != -1) {
    dispatch_once(&qword_1EB3160C8, block);
  }
  id v8 = [(id)qword_1EB3160B0 dateFormat];
  uint64_t v9 = [v8 rangeOfString:@"a"];

  uint64_t v10 = [(id)qword_1EB3160C0 component:64 fromDate:v5];
  [(id)qword_1EB3160B0 setTimeZone:v7];
  if (v10) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = v9 == 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v11) {
    v12 = @"jmm";
  }
  else {
    v12 = @"j a";
  }
  [(id)qword_1EB3160B0 setLocalizedDateFormatFromTemplate:v12];
  double v13 = [(id)qword_1EB3160B0 stringFromDate:v5];

  return v13;
}

- (id)_findNextOperatingWeekday:(int64_t)a3
{
  id v5 = [(GEOBusinessHours *)self->_operatingHours operatingWeekdays];
  if (![v5 count])
  {
    double v13 = NSString;
    id v14 = _MKLocalizedStringFromThisBundle(@"Business Hours [Permanently Closed]");
    id v15 = [v13 stringWithFormat:v14];
LABEL_12:
    uint64_t v18 = v15;
    goto LABEL_14;
  }
  uint64_t v6 = a3 % 7 + 1;
  uint64_t v7 = 7;
  while (1)
  {
    id v8 = (void *)MEMORY[0x1E4F64840];
    uint64_t v9 = [(GEOBusinessHours *)self->_operatingHours placeDailyHours];
    uint64_t v10 = [v8 getPlaceDailyHoursForWeekday:v6 placeDailyHours:v9];

    BOOL v11 = [v10 openIntervals];
    uint64_t v12 = [v11 count];

    if (v12) {
      break;
    }

    uint64_t v6 = v6 % 7 + 1;
    if (!--v7) {
      goto LABEL_8;
    }
  }

LABEL_8:
  if (qword_1EB3160D8 != -1) {
    dispatch_once(&qword_1EB3160D8, &__block_literal_global_225);
  }
  id v16 = (void *)qword_1EB3160D0;
  uint64_t v17 = [NSNumber numberWithInteger:v6];
  id v14 = [v16 objectForKeyedSubscript:v17];

  if (v14)
  {
    id v15 = v14;
    id v14 = v15;
    goto LABEL_12;
  }
  uint64_t v18 = &stru_1ED919588;
LABEL_14:

  return v18;
}

- (BOOL)_isOpenAtClosingSoon
{
  uint64_t v3 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v4 = [(_MKLocalizedHoursBuilder *)self timeZone];
  [v3 setTimeZone:v4];

  id v5 = (void *)MEMORY[0x1E4F64848];
  uint64_t v6 = [(_MKLocalizedHoursBuilder *)self compareDate];
  uint64_t v7 = [(GEOBusinessHours *)self->_operatingHours placeDailyNormalizedHours];
  uint64_t v8 = [v5 getWeekdayForDate:v6 inNormalizedHours:v7 timeZone:self->_timeZone];

  uint64_t v9 = (void *)MEMORY[0x1E4F64840];
  uint64_t v10 = [(GEOBusinessHours *)self->_operatingHours placeDailyHours];
  BOOL v11 = [v9 getPlaceDailyHoursForWeekday:v8 placeDailyHours:v10];

  uint64_t v12 = [v11 openIntervals];
  double v13 = [v12 lastObject];
  id v14 = [v13 endDate];

  if (v14)
  {
    id v15 = [(_MKLocalizedHoursBuilder *)self compareDate];
    id v16 = [v3 components:224 fromDate:v15];

    uint64_t v17 = [v3 components:224 fromDate:v14];
    uint64_t v18 = [v17 hour];
    if (v18 < [v16 hour]) {
      objc_msgSend(v17, "setHour:", objc_msgSend(v17, "hour") + 24);
    }
    uint64_t v19 = [v17 hour];
    uint64_t v20 = [v17 minute];
    uint64_t v21 = [v16 hour];
    double v22 = (double)(v20 - [v16 minute] + 60 * (v19 - v21)) * 60.0;
    BOOL isClosingSoon = v22 < (double)[(GEOBusinessHours *)self->_operatingHours closingSoonThresdholdInSeconds];
  }
  else
  {
    BOOL isClosingSoon = self->_isClosingSoon;
  }

  return isClosingSoon;
}

- (id)_formattedStringForHourRangesWithStartAndEndDates:(id)a3 timeZone:(id)a4
{
  if ((self->_localizedHoursStringOptions & 0x100) != 0) {
    objc_msgSend(NSString, "_navigation_formattedStringForHourRanges:timeZone:delimeter:", a3, a4, @"\n");
  }
  else {
  id v4 = objc_msgSend(NSString, "_navigation_formattedStringForHourRanges:timeZone:", a3, a4);
  }

  return v4;
}

- (void)updateHoursLabelColor
{
}

- (void)updateHoursLabelColorWithDefaultLabelColor:(id)a3
{
  id v13 = a3;
  if (!MapsFeature_IsEnabled_SearchAndDiscovery()
    || ![(GEOResultRefinementTime *)self->_openAt isSelected]
    || ([(GEOResultRefinementTime *)self->_openAt timeStamp], v4 <= 0.0)
    || [(_MKLocalizedHoursBuilder *)self _isOpenAtClosingSoon])
  {
    if (self->_isOpeningSoon || self->_isClosingSoon)
    {
      id v5 = (void *)MEMORY[0x1E4F428B8];
      double v6 = 0.568627477;
      double v7 = 1.0;
      double v8 = 0.0;
LABEL_8:
      uint64_t v9 = [v5 colorWithRed:v7 green:v6 blue:v8 alpha:1.0];
LABEL_9:
      hoursStateLabelColor = self->_hoursStateLabelColor;
      self->_hoursStateLabelColor = v9;
      goto LABEL_10;
    }
    if (self->_isClosedTodayAllDay
      || self->_isCurrentlyClosed
      || self->_isPermanentlyClosed
      || self->_isTemporarilyClosed)
    {
      id v5 = (void *)MEMORY[0x1E4F428B8];
      double v7 = 0.949019611;
      double v6 = 0.286274523;
      double v8 = 0.200000003;
      goto LABEL_8;
    }
  }
  if (v13)
  {
    uint64_t v9 = (UIColor *)v13;
    goto LABEL_9;
  }
  hoursStateLabelColor = +[MKInfoCardThemeManager currentTheme];
  BOOL v11 = [hoursStateLabelColor textColor];
  uint64_t v12 = self->_hoursStateLabelColor;
  self->_hoursStateLabelColor = v11;

LABEL_10:
}

- (id)formatData:(id)a3
{
  uint64_t v126 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CBF0];
  uint64_t v104 = [MEMORY[0x1E4F1CBF0] mutableCopy];
  double v6 = (void *)[v5 mutableCopy];
  double v7 = (void *)[v5 mutableCopy];
  double v8 = (void *)[v5 mutableCopy];
  uint64_t v9 = [v5 mutableCopy];
  uint64_t v10 = (void *)v9;
  if (self->_timeZone)
  {
    v98 = (void *)v9;
    BOOL v11 = self;
    uint64_t v12 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    [v12 setTimeZone:v11->_timeZone];
    v108 = v11;
    v97 = [(_MKLocalizedHoursBuilder *)v11 compareDate];
    v91 = objc_msgSend(v12, "components:fromDate:", 512);
    uint64_t v96 = [v91 weekday];
    long long v117 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    id obj = v4;
    v99 = v8;
    uint64_t v100 = [obj countByEnumeratingWithState:&v117 objects:v125 count:16];
    v103 = v12;
    if (v100)
    {
      uint64_t v94 = *(void *)v118;
      id v93 = v4;
      v102 = v6;
      v95 = v7;
      do
      {
        uint64_t v13 = 0;
        do
        {
          id v14 = (void *)v104;
          if (*(void *)v118 != v94) {
            objc_enumerationMutation(obj);
          }
          id v15 = v4;
          id v16 = *(void **)(*((void *)&v117 + 1) + 8 * v13);
          uint64_t v17 = [v12 components:28 fromDate:v97];
          objc_msgSend(v17, "setDay:", objc_msgSend(v16, "dayOfWeekRange") - v96 + objc_msgSend(v17, "day"));
          [v16 dayOfWeekRange];
          uint64_t v19 = v18;
          uint64_t v105 = v13;
          v106 = v17;
          if (v18 == 1)
          {
            uint64_t v20 = (void *)qword_1EB316078;
            uint64_t v21 = [v12 dateFromComponents:v17];
            uint64_t v107 = [v20 stringFromDate:v21];

            double v22 = (void *)qword_1EB316080;
            objc_super v23 = [v12 dateFromComponents:v17];
            id v24 = [v22 stringFromDate:v23];
          }
          else
          {
            [v16 dayOfWeekRange];
            if (v25 == 7)
            {
              _MKLocalizedStringFromThisBundle(@"Every Day");
              id v24 = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v107 = (uint64_t)v24;
            }
            else
            {
              id v26 = (id)qword_1EB316078;
              v110 = (void *)[v17 copy];
              v27 = (void *)[v110 copy];
              [v16 dayOfWeekRange];
              objc_msgSend(v27, "setDay:", v28 + objc_msgSend(v27, "day") - 1);
              double v29 = [v103 dateFromComponents:v110];
              uint64_t v30 = [v26 stringFromDate:v29];

              uint64_t v31 = [v103 dateFromComponents:v27];
              uint64_t v32 = [v26 stringFromDate:v31];

              uint64_t v33 = NSString;
              uint64_t v34 = _MKLocalizedStringFromThisBundle(@"Placecard Full Hours Weekday Range");
              uint64_t v35 = (void *)v32;
              uint64_t v107 = objc_msgSend(v33, "stringWithFormat:", v34, v30, v32);

              id v36 = (id)qword_1EB316080;
              v37 = [v103 dateFromComponents:v110];
              v38 = [v36 stringFromDate:v37];

              v39 = [v103 dateFromComponents:v27];
              v40 = [v36 stringFromDate:v39];

              v41 = NSString;
              v42 = _MKLocalizedStringFromThisBundle(@"Placecard Full Hours Weekday Range");
              objc_msgSend(v41, "stringWithFormat:", v42, v38, v40);
              id v24 = (id)objc_claimAutoreleasedReturnValue();

              double v6 = v102;
              id v14 = (void *)v104;
              id v15 = v93;
            }
          }
          [v14 addObject:v107];
          [v6 addObject:v24];
          uint64_t v43 = [NSNumber numberWithBool:v19 == 1];
          [v98 addObject:v43];

          uint64_t v44 = (void *)MEMORY[0x1E4F1CA48];
          v45 = [v16 openIntervals];
          uint64_t v46 = objc_msgSend(v44, "arrayWithCapacity:", objc_msgSend(v45, "count"));

          uint64_t v47 = (void *)MEMORY[0x1E4F1CA48];
          uint64_t v48 = [v16 openIntervals];
          uint64_t v49 = objc_msgSend(v47, "arrayWithCapacity:", objc_msgSend(v48, "count"));

          int64_t v50 = [v16 openIntervals];
          uint64_t v51 = [v50 count];

          id v52 = (void *)v107;
          uint64_t v53 = v24;
          if (v51)
          {
            v112 = v49;
            v109 = v46;
            id v101 = v24;
            long long v115 = 0u;
            long long v116 = 0u;
            long long v113 = 0u;
            long long v114 = 0u;
            uint64_t v54 = [v16 openIntervals];
            uint64_t v55 = [v54 countByEnumeratingWithState:&v113 objects:v124 count:16];
            if (v55)
            {
              uint64_t v56 = v55;
              uint64_t v111 = *(void *)v114;
              unint64_t v57 = 0x1E4F29000uLL;
              long long v58 = v109;
              do
              {
                for (uint64_t i = 0; i != v56; ++i)
                {
                  if (*(void *)v114 != v111) {
                    objc_enumerationMutation(v54);
                  }
                  uint64_t v60 = *(void **)(*((void *)&v113 + 1) + 8 * i);
                  [v60 duration];
                  if (v61 == 86400.0)
                  {
                    v62 = _MKLocalizedStringFromThisBundle(@"Placecard Full Hours, open");
                    v63 = *(void **)(v57 + 24);
                    uint64_t v64 = [(id)qword_1EB316098 stringFromTimeInterval:86400.0];
                    v65 = objc_msgSend(v63, "localizedStringWithFormat:", v62, v64);

                    [v58 addObject:v65];
                    v66 = *(void **)(v57 + 24);
                    v67 = [(id)qword_1EB316090 stringFromTimeInterval:86400.0];
                    v68 = objc_msgSend(v66, "localizedStringWithFormat:", v62, v67);

                    v69 = v112;
                    [v112 addObject:v68];
                  }
                  else
                  {
                    v70 = (void *)qword_1EB316088;
                    v71 = [v60 startDate];
                    v68 = [v70 stringFromDate:v71];

                    v72 = (void *)qword_1EB316088;
                    v73 = [v60 endDate];
                    v74 = [v72 stringFromDate:v73];

                    v75 = *(void **)(v57 + 24);
                    v76 = _MKLocalizedStringFromThisBundle(@"Operating Hours Range");
                    v77 = objc_msgSend(v75, "stringWithFormat:", v76, v68, v74);

                    [v58 addObject:v77];
                    v78 = [v60 startDate];
                    v123[0] = v78;
                    v79 = [v60 endDate];
                    v123[1] = v79;
                    v80 = [MEMORY[0x1E4F1C978] arrayWithObjects:v123 count:2];
                    v62 = [(_MKLocalizedHoursBuilder *)v108 _formattedStringForHourRangesWithStartAndEndDates:v80 timeZone:v108->_timeZone];

                    long long v58 = v109;
                    unint64_t v57 = 0x1E4F29000;

                    v69 = v112;
                    [v112 addObject:v62];
                  }
                }
                uint64_t v56 = [v54 countByEnumeratingWithState:&v113 objects:v124 count:16];
              }
              while (v56);
              id v15 = v93;
              double v7 = v95;
              id v52 = (void *)v107;
              uint64_t v49 = v69;
              uint64_t v53 = v101;
              double v6 = v102;
            }
            else
            {
              double v7 = v95;
              uint64_t v53 = v24;
              double v6 = v102;
              long long v58 = v109;
            }
          }
          else
          {
            uint64_t v54 = _MKLocalizedStringFromThisBundle(@"Closed");
            [v46 addObject:v54];
            [v49 addObject:v54];
            double v7 = v95;
            long long v58 = v46;
            double v6 = v102;
          }

          [v7 addObject:v58];
          double v8 = v99;
          [v99 addObject:v49];

          uint64_t v13 = v105 + 1;
          uint64_t v12 = v103;
          id v4 = v15;
        }
        while (v105 + 1 != v100);
        uint64_t v100 = [obj countByEnumeratingWithState:&v117 objects:v125 count:16];
      }
      while (v100);
    }

    v121[0] = @"DaysFull";
    v121[1] = @"DaysShort";
    v81 = (void *)v104;
    v122[0] = v104;
    v122[1] = v6;
    v121[2] = @"HoursFull";
    v121[3] = @"HoursShort";
    v122[2] = v7;
    v122[3] = v8;
    v121[4] = @"CurrentHours";
    uint64_t v82 = [(_MKLocalizedHoursBuilder *)v108 localizedOperatingHours];
    v83 = (void *)v82;
    if (v82) {
      v84 = (__CFString *)v82;
    }
    else {
      v84 = &stru_1ED919588;
    }
    v122[4] = v84;
    v121[5] = @"CurrentOpenState";
    uint64_t v85 = [(_MKLocalizedHoursBuilder *)v108 localizedOpenState];
    v86 = (void *)v85;
    if (v85) {
      v87 = (__CFString *)v85;
    }
    else {
      v87 = &stru_1ED919588;
    }
    v121[6] = @"SingularWeekdayIdentifier";
    v122[5] = v87;
    v122[6] = v98;
    v88 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v122 forKeys:v121 count:7];
    v89 = (void *)[v88 mutableCopy];

    uint64_t v10 = v98;
    double v8 = v99;
    [(_MKLocalizedHoursBuilder *)v108 calculateWidthsForData:v89];
  }
  else
  {
    v89 = 0;
    v81 = (void *)v104;
  }

  return v89;
}

- (void)calculateWidthsForData:(id)a3
{
  v91[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v90 = *MEMORY[0x1E4F42508];
  id v4 = +[MKFontManager sharedManager];
  id v5 = [v4 bodyFont];
  v91[0] = v5;
  double v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:&v90 count:1];

  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  double v7 = [v3 objectForKeyedSubscript:@"DaysFull"];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v80 objects:v89 count:16];
  double v9 = 0.0;
  double v10 = 0.0;
  if (v8)
  {
    uint64_t v11 = v8;
    uint64_t v12 = *(void *)v81;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v81 != v12) {
          objc_enumerationMutation(v7);
        }
        id v14 = *(void **)(*((void *)&v80 + 1) + 8 * i);
        [v14 sizeWithAttributes:v6];
        if (v10 <= v15)
        {
          [v14 sizeWithAttributes:v6];
          double v10 = v16;
        }
      }
      uint64_t v11 = [v7 countByEnumeratingWithState:&v80 objects:v89 count:16];
    }
    while (v11);
  }

  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  v59 = v3;
  uint64_t v17 = [v3 objectForKeyedSubscript:@"HoursFull"];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v76 objects:v88 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v77;
    double v9 = 0.0;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v77 != v20) {
          objc_enumerationMutation(v17);
        }
        double v22 = *(void **)(*((void *)&v76 + 1) + 8 * j);
        long long v72 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        id v23 = v22;
        uint64_t v24 = [v23 countByEnumeratingWithState:&v72 objects:v87 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v73;
          do
          {
            for (uint64_t k = 0; k != v25; ++k)
            {
              if (*(void *)v73 != v26) {
                objc_enumerationMutation(v23);
              }
              uint64_t v28 = *(void **)(*((void *)&v72 + 1) + 8 * k);
              [v28 sizeWithAttributes:v6];
              if (v9 <= v29)
              {
                [v28 sizeWithAttributes:v6];
                double v9 = v30;
              }
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v72 objects:v87 count:16];
          }
          while (v25);
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v76 objects:v88 count:16];
    }
    while (v19);
  }

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  uint64_t v31 = [v59 objectForKeyedSubscript:@"DaysShort"];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v68 objects:v86 count:16];
  double v33 = 0.0;
  double v34 = 0.0;
  if (v32)
  {
    uint64_t v35 = v32;
    uint64_t v36 = *(void *)v69;
    do
    {
      for (uint64_t m = 0; m != v35; ++m)
      {
        if (*(void *)v69 != v36) {
          objc_enumerationMutation(v31);
        }
        v38 = *(void **)(*((void *)&v68 + 1) + 8 * m);
        [v38 sizeWithAttributes:v6];
        if (v34 <= v39)
        {
          [v38 sizeWithAttributes:v6];
          double v34 = v40;
        }
      }
      uint64_t v35 = [v31 countByEnumeratingWithState:&v68 objects:v86 count:16];
    }
    while (v35);
  }

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  v41 = [v59 objectForKeyedSubscript:@"HoursShort"];
  uint64_t v42 = [v41 countByEnumeratingWithState:&v64 objects:v85 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v65;
    double v33 = 0.0;
    do
    {
      for (uint64_t n = 0; n != v43; ++n)
      {
        if (*(void *)v65 != v44) {
          objc_enumerationMutation(v41);
        }
        uint64_t v46 = *(void **)(*((void *)&v64 + 1) + 8 * n);
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        id v47 = v46;
        uint64_t v48 = [v47 countByEnumeratingWithState:&v60 objects:v84 count:16];
        if (v48)
        {
          uint64_t v49 = v48;
          uint64_t v50 = *(void *)v61;
          do
          {
            for (iuint64_t i = 0; ii != v49; ++ii)
            {
              if (*(void *)v61 != v50) {
                objc_enumerationMutation(v47);
              }
              id v52 = *(void **)(*((void *)&v60 + 1) + 8 * ii);
              [v52 sizeWithAttributes:v6];
              if (v33 <= v53)
              {
                [v52 sizeWithAttributes:v6];
                double v33 = v54;
              }
            }
            uint64_t v49 = [v47 countByEnumeratingWithState:&v60 objects:v84 count:16];
          }
          while (v49);
        }
      }
      uint64_t v43 = [v41 countByEnumeratingWithState:&v64 objects:v85 count:16];
    }
    while (v43);
  }

  uint64_t v55 = [NSNumber numberWithDouble:v10];
  [v59 setObject:v55 forKeyedSubscript:@"DaysFullWidth"];

  uint64_t v56 = [NSNumber numberWithDouble:v9];
  [v59 setObject:v56 forKeyedSubscript:@"HoursFullWidth"];

  unint64_t v57 = [NSNumber numberWithDouble:v34];
  [v59 setObject:v57 forKeyedSubscript:@"DaysShortWidth"];

  long long v58 = [NSNumber numberWithDouble:v33];
  [v59 setObject:v58 forKeyedSubscript:@"HoursShortWidth"];
}

- (id)concatenateStrings:(id)a3 joinedByString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62___MKLocalizedHoursBuilder_concatenateStrings_joinedByString___block_invoke;
  v12[3] = &unk_1E54B8448;
  v12[4] = &v13;
  double v7 = (void (**)(void))MEMORY[0x18C139AE0](v12);
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    v7[2](v7);
  }
  else {
    dispatch_sync(MEMORY[0x1E4F14428], v7);
  }
  if (*((unsigned char *)v14 + 24))
  {
    uint64_t v8 = [v5 reverseObjectEnumerator];
    uint64_t v9 = [v8 allObjects];

    id v5 = (id)v9;
  }
  double v10 = [v5 componentsJoinedByString:v6];

  _Block_object_dispose(&v13, 8);

  return v10;
}

- (NSArray)AMPMSymbols
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
  id v3 = [(id)qword_1EB316088 AMSymbol];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    id v5 = [(id)qword_1EB316088 AMSymbol];
    [v2 addObject:v5];
  }
  id v6 = [(id)qword_1EB316088 PMSymbol];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    uint64_t v8 = [(id)qword_1EB316088 PMSymbol];
    [v2 addObject:v8];
  }
  uint64_t v9 = (void *)[v2 copy];

  return (NSArray *)v9;
}

- (void)setCompareDate:(id)a3
{
}

- (unint64_t)geoMapItemOpeningHourOptions
{
  return self->_geoMapItemOpeningHourOptions;
}

- (unint64_t)localizedHoursStringOptions
{
  return self->_localizedHoursStringOptions;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (GEOBusinessHours)operatingHours
{
  return self->_operatingHours;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operatingHours, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_compareDate, 0);
  objc_storeStrong((id *)&self->_hoursStateLabelColor, 0);
  objc_storeStrong((id *)&self->_localizedOpenState, 0);
  objc_storeStrong((id *)&self->_localizedOperatingHours, 0);

  objc_storeStrong((id *)&self->_openAt, 0);
}

@end