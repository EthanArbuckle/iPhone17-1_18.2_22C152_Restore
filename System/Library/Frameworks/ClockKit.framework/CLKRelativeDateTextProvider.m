@interface CLKRelativeDateTextProvider
+ (BOOL)_configureComponentsFormatter:(id)a3 fallbackIndex:(unint64_t)a4 style:(int64_t)a5;
+ (BOOL)_configureRelativeFormatter:(id)a3 fallbackIndex:(unint64_t)a4 style:(int64_t)a5;
+ (BOOL)supportsSecureCoding;
+ (CLKRelativeDateTextProvider)textProviderWithDate:(NSDate *)date relativeToDate:(NSDate *)relativeToDate style:(CLKRelativeDateStyle)style units:(NSCalendarUnit)calendarUnits;
+ (CLKRelativeDateTextProvider)textProviderWithDate:(NSDate *)date style:(CLKRelativeDateStyle)style units:(NSCalendarUnit)calendarUnits;
- (BOOL)_timerIsPausedAtZero;
- (BOOL)_validate;
- (BOOL)disableOffsetPrefix;
- (BOOL)disableSmallCapUnits;
- (BOOL)isEqual:(id)a3;
- (BOOL)pauseTimerAtZero;
- (BOOL)showLeadingMinutes;
- (BOOL)shrinkUnitsInCJK;
- (BOOL)twoDigitMinuteZeroPadding;
- (BOOL)wantsSubseconds;
- (BOOL)wantsSubsecondsAsDashes;
- (CLKRelativeDateStyle)relativeDateStyle;
- (CLKRelativeDateTextProvider)initWithCoder:(id)a3;
- (CLKRelativeDateTextProvider)initWithDate:(NSDate *)date relativeToDate:(NSDate *)relativeDate style:(CLKRelativeDateStyle)style units:(NSCalendarUnit)calendarUnits;
- (CLKRelativeDateTextProvider)initWithDate:(NSDate *)date style:(CLKRelativeDateStyle)style units:(NSCalendarUnit)calendarUnits;
- (NSCalendarUnit)calendarUnits;
- (NSDate)date;
- (NSDate)overrideDate;
- (NSDate)relativeToDate;
- (id)JSONObjectRepresentation;
- (id)_componentsForDate:(id)a3 visibleUnits:(unint64_t *)a4;
- (id)_initWithJSONObjectRepresentation:(id)a3;
- (id)_sessionAttributedTextForIndex:(unint64_t)a3 withStyle:(id)a4;
- (id)_sessionCacheKey;
- (id)_signPrefixString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)_timePeriodForElapsedTime:(double)a3;
- (int64_t)_updateFrequency;
- (int64_t)tritiumDateStyle;
- (unint64_t)hash;
- (void)_configureFormatterForTimerStyle;
- (void)_endSession;
- (void)_startSessionWithDate:(id)a3;
- (void)_validate;
- (void)encodeWithCoder:(id)a3;
- (void)finalize;
- (void)setCalendarUnits:(NSCalendarUnit)calendarUnits;
- (void)setDate:(NSDate *)date;
- (void)setDisableOffsetPrefix:(BOOL)a3;
- (void)setDisableSmallCapUnits:(BOOL)a3;
- (void)setPauseTimerAtZero:(BOOL)a3;
- (void)setRelativeDateStyle:(CLKRelativeDateStyle)relativeDateStyle;
- (void)setRelativeToDate:(NSDate *)relativeToDate;
- (void)setShowLeadingMinutes:(BOOL)a3;
- (void)setShrinkUnitsInCJK:(BOOL)a3;
- (void)setTritiumDateStyle:(int64_t)a3;
- (void)setTwoDigitMinuteZeroPadding:(BOOL)a3;
- (void)setWantsSubseconds:(BOOL)a3;
- (void)setWantsSubsecondsAsDashes:(BOOL)a3;
@end

@implementation CLKRelativeDateTextProvider

- (CLKRelativeDateTextProvider)initWithDate:(NSDate *)date style:(CLKRelativeDateStyle)style units:(NSCalendarUnit)calendarUnits
{
  return [(CLKRelativeDateTextProvider *)self initWithDate:date relativeToDate:0 style:style units:calendarUnits];
}

- (CLKRelativeDateTextProvider)initWithDate:(NSDate *)date relativeToDate:(NSDate *)relativeDate style:(CLKRelativeDateStyle)style units:(NSCalendarUnit)calendarUnits
{
  v10 = date;
  v11 = relativeDate;
  v15.receiver = self;
  v15.super_class = (Class)CLKRelativeDateTextProvider;
  v12 = [(CLKTextProvider *)&v15 initPrivate];
  v13 = v12;
  if (v12)
  {
    [(CLKRelativeDateTextProvider *)v12 setDate:v10];
    [(CLKRelativeDateTextProvider *)v13 setRelativeToDate:v11];
    [(CLKRelativeDateTextProvider *)v13 setRelativeDateStyle:style];
    [(CLKRelativeDateTextProvider *)v13 setCalendarUnits:calendarUnits];
    [(CLKTextProvider *)v13 setTimeTravelUpdateFrequency:2 * (v13->_relativeToDate == 0)];
    [(CLKRelativeDateTextProvider *)v13 setTritiumDateStyle:5];
  }

  return v13;
}

