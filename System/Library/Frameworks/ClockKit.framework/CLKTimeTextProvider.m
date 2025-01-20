@interface CLKTimeTextProvider
+ (BOOL)supportsSecureCoding;
+ (CLKTimeTextProvider)textProviderWithDate:(NSDate *)date;
+ (CLKTimeTextProvider)textProviderWithDate:(NSDate *)date timeZone:(NSTimeZone *)timeZone;
- (BOOL)_validate;
- (BOOL)disallowBothMinutesAndDesignator;
- (BOOL)isEqual:(id)a3;
- (BOOL)prefersDesignatorToMinutes;
- (CLKTimeTextProvider)initWithCoder:(id)a3;
- (CLKTimeTextProvider)initWithDate:(NSDate *)date;
- (CLKTimeTextProvider)initWithDate:(NSDate *)date timeZone:(NSTimeZone *)timeZone;
- (NSDate)date;
- (NSTimeZone)timeZone;
- (id)JSONObjectRepresentation;
- (id)_initWithJSONObjectRepresentation:(id)a3;
- (id)_sessionAttributedTextForIndex:(unint64_t)a3 withStyle:(id)a4;
- (id)_timeAttributedTextWithStyle:(id)a3 dropMinutes:(BOOL)a4 dropDesignator:(BOOL)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)_validate;
- (void)encodeWithCoder:(id)a3;
- (void)setDate:(NSDate *)date;
- (void)setDisallowBothMinutesAndDesignator:(BOOL)a3;
- (void)setPrefersDesignatorToMinutes:(BOOL)a3;
- (void)setTimeZone:(NSTimeZone *)timeZone;
@end

@implementation CLKTimeTextProvider

- (CLKTimeTextProvider)initWithDate:(NSDate *)date
{
  return [(CLKTimeTextProvider *)self initWithDate:date timeZone:0];
}

- (CLKTimeTextProvider)initWithDate:(NSDate *)date timeZone:(NSTimeZone *)timeZone
{
  v6 = date;
  v7 = timeZone;
  v11.receiver = self;
  v11.super_class = (Class)CLKTimeTextProvider;
  v8 = [(CLKTextProvider *)&v11 initPrivate];
  v9 = v8;
  if (v8)
  {
    [(CLKTimeTextProvider *)v8 setDate:v6];
    [(CLKTimeTextProvider *)v9 setTimeZone:v7];
  }

  return v9;
}

+ (CLKTimeTextProvider)textProviderWithDate:(NSDate *)date
{
  return (CLKTimeTextProvider *)[a1 textProviderWithDate:date timeZone:0];
}

+ (CLKTimeTextProvider)textProviderWithDate:(NSDate *)date timeZone:(NSTimeZone *)timeZone
{
  v6 = timeZone;
  v7 = date;
  v8 = (void *)[objc_alloc((Class)a1) initWithDate:v7 timeZone:v6];

  return (CLKTimeTextProvider *)v8;
}

