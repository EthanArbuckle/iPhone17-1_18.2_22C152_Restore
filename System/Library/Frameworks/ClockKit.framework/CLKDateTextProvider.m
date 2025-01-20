@interface CLKDateTextProvider
+ (BOOL)supportsSecureCoding;
+ (CLKDateTextProvider)textProviderWithDate:(NSDate *)date units:(NSCalendarUnit)calendarUnits;
+ (CLKDateTextProvider)textProviderWithDate:(NSDate *)date units:(NSCalendarUnit)calendarUnits timeZone:(NSTimeZone *)timeZone;
- (BOOL)_validate;
- (BOOL)allowsNarrowUnits;
- (BOOL)isEqual:(id)a3;
- (BOOL)narrowStandaloneWeekdayDay;
- (BOOL)shortUnits;
- (BOOL)uppercase;
- (CLKDateTextProvider)initWithCoder:(id)a3;
- (CLKDateTextProvider)initWithDate:(NSDate *)date units:(NSCalendarUnit)calendarUnits;
- (CLKDateTextProvider)initWithDate:(NSDate *)date units:(NSCalendarUnit)calendarUnits timeZone:(NSTimeZone *)timeZone;
- (NSCalendarUnit)calendarUnits;
- (NSDate)date;
- (NSString)alternateCalendarLocaleID;
- (NSTimeZone)timeZone;
- (id)JSONObjectRepresentation;
- (id)_completeDateTemplateSeries;
- (id)_initWithJSONObjectRepresentation:(id)a3;
- (id)_partialDateTemplateSeriesForUnits:(unint64_t)a3;
- (id)_sessionAttributedTextForIndex:(unint64_t)a3 withStyle:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)formattingContext;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowsNarrowUnits:(BOOL)a3;
- (void)setAlternateCalendarLocaleID:(id)a3;
- (void)setCalendarUnits:(NSCalendarUnit)calendarUnits;
- (void)setDate:(NSDate *)date;
- (void)setFormattingContext:(int64_t)a3;
- (void)setNarrowStandaloneWeekdayDay:(BOOL)a3;
- (void)setShortUnits:(BOOL)a3;
- (void)setTimeZone:(NSTimeZone *)timeZone;
- (void)setUppercase:(BOOL)uppercase;
@end

@implementation CLKDateTextProvider

- (CLKDateTextProvider)initWithDate:(NSDate *)date units:(NSCalendarUnit)calendarUnits
{
  return [(CLKDateTextProvider *)self initWithDate:date units:calendarUnits timeZone:0];
}

- (CLKDateTextProvider)initWithDate:(NSDate *)date units:(NSCalendarUnit)calendarUnits timeZone:(NSTimeZone *)timeZone
{
  v8 = date;
  v9 = timeZone;
  v13.receiver = self;
  v13.super_class = (Class)CLKDateTextProvider;
  v10 = [(CLKTextProvider *)&v13 initPrivate];
  v11 = v10;
  if (v10)
  {
    [(CLKDateTextProvider *)v10 setDate:v8];
    [(CLKDateTextProvider *)v11 setCalendarUnits:calendarUnits];
    [(CLKDateTextProvider *)v11 setTimeZone:v9];
    [(CLKDateTextProvider *)v11 setFormattingContext:2];
  }

  return v11;
}

+ (CLKDateTextProvider)textProviderWithDate:(NSDate *)date units:(NSCalendarUnit)calendarUnits
{
  return (CLKDateTextProvider *)[a1 textProviderWithDate:date units:calendarUnits timeZone:0];
}

+ (CLKDateTextProvider)textProviderWithDate:(NSDate *)date units:(NSCalendarUnit)calendarUnits timeZone:(NSTimeZone *)timeZone
{
  v8 = timeZone;
  v9 = date;
  v10 = (void *)[objc_alloc((Class)a1) initWithDate:v9 units:calendarUnits timeZone:v8];

  return (CLKDateTextProvider *)v10;
}