+ (CLKRelativeDateTextProvider)textProviderWithDate:(NSDate *)date style:(CLKRelativeDateStyle)style units:(NSCalendarUnit)calendarUnits
{
  return (CLKRelativeDateTextProvider *)[a1 textProviderWithDate:date relativeToDate:0 style:style units:calendarUnits];
}

+ (CLKRelativeDateTextProvider)textProviderWithDate:(NSDate *)date relativeToDate:(NSDate *)relativeToDate style:(CLKRelativeDateStyle)style units:(NSCalendarUnit)calendarUnits
{
  v10 = relativeToDate;
  v11 = date;
  v12 = (void *)[objc_alloc((Class)a1) initWithDate:v11 relativeToDate:v10 style:style units:calendarUnits];

  return (CLKRelativeDateTextProvider *)v12;
}

- (NSDate)overrideDate
{
  return self->_relativeToDate;
}

- (void)_startSessionWithDate:(id)a3
{
  v4 = (NSDate *)a3;
  relativeToDate = self->_relativeToDate;
  v11 = v4;
  if (relativeToDate)
  {
    v6 = relativeToDate;

    v11 = v6;
  }
  v7 = [(CLKRelativeDateTextProvider *)self date];
  [v7 timeIntervalSinceDate:v11];
  self->_elapsedTime = v8;

  self->_sessionTimePeriod = [(CLKRelativeDateTextProvider *)self _timePeriodForElapsedTime:self->_elapsedTime];
  v9 = [(CLKRelativeDateTextProvider *)self _componentsForDate:v11 visibleUnits:&self->_sessionVisibleUnits];
  sessionComponents = self->_sessionComponents;
  self->_sessionComponents = v9;

  self->_sessionInProgress = 1;
}

- (void)finalize
{
  if (self->_relativeDateStyle == 2) {
    self->_calendarUnits = 224;
  }
  v2.receiver = self;
  v2.super_class = (Class)CLKRelativeDateTextProvider;
  [(CLKTextProvider *)&v2 finalize];
}

- (id)_sessionCacheKey
{
  sessionCacheKey = self->_sessionCacheKey;
  if (!sessionCacheKey)
  {
    v4 = [MEMORY[0x263F089D8] string];
    unint64_t sessionVisibleUnits = self->_sessionVisibleUnits;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __47__CLKRelativeDateTextProvider__sessionCacheKey__block_invoke;
    v10[3] = &unk_26440E438;
    v10[4] = self;
    id v6 = v4;
    id v11 = v6;
    _EnumerateCalendarUnitsBackwardWithBlock(sessionVisibleUnits, (uint64_t)v10);
    if (self->_relativeDateStyle == 1) {
      objc_msgSend(v6, "appendFormat:", @"%ld", self->_sessionTimePeriod);
    }
    v7 = self->_sessionCacheKey;
    self->_sessionCacheKey = (NSString *)v6;
    id v8 = v6;

    sessionCacheKey = self->_sessionCacheKey;
  }

  return sessionCacheKey;
}

void __47__CLKRelativeDateTextProvider__sessionCacheKey__block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 144) valueForComponent:a2];
  int v5 = [*(id *)(a1 + 32) _timerIsPausedAtZero];
  id v6 = *(void **)(a1 + 40);
  if (a2 > 63)
  {
    if (a2 > 4095)
    {
      if (a2 == 4096)
      {
        v7 = @"wk";
        goto LABEL_21;
      }
      if (a2 == 0x8000)
      {
        v7 = @"ss";
        goto LABEL_21;
      }
    }
    else
    {
      if (a2 == 64)
      {
        v7 = @"min";
        goto LABEL_21;
      }
      if (a2 == 128)
      {
        v7 = @"sec";
        goto LABEL_21;
      }
    }
  }
  else if (a2 > 15)
  {
    if (a2 == 16)
    {
      v7 = @"day";
      goto LABEL_21;
    }
    if (a2 == 32)
    {
      v7 = @"hr";
      goto LABEL_21;
    }
  }
  else
  {
    if (a2 == 4)
    {
      v7 = @"yr";
      goto LABEL_21;
    }
    if (a2 == 8)
    {
      v7 = @"mo";
      goto LABEL_21;
    }
  }
  v7 = @"?";
LABEL_21:
  unint64_t v8 = v4 / 0x989680;
  if (a2 != 0x8000) {
    unint64_t v8 = v4;
  }
  if (v5) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = v8;
  }
  id v10 = [NSNumber numberWithInteger:v9];
  [v6 appendFormat:@"%@%@", v7, v10];
}