- (id)_sessionAttributedTextForIndex:(unint64_t)a3 withStyle:(id)a4
{
  id v6 = a4;
  v7 = [(CLKTimeTextProvider *)self date];

  if (v7)
  {
    if (CLKCurrentLocaleIs24HourMode())
    {
      BOOL v8 = 0;
    }
    else
    {
      v10 = [MEMORY[0x263EFF8F0] currentCalendar];
      objc_super v11 = [(CLKTimeTextProvider *)self date];
      v12 = [v10 components:64 fromDate:v11];
      BOOL v8 = [v12 minute] == 0;
    }
    sizingFallbackBlocks = self->_sizingFallbackBlocks;
    if (!sizingFallbackBlocks)
    {
      v14 = [MEMORY[0x263EFF980] array];
      v15 = self->_sizingFallbackBlocks;
      self->_sizingFallbackBlocks = v14;

      objc_initWeak(location, self);
      if (!self->_disallowBothMinutesAndDesignator)
      {
        v16 = self->_sizingFallbackBlocks;
        v40[0] = MEMORY[0x263EF8330];
        v40[1] = 3221225472;
        v40[2] = __64__CLKTimeTextProvider__sessionAttributedTextForIndex_withStyle___block_invoke;
        v40[3] = &unk_26440DB18;
        objc_copyWeak(&v41, location);
        v17 = (void *)MEMORY[0x21D4AACC0](v40);
        [(NSMutableArray *)v16 addObject:v17];

        objc_destroyWeak(&v41);
      }
      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      v38[2] = __64__CLKTimeTextProvider__sessionAttributedTextForIndex_withStyle___block_invoke_2;
      v38[3] = &unk_26440DB18;
      objc_copyWeak(&v39, location);
      v18 = (void *)[v38 copy];
      v19 = self->_sizingFallbackBlocks;
      v20 = (void *)MEMORY[0x21D4AACC0]();
      [(NSMutableArray *)v19 addObject:v20];

      if (v8)
      {
        uint64_t v33 = MEMORY[0x263EF8330];
        uint64_t v34 = 3221225472;
        v35 = __64__CLKTimeTextProvider__sessionAttributedTextForIndex_withStyle___block_invoke_3;
        v36 = &unk_26440DB18;
        objc_copyWeak(&v37, location);
        uint64_t v21 = MEMORY[0x21D4AACC0](&v33);
        v22 = (void *)v21;
        v23 = self->_sizingFallbackBlocks;
        if (self->_prefersDesignatorToMinutes)
        {
          v24 = (void *)MEMORY[0x21D4AACC0](v18);
          uint64_t v32 = [(NSMutableArray *)v23 indexOfObject:v24];

          v25 = self->_sizingFallbackBlocks;
          v26 = (void *)MEMORY[0x21D4AACC0](v22);
          [(NSMutableArray *)v25 insertObject:v26 atIndex:v32];
        }
        else
        {
          v26 = (void *)MEMORY[0x21D4AACC0](v21);
          [(NSMutableArray *)v23 addObject:v26];
        }

        objc_destroyWeak(&v37);
      }

      objc_destroyWeak(&v39);
      objc_destroyWeak(location);
      sizingFallbackBlocks = self->_sizingFallbackBlocks;
    }
    if ([(NSMutableArray *)sizingFallbackBlocks count] <= a3)
    {
      v9 = 0;
    }
    else
    {
      v27 = [(NSMutableArray *)self->_sizingFallbackBlocks objectAtIndexedSubscript:a3];
      v9 = ((void (**)(void, id))v27)[2](v27, v6);
    }
    if ([v6 shouldEmbedTintColors])
    {
      v28 = [(CLKTextProvider *)self tintColor];

      if (v28)
      {
        v29 = [(CLKTextProvider *)self tintColor];
        uint64_t v30 = [v9 _attributedStringWithForegroundColor:v29];

        v9 = (void *)v30;
      }
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id __64__CLKTimeTextProvider__sessionAttributedTextForIndex_withStyle___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = [WeakRetained _timeAttributedTextWithStyle:v3 dropMinutes:0 dropDesignator:0];

  return v5;
}

id __64__CLKTimeTextProvider__sessionAttributedTextForIndex_withStyle___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = [WeakRetained _timeAttributedTextWithStyle:v3 dropMinutes:0 dropDesignator:1];

  return v5;
}

id __64__CLKTimeTextProvider__sessionAttributedTextForIndex_withStyle___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = [WeakRetained _timeAttributedTextWithStyle:v3 dropMinutes:1 dropDesignator:0];

  return v5;
}