- (id)_sessionAttributedTextForIndex:(unint64_t)a3 withStyle:(id)a4
{
  id v6 = a4;
  if (!self->_date) {
    goto LABEL_14;
  }
  if (!self->_dateFormatter)
  {
    v7 = (NSDateFormatter *)objc_opt_new();
    dateFormatter = self->_dateFormatter;
    self->_dateFormatter = v7;

    if (self->_timeZone) {
      -[NSDateFormatter setTimeZone:](self->_dateFormatter, "setTimeZone:");
    }
    if ([(NSString *)self->_alternateCalendarLocaleID length])
    {
      v9 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:self->_alternateCalendarLocaleID];
      [(NSDateFormatter *)self->_dateFormatter setLocale:v9];

      [(NSDateFormatter *)self->_dateFormatter setDateStyle:2];
    }
    [(NSDateFormatter *)self->_dateFormatter setFormattingContext:self->_formattingContext];
  }
  templateSeries = self->_templateSeries;
  if (!templateSeries)
  {
    v11 = [(CLKDateTextProvider *)self _completeDateTemplateSeries];
    v12 = self->_templateSeries;
    self->_templateSeries = v11;

    templateSeries = self->_templateSeries;
  }
  if ([(NSArray *)templateSeries count] <= a3)
  {
LABEL_14:
    id v14 = 0;
    goto LABEL_38;
  }
  objc_super v13 = [(NSArray *)self->_templateSeries objectAtIndex:a3];
  if (![v13 isEqualToString:@"d"])
  {
    if (!_isWeekdayDayTemplate(v13)) {
      goto LABEL_18;
    }
    v15 = [MEMORY[0x263EFF960] currentLocale];
    v16 = [v15 objectForKey:*MEMORY[0x263EFF508]];

    LODWORD(v15) = [v16 isEqualToString:@"en"];
    if (!v15) {
      goto LABEL_18;
    }
LABEL_17:
    [(NSDateFormatter *)self->_dateFormatter setDateFormat:v13];
    goto LABEL_19;
  }
  if (CLKIsCurrentLocaleCJK()) {
    goto LABEL_17;
  }
LABEL_18:
  [(NSDateFormatter *)self->_dateFormatter setLocalizedDateFormatFromTemplate:v13];
LABEL_19:
  v17 = [(NSDateFormatter *)self->_dateFormatter stringFromDate:self->_date];
  id v18 = v13;
  v19 = [@"MMMMM" stringByAppendingString:@"d"];
  int v20 = [v18 isEqualToString:v19];

  if (v20 && (CLKIsCurrentLocaleCJK() & 1) != 0)
  {
    char v21 = 1;
  }
  else
  {
    id v22 = v17;
    v17 = v22;
    if (_isWeekdayDayTemplate(v18))
    {
      v17 = v22;
      if (CLKRemovesPunctuationFromWeekdayDay())
      {
        if (!_removePunctationIfNecessaryFromTextForTemplate_punctuationExceptDash)
        {
          v23 = [MEMORY[0x263F089C0] punctuationCharacterSet];
          [v23 removeCharactersInString:@"-"];
          v24 = (void *)_removePunctationIfNecessaryFromTextForTemplate_punctuationExceptDash;
          _removePunctationIfNecessaryFromTextForTemplate_punctuationExceptDash = (uint64_t)v23;
        }
        v25 = objc_msgSend(v22, "componentsSeparatedByCharactersInSet:");
        v17 = [v25 componentsJoinedByString:&stru_26CCC52F8];
      }
    }

    char v21 = 0;
  }
  if (([v6 uppercase] & 1) != 0 || self->_uppercase)
  {
    v26 = [MEMORY[0x263EFF960] currentLocale];
    uint64_t v27 = [v17 uppercaseStringWithLocale:v26];

    v17 = (void *)v27;
  }
  v28 = objc_opt_new();
  v29 = [v6 font];
  uint64_t v30 = *MEMORY[0x263F82270];
  [v28 setObject:v29 forKeyedSubscript:*MEMORY[0x263F82270]];

  v31 = [v6 otherAttributes];
  [v28 addEntriesFromDictionary:v31];

  if ([v6 shouldEmbedTintColors])
  {
    v32 = [(CLKTextProvider *)self tintColor];

    if (v32)
    {
      v33 = [(CLKTextProvider *)self tintColor];
      [v28 setObject:v33 forKeyedSubscript:*MEMORY[0x263F82278]];
    }
  }
  if (v21)
  {
    v46 = [v28 objectForKeyedSubscript:v30];
    v34 = (void *)[v28 mutableCopy];
    [v46 pointSize];
    v36 = [v46 fontWithSize:v35 + -2.0];
    [v34 setObject:v36 forKeyedSubscript:v30];

    v37 = [(NSDateFormatter *)self->_dateFormatter _attributedStringWithFieldsFromDate:self->_date];
    id v38 = objc_alloc(MEMORY[0x263F089B8]);
    v39 = [v37 string];
    v40 = (void *)[v38 initWithString:v39];

    uint64_t v41 = [v37 length];
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __64__CLKDateTextProvider__sessionAttributedTextForIndex_withStyle___block_invoke;
    v47[3] = &unk_26440DB40;
    id v42 = v40;
    id v48 = v42;
    id v49 = v34;
    id v50 = v28;
    id v43 = v34;
    objc_msgSend(v37, "enumerateAttributesInRange:options:usingBlock:", 0, v41, 0, v47);
    v44 = v50;
    id v14 = v42;
  }
  else
  {
    id v14 = (id)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v17 attributes:v28];
  }