- (id)_sessionAttributedTextForIndex:(unint64_t)a3 withStyle:(id)a4
{
  v78[1] = *MEMORY[0x263EF8340];
  id v75 = a4;
  if (!self->_date) {
    goto LABEL_48;
  }
  if (!self->_sessionInProgress)
  {
    id v6 = CLKLoggingObjectForDomain(4);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CLKRelativeDateTextProvider _sessionAttributedTextForIndex:withStyle:](v6);
    }
  }
  int64_t relativeDateStyle = self->_relativeDateStyle;
  unint64_t sessionVisibleUnits = self->_sessionVisibleUnits;
  BOOL disableSmallCapUnits = self->_disableSmallCapUnits;
  if (relativeDateStyle == 2)
  {
    int v10 = self->_wantsSubseconds || self->_twoDigitMinuteZeroPadding;
    LODWORD(v15) = 0;
    BOOL wantsSubsecondsAsDashes = self->_wantsSubsecondsAsDashes;
    v17 = 0;
    int v18 = 0;
    switch(a3)
    {
      case 0uLL:
        int v18 = 0;
        LODWORD(v15) = self->_wantsSubseconds;
        goto LABEL_25;
      case 1uLL:
        goto LABEL_25;
      case 2uLL:
        LODWORD(v15) = 0;
        int v18 = 1;
        goto LABEL_25;
      case 3uLL:
        if (self->_showLeadingMinutes
          || [(NSDateComponents *)self->_sessionComponents hour]
          || [(NSDateComponents *)self->_sessionComponents minute]
          || !self->_sessionComponents)
        {
          LODWORD(v15) = 0;
        }
        else
        {
          [(CLKRelativeDateTextProvider *)self _configureFormatterForTimerStyle];
          [(NSDateComponentsFormatter *)self->_formatter setAllowedUnits:sessionVisibleUnits & 0xFFFFFFFFFFFF7FFFLL];
          uint64_t v15 = [(NSDateComponentsFormatter *)self->_formatter stringFromDateComponents:self->_sessionComponents];
          if (v15) {
            goto LABEL_45;
          }
        }
        int v18 = 0;
LABEL_25:
        double elapsedTime = self->_elapsedTime;
        if (elapsedTime >= 0.0) {
          double v20 = self->_elapsedTime;
        }
        else {
          double v20 = -elapsedTime;
        }
        if ([(CLKRelativeDateTextProvider *)self _timerIsPausedAtZero]) {
          double v20 = 0.0;
        }
        if (!self->_relativeToDate && v20 * 1000.0 <= 1.84467441e19)
        {
          int v21 = _TimeAdjustedForDigitalDisplay_leastSignificantDigits[(121 * ((unint64_t)(v20 * 1000.0) % 0x64)) >> 12];
          double v20 = (double)(unint64_t)((double)(int)(10 * (arc4random_uniform(3u) + v21)) + floor(v20 * 10.0)
                                                                                              * 100.0)
              / 1000.0;
        }
        char v22 = v15 ^ 1;
        if (!wantsSubsecondsAsDashes) {
          char v22 = 1;
        }
        if (v22) {
          CLKFormatTimeIntervalSeconds(0, 0, v15, 1, v10, v18, v20);
        }
        else {
        uint64_t v15 = CLKFormatTimeIntervalSecondsForLowerFidelity(0, 0, v20 < 3600.0, 1, 1, 0, v20);
        }
        if (!v15) {
          goto LABEL_39;
        }
        goto LABEL_45;
      case 4uLL:
        goto LABEL_94;
      default:
        int v18 = 0;
        goto LABEL_25;
    }
  }
  if ((relativeDateStyle & 0xFFFFFFFFFFFFFFFELL) == 6)
  {
    relativeDateTimeFormatter = self->_relativeDateTimeFormatter;
    if (!relativeDateTimeFormatter)
    {
      v12 = (NSRelativeDateTimeFormatter *)objc_alloc_init(MEMORY[0x263F08AF8]);
      v13 = self->_relativeDateTimeFormatter;
      self->_relativeDateTimeFormatter = v12;

      relativeDateTimeFormatter = self->_relativeDateTimeFormatter;
    }
    if (+[CLKRelativeDateTextProvider _configureRelativeFormatter:relativeDateTimeFormatter fallbackIndex:a3 style:relativeDateStyle]&& self->_sessionComponents)
    {
      uint64_t v14 = -[NSRelativeDateTimeFormatter localizedStringFromDateComponents:](self->_relativeDateTimeFormatter, "localizedStringFromDateComponents:");
      goto LABEL_44;
    }
LABEL_48:
    v17 = 0;
    goto LABEL_94;
  }
LABEL_39:
  formatter = self->_formatter;
  if (!formatter)
  {
    v24 = (NSDateComponentsFormatter *)objc_alloc_init(MEMORY[0x263F08780]);
    v25 = self->_formatter;
    self->_formatter = v24;

    formatter = self->_formatter;
  }
  if (!+[CLKRelativeDateTextProvider _configureComponentsFormatter:formatter fallbackIndex:a3 style:relativeDateStyle]|| !self->_sessionComponents)
  {
    goto LABEL_48;
  }
  [(NSDateComponentsFormatter *)self->_formatter setAllowedUnits:sessionVisibleUnits];
  uint64_t v14 = [(NSDateComponentsFormatter *)self->_formatter stringFromDateComponents:self->_sessionComponents];
LABEL_44:
  uint64_t v15 = v14;