- (id)_timeAttributedTextWithStyle:(id)a3 dropMinutes:(BOOL)a4 dropDesignator:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v40[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (!self->_dateFormatter)
  {
    v9 = (NSDateFormatter *)objc_opt_new();
    dateFormatter = self->_dateFormatter;
    self->_dateFormatter = v9;

    if (self->_timeZone) {
      -[NSDateFormatter setTimeZone:](self->_dateFormatter, "setTimeZone:");
    }
  }
  objc_super v11 = &_CLKNoMinutesTimeFormatTemplate;
  if (!v6) {
    objc_super v11 = _CLKStandardTimeFormatTemplate;
  }
  v12 = *v11;
  v13 = (void *)MEMORY[0x263F08790];
  v14 = [MEMORY[0x263EFF960] currentLocale];
  v15 = [v13 dateFormatFromTemplate:v12 options:0 locale:v14];

  char v38 = 0;
  v16 = [(CLKTextProvider *)self _timeFormatByRemovingWhitespaceAroundDesignatorOfTimeFormat:v15 andRemovingDesignator:v5 designatorExists:&v38];

  [(NSDateFormatter *)self->_dateFormatter setDateFormat:v16];
  v17 = [v8 font];
  v18 = [(CLKTextProvider *)self fontFeatures];

  if (v18)
  {
    v19 = [(CLKTextProvider *)self fontFeatures];
    uint64_t v20 = [v17 CLKFontByApplyingFeatureSettings:v19];

    v17 = (void *)v20;
  }
  uint64_t v39 = *MEMORY[0x263F82270];
  v40[0] = v17;
  uint64_t v21 = [NSDictionary dictionaryWithObjects:v40 forKeys:&v39 count:1];
  v22 = self->_dateFormatter;
  v23 = [(CLKTimeTextProvider *)self date];
  v24 = [(NSDateFormatter *)v22 _attributedStringWithFieldsFromDate:v23];

  id v25 = objc_alloc(MEMORY[0x263F089B8]);
  v26 = [v24 string];
  v27 = (void *)[v25 initWithString:v26 attributes:v21];

  if (!v38 || v5)
  {
    id v31 = v27;
  }
  else
  {
    uint64_t v28 = [v24 length];
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __79__CLKTimeTextProvider__timeAttributedTextWithStyle_dropMinutes_dropDesignator___block_invoke;
    v34[3] = &unk_26440DB40;
    id v35 = v8;
    v36 = self;
    id v29 = v27;
    id v37 = v29;
    objc_msgSend(v24, "enumerateAttributesInRange:options:usingBlock:", 0, v28, 0, v34);
    id v30 = v29;
  }
  uint64_t v32 = [v27 _attributedStringWithOtherAttributesFromStyle:v8];

  return v32;
}

void __79__CLKTimeTextProvider__timeAttributedTextWithStyle_dropMinutes_dropDesignator___block_invoke(id *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v13 = [a2 objectForKeyedSubscript:*MEMORY[0x263EFF460]];
  if ([v13 hasPrefix:@"a"])
  {
    v7 = [a1[4] smallCapsBaseFont];
    id v8 = [a1[5] fontFeatures];

    if (v8)
    {
      v9 = [a1[5] fontFeatures];
      uint64_t v10 = [v7 CLKFontByApplyingFeatureSettings:v9];

      v7 = (void *)v10;
    }
    if (CTFontGetSymbolicTraits((CTFontRef)v7))
    {
      [v7 pointSize];
      [v7 fontWithSize:v11 * 0.75];
    }
    else
    {
      [v7 CLKFontWithLocalizedSmallCaps];
    v12 = };

    objc_msgSend(a1[6], "addAttribute:value:range:", *MEMORY[0x263F82270], v12, a3, a4);
  }
}