LABEL_38:

  return v14;
}

uint64_t __64__CLKDateTextProvider__sessionAttributedTextForIndex_withStyle___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = [a2 count];
  uint64_t v8 = 48;
  if (!v7) {
    uint64_t v8 = 40;
  }
  uint64_t v9 = *(void *)(a1 + v8);
  v10 = *(void **)(a1 + 32);

  return objc_msgSend(v10, "setAttributes:range:", v9, a3, a4);
}

- (BOOL)_validate
{
  v6.receiver = self;
  v6.super_class = (Class)CLKDateTextProvider;
  BOOL v3 = [(CLKTextProvider *)&v6 _validate];
  if (v3)
  {
    if (self->_date)
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      v4 = CLKLoggingObjectForDomain(10);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
        [(CLKTimeTextProvider *)(uint64_t)self _validate];
      }

      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)CLKDateTextProvider;
  v2 = [(CLKTextProvider *)&v4 description];

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CLKDateTextProvider;
  objc_super v4 = [(CLKTextProvider *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4 != self)
  {
    objc_storeStrong((id *)&v4->_date, self->_date);
    v5->_calendarUnits = self->_calendarUnits;
    objc_storeStrong((id *)&v5->_timeZone, self->_timeZone);
    v5->_shortUnits = self->_shortUnits;
    v5->_allowsNarrowUnits = self->_allowsNarrowUnits;
    v5->_narrowStandaloneWeekdayDay = self->_narrowStandaloneWeekdayDay;
    objc_storeStrong((id *)&v5->_alternateCalendarLocaleID, self->_alternateCalendarLocaleID);
    v5->_formattingContext = self->_formattingContext;
    v5->_uppercase = self->_uppercase;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4 = (void **)a3;
  v7.receiver = self;
  v7.super_class = (Class)CLKDateTextProvider;
  BOOL v5 = [(CLKTextProvider *)&v7 isEqual:v4]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && CLKEqualObjects(self->_date, v4[19])
    && CLKEqualObjects(self->_timeZone, v4[21])
    && (void *)self->_calendarUnits == v4[20]
    && self->_shortUnits == *((unsigned __int8 *)v4 + 145)
    && self->_allowsNarrowUnits == *((unsigned __int8 *)v4 + 146)
    && self->_narrowStandaloneWeekdayDay == *((unsigned __int8 *)v4 + 147)
    && CLKEqualObjects(self->_alternateCalendarLocaleID, v4[22])
    && self->_formattingContext == (void)v4[23];

  return v5;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)CLKDateTextProvider;
  BOOL v3 = [(CLKTextProvider *)&v7 hash];
  objc_super v4 = &v3[[(NSDate *)self->_date hash]];
  unint64_t v5 = (unint64_t)&v4[0x10000 * (unint64_t)self->_allowsNarrowUnits
                           + 256 * (unint64_t)self->_shortUnits
                           + 16 * self->_calendarUnits
                           + 4 * [(NSTimeZone *)self->_timeZone hash]];
  return v5
       + [(NSString *)self->_alternateCalendarLocaleID hash]
       + (self->_formattingContext << 17)
       + ((unint64_t)self->_narrowStandaloneWeekdayDay << 18);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLKDateTextProvider;
  id v4 = a3;
  [(CLKTextProvider *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_date, @"_date", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_calendarUnits forKey:@"_calendarUnits"];
  [v4 encodeObject:self->_timeZone forKey:@"_timeZone"];
  [v4 encodeBool:self->_shortUnits forKey:@"_shortUnits"];
  [v4 encodeBool:self->_allowsNarrowUnits forKey:@"_allowsNarrowUnits"];
  [v4 encodeBool:self->_narrowStandaloneWeekdayDay forKey:@"_narrowStandaloneWeekdayDay"];
  [v4 encodeObject:self->_alternateCalendarLocaleID forKey:@"_alternateCalendarLocaleID"];
  [v4 encodeInteger:self->_formattingContext forKey:@"_formattingContext"];
  [v4 encodeInteger:self->_formattingContext forKey:@"_formattingContext"];
  [v4 encodeBool:self->_uppercase forKey:@"_uppercase"];
}

- (CLKDateTextProvider)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CLKDateTextProvider;
  objc_super v5 = [(CLKTextProvider *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_date"];
    date = v5->_date;
    v5->_date = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_timeZone"];
    timeZone = v5->_timeZone;
    v5->_timeZone = (NSTimeZone *)v8;

    v5->_calendarUnits = [v4 decodeIntegerForKey:@"_calendarUnits"];
    v5->_shortUnits = [v4 decodeBoolForKey:@"_shortUnits"];
    v5->_allowsNarrowUnits = [v4 decodeBoolForKey:@"_allowsNarrowUnits"];
    v5->_narrowStandaloneWeekdayDay = [v4 decodeBoolForKey:@"_narrowStandaloneWeekdayDay"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_alternateCalendarLocaleID"];
    alternateCalendarLocaleID = v5->_alternateCalendarLocaleID;
    v5->_alternateCalendarLocaleID = (NSString *)v10;

    v5->_formattingContext = [v4 decodeIntegerForKey:@"_formattingContext"];
    v5->_uppercase = [v4 decodeBoolForKey:@"_uppercase"];
  }

  return v5;
}

- (id)_initWithJSONObjectRepresentation:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CLKDateTextProvider;
  objc_super v5 = [(CLKTextProvider *)&v15 _initWithJSONObjectRepresentation:v4];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"date"];
    uint64_t v7 = [objc_alloc(MEMORY[0x263EFF910]) initWithJSONObjectRepresentation:v6];
    uint64_t v8 = (void *)v5[19];
    v5[19] = v7;

    uint64_t v9 = [v4 objectForKeyedSubscript:@"calendarUnits"];
    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v5[20] = (int)[v9 intValue];
      }
    }
    uint64_t v10 = [v4 objectForKeyedSubscript:@"timeZone"];
    if (v10)
    {
      uint64_t v11 = [objc_alloc(MEMORY[0x263EFFA18]) initWithJSONObjectRepresentation:v10];
      v12 = (void *)v5[21];
      v5[21] = v11;
    }
    objc_super v13 = [v4 objectForKeyedSubscript:@"_uppercase"];
    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"value for key '%@' must be a number - invalid value: %@", @"_uppercase", v13 format];
      }
      *((unsigned char *)v5 + 144) = [v13 BOOLValue];
    }
  }
  return v5;
}