LABEL_45:
  if (self->_relativeToDate || (sessionVisibleUnits & 0x80) == 0)
  {
    uint64_t v26 = [v75 font];
  }
  else
  {
    uint64_t v26 = [v75 monospacedDigitsFont];
  }
  v27 = (void *)v26;
  v28 = [(CLKTextProvider *)self fontFeatures];

  if (v28)
  {
    v29 = [(CLKTextProvider *)self fontFeatures];
    uint64_t v30 = [v27 CLKFontByApplyingFeatureSettings:v29];

    v27 = (void *)v30;
  }
  v31 = [MEMORY[0x263EFF960] currentLocale];
  v32 = [(id)v15 lowercaseStringWithLocale:v31];

  if (relativeDateStyle != 2 && !disableSmallCapUnits)
  {
    uint64_t v33 = [v27 CLKFontWithLocalizedLowerCaseSmallCaps];

    v34 = [MEMORY[0x263EFF960] currentLocale];
    uint64_t v35 = [v32 uppercaseStringWithLocale:v34];

    v27 = (void *)v33;
    v32 = (void *)v35;
  }
  CTFontSymbolicTraits SymbolicTraits = CTFontGetSymbolicTraits((CTFontRef)v27);
  BOOL v37 = CLKSmallCapsAllowed();
  if (v32) {
    BOOL v38 = v37;
  }
  else {
    BOOL v38 = 0;
  }
  if (relativeDateStyle == 2) {
    BOOL v38 = 0;
  }
  if (disableSmallCapUnits) {
    BOOL v38 = 0;
  }
  int v39 = v38 & SymbolicTraits;
  if (self->_shrinkUnitsInCJK) {
    int v40 = CLKIsCurrentLocaleCJK();
  }
  else {
    int v40 = 0;
  }
  int v41 = [v75 uppercase];
  if (disableSmallCapUnits) {
    int v42 = v41;
  }
  else {
    int v42 = 0;
  }
  int v43 = v42 | v39;
  v44 = [MEMORY[0x263EFF960] currentLocale];
  if (v43 == 1) {
    [v32 uppercaseStringWithLocale:v44];
  }
  else {
  uint64_t v45 = [v32 lowercaseStringWithLocale:v44];
  }

  BOOL v46 = relativeDateStyle == 1 && !self->_disableOffsetPrefix;
  if (v45) {
    BOOL v47 = v46;
  }
  else {
    BOOL v47 = 0;
  }
  if (v45) {
    v48 = (__CFString *)v45;
  }
  else {
    v48 = @"---";
  }
  uint64_t v49 = *MEMORY[0x263F82270];
  uint64_t v77 = *MEMORY[0x263F82270];
  v78[0] = v27;
  v50 = [NSDictionary dictionaryWithObjects:v78 forKeys:&v77 count:1];
  v51 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v48 attributes:v50];
  if ((v39 | v40) == 1)
  {
    BOOL v72 = v47;
    v73 = v50;
    v52 = [MEMORY[0x263F089C0] whitespaceAndNewlineCharacterSet];
    v53 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
    [v52 formUnionWithCharacterSet:v53];

    v74 = v48;
    v54 = [MEMORY[0x263F08B08] scannerWithString:v48];
    [v54 setCharactersToBeSkipped:v52];
    [v27 pointSize];
    double v56 = v55 + -2.0;
    double v57 = v55 * 0.75;
    if (v40) {
      double v57 = v56;
    }
    v58 = [v27 fontWithSize:v57];
    id v76 = 0;
    int v59 = [v54 scanUpToCharactersFromSet:v52 intoString:&v76];
    id v60 = v76;
    v61 = v60;
    if (v59)
    {
      do
      {
        uint64_t v62 = [v61 length];
        objc_msgSend(v51, "addAttribute:value:range:", v49, v58, objc_msgSend(v54, "scanLocation") - v62, v62);
        id v76 = v61;
        char v63 = [v54 scanUpToCharactersFromSet:v52 intoString:&v76];
        id v64 = v76;

        v61 = v64;
      }
      while ((v63 & 1) != 0);
    }
    else
    {
      id v64 = v60;
    }

    v50 = v73;
    v48 = v74;
    BOOL v47 = v72;
  }
  if (v47)
  {
    id v65 = objc_alloc(MEMORY[0x263F086A0]);
    v66 = [(CLKRelativeDateTextProvider *)self _signPrefixString];
    v67 = (void *)[v65 initWithString:v66 attributes:v50];

    [v51 insertAttributedString:v67 atIndex:0];
  }
  if ([v75 shouldEmbedTintColors])
  {
    v68 = [(CLKTextProvider *)self tintColor];

    if (v68)
    {
      uint64_t v69 = *MEMORY[0x263F82278];
      v70 = [(CLKTextProvider *)self tintColor];
      objc_msgSend(v51, "addAttribute:value:range:", v69, v70, 0, objc_msgSend(v51, "length"));
    }
  }
  v17 = [v51 _attributedStringWithOtherAttributesFromStyle:v75];

LABEL_94:

  return v17;
}

- (int64_t)_timePeriodForElapsedTime:(double)a3
{
  if (a3 >= 0.0) {
    return 3;
  }
  else {
    return 1;
  }
}

- (id)_signPrefixString
{
  uint64_t v3 = CLKLocaleCurrentNumberSystem();
  unint64_t v4 = &stru_26CCC52F8;
  int v5 = @"\u200F";
  if (v3 != 1) {
    int v5 = &stru_26CCC52F8;
  }
  int64_t sessionTimePeriod = self->_sessionTimePeriod;
  if (sessionTimePeriod == 3) {
    unint64_t v4 = @"−";
  }
  if (sessionTimePeriod == 1) {
    unint64_t v4 = @"+";
  }
  return (id)[NSString stringWithFormat:@"%@%@", v5, v4];
}

- (void)_endSession
{
  sessionComponents = self->_sessionComponents;
  self->_sessionComponents = 0;

  self->_unint64_t sessionVisibleUnits = 0;
  sessionCacheKey = self->_sessionCacheKey;
  self->_sessionCacheKey = 0;

  self->_sessionInProgress = 0;
}