- (BOOL)_validate
{
  v7.receiver = self;
  v7.super_class = (Class)CLKTimeTextProvider;
  BOOL v3 = [(CLKTextProvider *)&v7 _validate];
  if (v3)
  {
    v4 = [(CLKTimeTextProvider *)self date];

    if (v4)
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      BOOL v5 = CLKLoggingObjectForDomain(10);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
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
  v4.super_class = (Class)CLKTimeTextProvider;
  v2 = [(CLKTextProvider *)&v4 description];

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CLKTimeTextProvider;
  objc_super v4 = [(CLKTextProvider *)&v8 copyWithZone:a3];
  if (v4 != self)
  {
    uint64_t v5 = [(CLKTimeTextProvider *)self date];
    date = v4->_date;
    v4->_date = (NSDate *)v5;

    objc_storeStrong((id *)&v4->_timeZone, self->_timeZone);
    v4->_disallowBothMinutesAndDesignator = self->_disallowBothMinutesAndDesignator;
    v4->_prefersDesignatorToMinutes = self->_prefersDesignatorToMinutes;
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4 = (void **)a3;
  v8.receiver = self;
  v8.super_class = (Class)CLKTimeTextProvider;
  if ([(CLKTextProvider *)&v8 isEqual:v4] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v5 = [(CLKTimeTextProvider *)self date];
    BOOL v6 = CLKEqualObjects(v5, v4[19])
      && CLKEqualObjects(self->_timeZone, v4[20])
      && self->_prefersDesignatorToMinutes == *((unsigned __int8 *)v4 + 145)
      && self->_disallowBothMinutesAndDesignator == *((unsigned __int8 *)v4 + 144);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  v12.receiver = self;
  v12.super_class = (Class)CLKTimeTextProvider;
  double v3 = (double)[(CLKTextProvider *)&v12 hash];
  objc_super v4 = [(CLKTimeTextProvider *)self date];
  double v5 = v3 + (double)(unint64_t)[v4 hash] * 100.0;
  unint64_t v6 = [(NSTimeZone *)self->_timeZone hash];
  unint64_t v7 = 0x408F400000000000;
  LOBYTE(v7) = self->_prefersDesignatorToMinutes;
  *(double *)&unint64_t v8 = (double)v7;
  double v9 = v5 + (double)v6 * 1000.0 + *(double *)&v8 * 10000.0;
  LOBYTE(v8) = self->_disallowBothMinutesAndDesignator;
  unint64_t v10 = (unint64_t)(v9 + (double)v8 * 100000.0);

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CLKTimeTextProvider;
  id v4 = a3;
  [(CLKTextProvider *)&v6 encodeWithCoder:v4];
  double v5 = [(CLKTimeTextProvider *)self date];
  [v4 encodeObject:v5 forKey:@"_date"];

  [v4 encodeObject:self->_timeZone forKey:@"_timeZone"];
  [v4 encodeBool:self->_disallowBothMinutesAndDesignator forKey:@"_disallowBothMinutesAndDesignator"];
  [v4 encodeBool:self->_prefersDesignatorToMinutes forKey:@"_prefersDesignatorToMinutes"];
}

- (CLKTimeTextProvider)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLKTimeTextProvider;
  double v5 = [(CLKTextProvider *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_date"];
    date = v5->_date;
    v5->_date = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_timeZone"];
    timeZone = v5->_timeZone;
    v5->_timeZone = (NSTimeZone *)v8;

    v5->_disallowBothMinutesAndDesignator = [v4 decodeBoolForKey:@"_disallowBothMinutesAndDesignator"];
    v5->_prefersDesignatorToMinutes = [v4 decodeBoolForKey:@"_prefersDesignatorToMinutes"];
  }

  return v5;
}

- (id)_initWithJSONObjectRepresentation:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CLKTimeTextProvider;
  double v5 = [(CLKTextProvider *)&v13 _initWithJSONObjectRepresentation:v4];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"date"];
    uint64_t v7 = [objc_alloc(MEMORY[0x263EFF910]) initWithJSONObjectRepresentation:v6];
    uint64_t v8 = (void *)v5[19];
    v5[19] = v7;

    double v9 = [v4 objectForKeyedSubscript:@"timeZone"];
    if (v9)
    {
      uint64_t v10 = [objc_alloc(MEMORY[0x263EFFA18]) initWithJSONObjectRepresentation:v9];
      objc_super v11 = (void *)v5[20];
      v5[20] = v10;
    }
  }

  return v5;
}

- (id)JSONObjectRepresentation
{
  v8.receiver = self;
  v8.super_class = (Class)CLKTimeTextProvider;
  double v3 = [(CLKTextProvider *)&v8 JSONObjectRepresentation];
  id v4 = [(CLKTimeTextProvider *)self date];
  double v5 = [v4 JSONObjectRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"date"];

  uint64_t v6 = [(NSTimeZone *)self->_timeZone JSONObjectRepresentation];
  [v3 setObject:v6 forKeyedSubscript:@"timeZone"];

  return v3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(NSDate *)date
{
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(NSTimeZone *)timeZone
{
}

- (BOOL)disallowBothMinutesAndDesignator
{
  return self->_disallowBothMinutesAndDesignator;
}

- (void)setDisallowBothMinutesAndDesignator:(BOOL)a3
{
  self->_disallowBothMinutesAndDesignator = a3;
}

- (BOOL)prefersDesignatorToMinutes
{
  return self->_prefersDesignatorToMinutes;
}

- (void)setPrefersDesignatorToMinutes:(BOOL)a3
{
  self->_prefersDesignatorToMinutes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_sizingFallbackBlocks, 0);

  objc_storeStrong((id *)&self->_dateFormatter, 0);
}

- (void)_validate
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  double v3 = objc_opt_class();
  id v4 = v3;
  int v6 = 138412802;
  uint64_t v7 = @"date";
  __int16 v8 = 2112;
  double v9 = v3;
  __int16 v10 = 2112;
  id v11 = (id)objc_opt_class();
  id v5 = v11;
  _os_log_fault_impl(&dword_21C599000, a2, OS_LOG_TYPE_FAULT, "Property '%@' is not set on %@. This property must not be nil when passing %@ to the complication data handler.", (uint8_t *)&v6, 0x20u);
}

@end