- (id)JSONObjectRepresentation
{
  v9.receiver = self;
  v9.super_class = (Class)CLKDateTextProvider;
  BOOL v3 = [(CLKTextProvider *)&v9 JSONObjectRepresentation];
  id v4 = [(NSDate *)self->_date JSONObjectRepresentation];
  [v3 setObject:v4 forKeyedSubscript:@"date"];

  objc_super v5 = [NSNumber numberWithUnsignedInteger:self->_calendarUnits];
  [v3 setObject:v5 forKeyedSubscript:@"calendarUnits"];

  uint64_t v6 = [(NSTimeZone *)self->_timeZone JSONObjectRepresentation];
  [v3 setObject:v6 forKeyedSubscript:@"timeZone"];

  uint64_t v7 = [NSNumber numberWithBool:self->_uppercase];
  [v3 setObject:v7 forKeyedSubscript:@"_uppercase"];

  return v3;
}

- (id)_completeDateTemplateSeries
{
  unint64_t calendarUnits = self->_calendarUnits;
  id v4 = [MEMORY[0x263EFF980] array];
  if ((calendarUnits & 0x21C) != 0) {
    uint64_t v5 = calendarUnits & 0x21C;
  }
  else {
    uint64_t v5 = 16;
  }
  do
  {
    uint64_t v6 = [(CLKDateTextProvider *)self _partialDateTemplateSeriesForUnits:v5];
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
  v28[3] = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = v5;
  if (a3 == 528)
  {
    if (self->_narrowStandaloneWeekdayDay)
    {
      uint64_t v7 = @"ccccc d";
    }
    else
    {
      if (!self->_shortUnits) {
        [v5 addObject:@"EEEE d"];
      }
      uint64_t v7 = @"EEE d";
    }
    [v6 addObject:v7];
    goto LABEL_41;
  }
  if ((~a3 & 0x208) == 0)
  {
    if (!self->_shortUnits)
    {
      v28[0] = @"MMMMEEEE";
      v28[1] = @"MMMMEEE";
      v28[2] = @"MMMEEEE";
      uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:3];
      [v6 addObjectsFromArray:v8];
    }
    [v6 addObject:@"MMMEEE"];
    if (self->_allowsNarrowUnits)
    {
      v27[0] = @"MMMEEEEEE";
      v27[1] = @"MMMMMEEE";
      objc_super v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:2];
      [v6 addObjectsFromArray:v9];
    }
    goto LABEL_25;
  }
  if ((a3 & 8) != 0)
  {
    if (!self->_shortUnits) {
      [v5 addObject:@"MMMM"];
    }
    [v6 addObject:@"MMM"];
    if (self->_allowsNarrowUnits)
    {
      uint64_t v10 = @"MMMMM";
      goto LABEL_24;
    }
  }
  else
  {
    if ((a3 & 0x200) == 0)
    {
      uint64_t v10 = &stru_26CCC52F8;
LABEL_24:
      [v6 addObject:v10];
      goto LABEL_25;
    }
    if (!self->_shortUnits) {
      [v5 addObject:@"EEEE"];
    }
    [v6 addObject:@"EEE"];
    if (self->_allowsNarrowUnits)
    {
      uint64_t v10 = @"EEEEEE";
      goto LABEL_24;
    }
  }