- (BOOL)_validate
{
  v8.receiver = self;
  v8.super_class = (Class)CLKRelativeDateTextProvider;
  BOOL v3 = [(CLKTextProvider *)&v8 _validate];
  if (v3)
  {
    if (self->_date)
    {
      unint64_t calendarUnits = self->_calendarUnits;
      uint64_t v10 = 0;
      id v11 = &v10;
      uint64_t v12 = 0x2020000000;
      uint64_t v13 = 0;
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = ___HighestOrderUnit_block_invoke;
      v9[3] = &unk_26440E488;
      v9[4] = &v10;
      _EnumerateCalendarUnitsBackwardWithBlock(calendarUnits, (uint64_t)v9);
      uint64_t v5 = v11[3];
      _Block_object_dispose(&v10, 8);
      if (v5)
      {
        LOBYTE(v3) = 1;
        return v3;
      }
      id v6 = CLKLoggingObjectForDomain(10);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        [(CLKRelativeDateTextProvider *)(uint64_t)self _validate];
      }
    }
    else
    {
      id v6 = CLKLoggingObjectForDomain(10);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        [(CLKRelativeDateTextProvider *)(uint64_t)self _validate];
      }
    }

    LOBYTE(v3) = 0;
  }
  return v3;
}

- (int64_t)_updateFrequency
{
  if (self->_relativeToDate) {
    return 0;
  }
  if (self->_relativeDateStyle == 2 && self->_wantsSubseconds && !self->_wantsSubsecondsAsDashes) {
    return 3;
  }
  if ((self->_calendarUnits & 0x80) != 0)
  {
    uint64_t v6 = 0;
    unint64_t v4 = +[CLKDate complicationDate];
    id v5 = [(CLKRelativeDateTextProvider *)self _componentsForDate:v4 visibleUnits:&v6];

    if ((v6 & 0x80) != 0) {
      return 2;
    }
  }
  return 1;
}

- (id)_componentsForDate:(id)a3 visibleUnits:(unint64_t *)a4
{
  id v6 = a3;
  v7 = v6;
  unint64_t calendarUnits = self->_calendarUnits;
  BOOL wantsSubseconds = self->_wantsSubseconds;
  int64_t relativeDateStyle = self->_relativeDateStyle;
  switch(relativeDateStyle)
  {
    case 0:
    case 3:
    case 5:
      calendarUnits |= (calendarUnits >> 1) & 0x40;
      goto LABEL_8;
    case 2:
      if (self->_wantsSubseconds) {
        unint64_t calendarUnits = 32992;
      }
      else {
        unint64_t calendarUnits = 224;
      }
      goto LABEL_8;
    default:
      if ((relativeDateStyle & 0xFFFFFFFFFFFFFFFELL) == 6)
      {
        id v11 = v6;
        uint64_t v12 = self->_date;
      }
      else
      {
LABEL_8:
        id v11 = [v6 earlierDate:self->_date];
        uint64_t v12 = [v7 laterDate:self->_date];
      }
      uint64_t v13 = v12;
      uint64_t v14 = [MEMORY[0x263EFF8F0] currentCalendar];
      uint64_t v15 = [v14 components:calendarUnits fromDate:v11 toDate:v13 options:0];

      if (!wantsSubseconds)
      {
        [v15 setNanosecond:0];
        if ((calendarUnits & 0x80) == 0 && [v15 minute] >= 1) {
          [v15 setSecond:0];
        }
      }
      uint64_t v24 = 0;
      v25 = &v24;
      uint64_t v26 = 0x2020000000;
      uint64_t v27 = 0;
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __63__CLKRelativeDateTextProvider__componentsForDate_visibleUnits___block_invoke;
      v21[3] = &unk_26440E460;
      id v16 = v15;
      id v22 = v16;
      v23 = &v24;
      _EnumerateCalendarUnitsBackwardWithBlock(calendarUnits, (uint64_t)v21);
      unint64_t v17 = v25[3];
      if (v17)
      {
        if (!a4) {
          goto LABEL_26;
        }
      }
      else
      {
        uint64_t v38 = 0;
        int v39 = &v38;
        uint64_t v40 = 0x2020000000;
        uint64_t v41 = 0;
        uint64_t v28 = MEMORY[0x263EF8330];
        uint64_t v29 = 3221225472;
        uint64_t v30 = ___LowestOrderUnit_block_invoke;
        v31 = &unk_26440E488;
        v32 = &v38;
        _EnumerateCalendarUnitsWithBlock(calendarUnits, (uint64_t)&v28);
        unint64_t v17 = v39[3];
        _Block_object_dispose(&v38, 8);
        v25[3] = v17;
        if (!a4) {
          goto LABEL_26;
        }
      }
      switch(self->_relativeDateStyle)
      {
        case 0:
        case 3:
        case 5:
          uint64_t v38 = 0;
          int v39 = &v38;
          uint64_t v40 = 0x2020000000;
          uint64_t v41 = 0;
          v37[0] = 0;
          v37[1] = v37;
          v37[2] = 0x2020000000;
          v37[3] = 0;
          v36[0] = 0;
          v36[1] = v36;
          v36[2] = 0x2020000000;
          v36[3] = 0;
          uint64_t v28 = MEMORY[0x263EF8330];
          uint64_t v29 = 3221225472;
          uint64_t v30 = ___GetNeighboringUnits_block_invoke;
          v31 = &unk_26440E4B0;
          v32 = &v38;
          uint64_t v33 = v36;
          v34 = v37;
          unint64_t v35 = v17;
          _EnumerateCalendarUnitsWithBlock(calendarUnits, (uint64_t)&v28);
          uint64_t v18 = v39[3];
          _Block_object_dispose(v36, 8);
          _Block_object_dispose(v37, 8);
          _Block_object_dispose(&v38, 8);
          if ([v16 valueForComponent:v18] | (unsigned __int16)v18 & 0x80E0) {
            uint64_t v19 = v18;
          }
          else {
            uint64_t v19 = 0;
          }
          unint64_t v17 = v25[3] | v19;
          break;
        case 2:
          if (v17 == 32) {
            unint64_t v17 = calendarUnits;
          }
          else {
            unint64_t v17 = calendarUnits & 0xFFFFFFFFFFFFFFDFLL;
          }
          break;
        default:
          break;
      }
      *a4 = v17;
LABEL_26:

      _Block_object_dispose(&v24, 8);
      return v16;
  }
}

uint64_t __63__CLKRelativeDateTextProvider__componentsForDate_visibleUnits___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) valueForComponent:a2];
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
    *a3 = 1;
  }
  return result;
}

+ (BOOL)_configureComponentsFormatter:(id)a3 fallbackIndex:(unint64_t)a4 style:(int64_t)a5
{
  id v7 = a3;
  objc_super v8 = v7;
  BOOL v9 = 0;
  switch(a5)
  {
    case 0:
      ++a4;
      goto LABEL_4;
    case 1:
      goto LABEL_7;
    case 3:
      a4 += 2;
      goto LABEL_4;
    case 4:
      ++a4;
LABEL_7:
      [v7 setZeroFormattingBehavior:2];
      if (a4 >= 3) {
        goto LABEL_10;
      }
      unint64_t v10 = 3 - a4;
      uint64_t v11 = 1;
      goto LABEL_9;
    case 5:
LABEL_4:
      [v7 setZeroFormattingBehavior:2];
      if (a4 >= 4)
      {
LABEL_10:
        BOOL v9 = 0;
      }
      else
      {
        unint64_t v10 = qword_21C614530[a4];
        uint64_t v11 = qword_21C614550[a4];
LABEL_9:
        [v8 setUnitsStyle:v10];
        [v8 setMaximumUnitCount:v11];
        BOOL v9 = 1;
      }
LABEL_11:

      return v9;
    default:
      goto LABEL_11;
  }
}

+ (BOOL)_configureRelativeFormatter:(id)a3 fallbackIndex:(unint64_t)a4 style:(int64_t)a5
{
  id v7 = a3;
  objc_super v8 = v7;
  if (a5 == 7) {
    unint64_t v9 = a4 + 1;
  }
  else {
    unint64_t v9 = a4;
  }
  [v7 setDateTimeStyle:0];
  if (v9 <= 2) {
    [v8 setUnitsStyle:qword_21C614570[v9]];
  }

  return v9 < 3;
}

- (void)_configureFormatterForTimerStyle
{
  formatter = self->_formatter;
  if (!formatter)
  {
    unint64_t v4 = (NSDateComponentsFormatter *)objc_alloc_init(MEMORY[0x263F08780]);
    id v5 = self->_formatter;
    self->_formatter = v4;

    formatter = self->_formatter;
  }
  [(NSDateComponentsFormatter *)formatter setZeroFormattingBehavior:1];
  [(NSDateComponentsFormatter *)self->_formatter setUnitsStyle:0];
  id v6 = self->_formatter;

  [(NSDateComponentsFormatter *)v6 setMaximumUnitCount:1];
}