LABEL_25:
  if ((a3 & 0x10) == 0)
  {
    uint64_t v11 = &stru_26CCC52F8;
    if ((a3 & 4) == 0) {
      goto LABEL_33;
    }
LABEL_29:
    if (self->_alternateCalendarLocaleID) {
      v12 = @"U";
    }
    else {
      v12 = @"y";
    }
    uint64_t v13 = [(__CFString *)v11 stringByAppendingString:v12];

    uint64_t v11 = (__CFString *)v13;
    goto LABEL_33;
  }
  uint64_t v11 = [&stru_26CCC52F8 stringByAppendingString:@"d"];
  if ((a3 & 4) != 0) {
    goto LABEL_29;
  }
LABEL_33:
  id v14 = [MEMORY[0x263EFF980] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v15 = v6;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v15);
        }
        int v20 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "stringByAppendingString:", v11, (void)v22);
        [v14 addObject:v20];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v17);
  }

  uint64_t v6 = v14;
LABEL_41:

  return v6;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(NSDate *)date
{
}

- (NSCalendarUnit)calendarUnits
{
  return self->_calendarUnits;
}

- (void)setCalendarUnits:(NSCalendarUnit)calendarUnits
{
  self->_unint64_t calendarUnits = calendarUnits;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(NSTimeZone *)timeZone
{
}

- (BOOL)uppercase
{
  return self->_uppercase;
}

- (void)setUppercase:(BOOL)uppercase
{
  self->_uppercase = uppercase;
}

- (BOOL)shortUnits
{
  return self->_shortUnits;
}

- (void)setShortUnits:(BOOL)a3
{
  self->_shortUnits = a3;
}

- (BOOL)allowsNarrowUnits
{
  return self->_allowsNarrowUnits;
}

- (void)setAllowsNarrowUnits:(BOOL)a3
{
  self->_allowsNarrowUnits = a3;
}

- (BOOL)narrowStandaloneWeekdayDay
{
  return self->_narrowStandaloneWeekdayDay;
}

- (void)setNarrowStandaloneWeekdayDay:(BOOL)a3
{
  self->_narrowStandaloneWeekdayDay = a3;
}

- (NSString)alternateCalendarLocaleID
{
  return self->_alternateCalendarLocaleID;
}

- (void)setAlternateCalendarLocaleID:(id)a3
{
}

- (int64_t)formattingContext
{
  return self->_formattingContext;
}

- (void)setFormattingContext:(int64_t)a3
{
  self->_formattingContext = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateCalendarLocaleID, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_templateSeries, 0);

  objc_storeStrong((id *)&self->_dateFormatter, 0);
}

@end