- (BOOL)_timerIsPausedAtZero
{
  return self->_elapsedTime < 0.0 && self->_pauseTimerAtZero && self->_relativeDateStyle == 2;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)CLKRelativeDateTextProvider;
  objc_super v2 = [(CLKTextProvider *)&v4 description];

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CLKRelativeDateTextProvider;
  objc_super v4 = [(CLKTextProvider *)&v7 copyWithZone:a3];
  id v5 = v4;
  if (v4 != self)
  {
    objc_storeStrong((id *)&v4->_date, self->_date);
    v5->_int64_t relativeDateStyle = self->_relativeDateStyle;
    v5->_unint64_t calendarUnits = self->_calendarUnits;
    objc_storeStrong((id *)&v5->_relativeToDate, self->_relativeToDate);
    v5->_twoDigitMinuteZeroPadding = self->_twoDigitMinuteZeroPadding;
    v5->_showLeadingMinutes = self->_showLeadingMinutes;
    v5->_BOOL wantsSubsecondsAsDashes = self->_wantsSubsecondsAsDashes;
    v5->_BOOL wantsSubseconds = self->_wantsSubseconds;
    v5->_BOOL disableSmallCapUnits = self->_disableSmallCapUnits;
    v5->_shrinkUnitsInCJK = self->_shrinkUnitsInCJK;
    v5->_disableOffsetPrefix = self->_disableOffsetPrefix;
    v5->_pauseTimerAtZero = self->_pauseTimerAtZero;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4 = (void **)a3;
  v7.receiver = self;
  v7.super_class = (Class)CLKRelativeDateTextProvider;
  BOOL v5 = [(CLKTextProvider *)&v7 isEqual:v4]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && CLKEqualObjects(self->_date, v4[25])
    && (void *)self->_relativeDateStyle == v4[27]
    && (void *)self->_calendarUnits == v4[28]
    && CLKEqualObjects(self->_relativeToDate, v4[26])
    && self->_twoDigitMinuteZeroPadding == *((unsigned __int8 *)v4 + 188)
    && self->_showLeadingMinutes == *((unsigned __int8 *)v4 + 189)
    && self->_wantsSubseconds == *((unsigned __int8 *)v4 + 190)
    && self->_wantsSubsecondsAsDashes == *((unsigned __int8 *)v4 + 191)
    && self->_disableSmallCapUnits == *((unsigned __int8 *)v4 + 185)
    && self->_shrinkUnitsInCJK == *((unsigned __int8 *)v4 + 186)
    && self->_disableOffsetPrefix == *((unsigned __int8 *)v4 + 187)
    && self->_pauseTimerAtZero == *((unsigned __int8 *)v4 + 192);

  return v5;
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)CLKRelativeDateTextProvider;
  id v3 = [(CLKTextProvider *)&v6 hash];
  unint64_t v4 = (unint64_t)v3
     + 16 * self->_calendarUnits
     + 4 * self->_relativeDateStyle
     + [(NSDate *)self->_date hash];
  return v4
       + ([(NSDate *)self->_relativeToDate hash] << 8)
       + ((unint64_t)self->_twoDigitMinuteZeroPadding << 9)
       + ((unint64_t)self->_showLeadingMinutes << 10)
       + ((unint64_t)self->_wantsSubseconds << 11)
       + ((unint64_t)self->_disableSmallCapUnits << 12)
       + ((unint64_t)self->_disableOffsetPrefix << 13)
       + ((unint64_t)self->_pauseTimerAtZero << 14)
       + ((unint64_t)self->_shrinkUnitsInCJK << 15);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLKRelativeDateTextProvider)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLKRelativeDateTextProvider;
  BOOL v5 = [(CLKTextProvider *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_date"];
    date = v5->_date;
    v5->_date = (NSDate *)v6;

    v5->_int64_t relativeDateStyle = [v4 decodeIntegerForKey:@"_style"];
    v5->_unint64_t calendarUnits = [v4 decodeIntegerForKey:@"_units"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_relativeToDate"];
    relativeToDate = v5->_relativeToDate;
    v5->_relativeToDate = (NSDate *)v8;

    v5->_twoDigitMinuteZeroPadding = [v4 decodeBoolForKey:@"_twoDigitiMinuteZeroPadding"];
    v5->_showLeadingMinutes = [v4 decodeBoolForKey:@"_showLeadingMinutes"];
    v5->_BOOL wantsSubseconds = [v4 decodeBoolForKey:@"_wantsSubseconds"];
    v5->_BOOL disableSmallCapUnits = [v4 decodeBoolForKey:@"_disableSmallCapUnits"];
    v5->_shrinkUnitsInCJK = [v4 decodeBoolForKey:@"_shrinkUnitsInCJK"];
    v5->_disableOffsetPrefix = [v4 decodeBoolForKey:@"_disableOffsetPrefix"];
    v5->_pauseTimerAtZero = [v4 decodeBoolForKey:@"_pauseTimerAtZero"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLKRelativeDateTextProvider;
  id v4 = a3;
  [(CLKTextProvider *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_date, @"_date", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_relativeDateStyle forKey:@"_style"];
  [v4 encodeInteger:self->_calendarUnits forKey:@"_units"];
  [v4 encodeObject:self->_relativeToDate forKey:@"_relativeToDate"];
  [v4 encodeBool:self->_twoDigitMinuteZeroPadding forKey:@"_twoDigitiMinuteZeroPadding"];
  [v4 encodeBool:self->_showLeadingMinutes forKey:@"_showLeadingMinutes"];
  [v4 encodeBool:self->_wantsSubseconds forKey:@"_wantsSubseconds"];
  [v4 encodeBool:self->_disableSmallCapUnits forKey:@"_disableSmallCapUnits"];
  [v4 encodeBool:self->_shrinkUnitsInCJK forKey:@"_shrinkUnitsInCJK"];
  [v4 encodeBool:self->_disableOffsetPrefix forKey:@"_disableOffsetPrefix"];
  [v4 encodeBool:self->_pauseTimerAtZero forKey:@"_pauseTimerAtZero"];
}

- (id)_initWithJSONObjectRepresentation:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CLKRelativeDateTextProvider;
  objc_super v5 = [(CLKTextProvider *)&v15 _initWithJSONObjectRepresentation:v4];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"date"];
    uint64_t v7 = [objc_alloc(MEMORY[0x263EFF910]) initWithJSONObjectRepresentation:v6];
    uint64_t v8 = (void *)v5[25];
    v5[25] = v7;

    unint64_t v9 = [v4 objectForKeyedSubscript:@"relativeToDate"];
    if (v9)
    {
      uint64_t v10 = [objc_alloc(MEMORY[0x263EFF910]) initWithJSONObjectRepresentation:v9];
      objc_super v11 = (void *)v5[26];
      v5[26] = v10;
    }
    uint64_t v12 = [v4 objectForKeyedSubscript:@"relativeDateStyle"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"value for key '%@' must be a number - invalid value: %@", @"relativeDateStyle", v12 format];
    }
    v5[27] = (int)[v12 intValue];
    uint64_t v13 = [v4 objectForKeyedSubscript:@"calendarUnits"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"value for key '%@' must be a number - invalid value: %@", @"calendarUnits", v13 format];
    }
    v5[28] = (int)[v13 intValue];
    [v5 setTimeTravelUpdateFrequency:2 * (v5[26] == 0)];
  }
  return v5;
}

- (id)JSONObjectRepresentation
{
  v10.receiver = self;
  v10.super_class = (Class)CLKRelativeDateTextProvider;
  id v3 = [(CLKTextProvider *)&v10 JSONObjectRepresentation];
  id v4 = [(NSDate *)self->_date JSONObjectRepresentation];
  [v3 setObject:v4 forKeyedSubscript:@"date"];

  objc_super v5 = [NSNumber numberWithInteger:self->_relativeDateStyle];
  [v3 setObject:v5 forKeyedSubscript:@"relativeDateStyle"];

  uint64_t v6 = [NSNumber numberWithUnsignedInteger:self->_calendarUnits];
  [v3 setObject:v6 forKeyedSubscript:@"calendarUnits"];

  relativeToDate = self->_relativeToDate;
  if (relativeToDate)
  {
    uint64_t v8 = [(NSDate *)relativeToDate JSONObjectRepresentation];
    [v3 setObject:v8 forKeyedSubscript:@"relativeToDate"];
  }

  return v3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(NSDate *)date
{
}

- (NSDate)relativeToDate
{
  return self->_relativeToDate;
}

- (void)setRelativeToDate:(NSDate *)relativeToDate
{
}

- (CLKRelativeDateStyle)relativeDateStyle
{
  return self->_relativeDateStyle;
}

- (void)setRelativeDateStyle:(CLKRelativeDateStyle)relativeDateStyle
{
  self->_int64_t relativeDateStyle = relativeDateStyle;
}

- (NSCalendarUnit)calendarUnits
{
  return self->_calendarUnits;
}

- (void)setCalendarUnits:(NSCalendarUnit)calendarUnits
{
  self->_unint64_t calendarUnits = calendarUnits;
}

- (BOOL)disableSmallCapUnits
{
  return self->_disableSmallCapUnits;
}

- (void)setDisableSmallCapUnits:(BOOL)a3
{
  self->_BOOL disableSmallCapUnits = a3;
}

- (BOOL)shrinkUnitsInCJK
{
  return self->_shrinkUnitsInCJK;
}

- (void)setShrinkUnitsInCJK:(BOOL)a3
{
  self->_shrinkUnitsInCJK = a3;
}

- (BOOL)disableOffsetPrefix
{
  return self->_disableOffsetPrefix;
}

- (void)setDisableOffsetPrefix:(BOOL)a3
{
  self->_disableOffsetPrefix = a3;
}

- (BOOL)twoDigitMinuteZeroPadding
{
  return self->_twoDigitMinuteZeroPadding;
}

- (void)setTwoDigitMinuteZeroPadding:(BOOL)a3
{
  self->_twoDigitMinuteZeroPadding = a3;
}

- (BOOL)showLeadingMinutes
{
  return self->_showLeadingMinutes;
}

- (void)setShowLeadingMinutes:(BOOL)a3
{
  self->_showLeadingMinutes = a3;
}

- (BOOL)wantsSubseconds
{
  return self->_wantsSubseconds;
}

- (void)setWantsSubseconds:(BOOL)a3
{
  self->_BOOL wantsSubseconds = a3;
}

- (BOOL)wantsSubsecondsAsDashes
{
  return self->_wantsSubsecondsAsDashes;
}

- (void)setWantsSubsecondsAsDashes:(BOOL)a3
{
  self->_BOOL wantsSubsecondsAsDashes = a3;
}

- (BOOL)pauseTimerAtZero
{
  return self->_pauseTimerAtZero;
}

- (void)setPauseTimerAtZero:(BOOL)a3
{
  self->_pauseTimerAtZero = a3;
}

- (int64_t)tritiumDateStyle
{
  return self->_tritiumDateStyle;
}

- (void)setTritiumDateStyle:(int64_t)a3
{
  self->_tritiumDateStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relativeToDate, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_sessionCacheKey, 0);
  objc_storeStrong((id *)&self->_sessionComponents, 0);
  objc_storeStrong((id *)&self->_relativeDateTimeFormatter, 0);

  objc_storeStrong((id *)&self->_formatter, 0);
}

- (void)_sessionAttributedTextForIndex:(NSObject *)a1 withStyle:.cold.1(NSObject *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  objc_super v2 = [MEMORY[0x263F08B88] callStackSymbols];
  int v3 = 138412290;
  id v4 = v2;
  _os_log_error_impl(&dword_21C599000, a1, OS_LOG_TYPE_ERROR, "CLKRelativeDateTextProvider _sessionAttributedTextForIndex:withStyle: called outside of session.\n%@", (uint8_t *)&v3, 0xCu);
}

- (void)_validate
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v3 = objc_opt_class();
  id v4 = v3;
  int v6 = 138412546;
  uint64_t v7 = v3;
  __int16 v8 = 2112;
  id v9 = (id)objc_opt_class();
  id v5 = v9;
  _os_log_fault_impl(&dword_21C599000, a2, OS_LOG_TYPE_FAULT, "Property ‘calendarUnits’ is empty on %@. This property must have at least one value when passing %@ to the complication data handler.", (uint8_t *)&v6, 0x16u);
}

@end