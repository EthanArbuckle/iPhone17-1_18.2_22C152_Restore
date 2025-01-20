@interface GEOComposedStringArgument_Frequency
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (GEOComposedStringArgument_Frequency)initWithCoder:(id)a3;
- (double)overrideMaxValue;
- (double)overrideMinValue;
- (double)overrideValue;
- (id)_initWithGeoFormatArgument:(id)a3;
- (id)_replacementValueForFrequencyRange;
- (id)_replacementValueForFrequencyValue;
- (id)_stringReplacementWithOptions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setOverrideMaxValue:(double)a3;
- (void)setOverrideMinValue:(double)a3;
- (void)setOverrideValue:(double)a3;
@end

@implementation GEOComposedStringArgument_Frequency

- (id)_initWithGeoFormatArgument:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)GEOComposedStringArgument_Frequency;
  v5 = [(GEOComposedStringArgument *)&v24 _initWithGeoFormatArgument:v4];
  if (!v5)
  {
LABEL_16:
    v21 = 0;
    goto LABEL_13;
  }
  if ([v4 format] != 5 && objc_msgSend(v4, "format") != 6)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v23 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: geoFormatArgument.format == GEOFormatArgument_Formatter_FREQUENCY_VALUE || geoFormatArgument.format == GEOFormatArgument_Formatter_FREQUENCY_RANGE", v23, 2u);
    }
    goto LABEL_16;
  }
  int v6 = [v4 format];
  int v7 = [v4 hasValInt1];
  if (v6 != 5)
  {
    if (v7)
    {
      id v13 = objc_alloc(MEMORY[0x1E4F28E28]);
      double v14 = (double)[v4 valInt1];
      v15 = [MEMORY[0x1E4F29180] seconds];
      uint64_t v16 = [v13 initWithDoubleValue:v15 unit:v14];
      v17 = (void *)v5[6];
      v5[6] = v16;
    }
    if (![v4 hasValInt2]) {
      goto LABEL_12;
    }
    id v18 = objc_alloc(MEMORY[0x1E4F28E28]);
    double v19 = (double)[v4 valInt2];
    v10 = [MEMORY[0x1E4F29180] seconds];
    uint64_t v11 = [v18 initWithDoubleValue:v10 unit:v19];
    uint64_t v12 = 8;
    goto LABEL_11;
  }
  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F28E28]);
    double v9 = (double)[v4 valInt1];
    v10 = [MEMORY[0x1E4F29180] seconds];
    uint64_t v11 = [v8 initWithDoubleValue:v10 unit:v9];
    uint64_t v12 = 4;
LABEL_11:
    v20 = (void *)v5[v12];
    v5[v12] = v11;
  }
LABEL_12:
  v21 = v5;
LABEL_13:

  return v21;
}

- (double)overrideValue
{
  [(NSMeasurement *)self->_overrideValue doubleValue];
  return result;
}

- (void)setOverrideValue:(double)a3
{
  id v5 = objc_alloc(MEMORY[0x1E4F28E28]);
  id v8 = [MEMORY[0x1E4F29180] seconds];
  int v6 = (NSMeasurement *)[v5 initWithDoubleValue:v8 unit:a3];
  overrideValue = self->_overrideValue;
  self->_overrideValue = v6;
}

- (double)overrideMinValue
{
  [(NSMeasurement *)self->_overrideMinValue doubleValue];
  return result;
}

- (void)setOverrideMinValue:(double)a3
{
  id v5 = objc_alloc(MEMORY[0x1E4F28E28]);
  id v8 = [MEMORY[0x1E4F29180] seconds];
  int v6 = (NSMeasurement *)[v5 initWithDoubleValue:v8 unit:a3];
  overrideMinValue = self->_overrideMinValue;
  self->_overrideMinValue = v6;
}

- (double)overrideMaxValue
{
  [(NSMeasurement *)self->_overrideMaxValue doubleValue];
  return result;
}

- (void)setOverrideMaxValue:(double)a3
{
  id v5 = objc_alloc(MEMORY[0x1E4F28E28]);
  id v8 = [MEMORY[0x1E4F29180] seconds];
  int v6 = (NSMeasurement *)[v5 initWithDoubleValue:v8 unit:a3];
  overrideMaxValue = self->_overrideMaxValue;
  self->_overrideMaxValue = v6;
}

- (id)_stringReplacementWithOptions:(id)a3
{
  id v4 = a3;
  int v5 = [(GEOComposedStringArgument *)self type];
  if (v5 == 5)
  {
    int v6 = &OBJC_IVAR___GEOComposedStringArgument_Frequency__overrideValue;
  }
  else
  {
    int v6 = &OBJC_IVAR___GEOComposedStringArgument_Frequency__overrideMaxValue;
    if (!self->_overrideMinValue)
    {
      if (!v4 || !v4[9]) {
        goto LABEL_17;
      }
      goto LABEL_11;
    }
  }
  if (*(Class *)((char *)&self->super.super.isa + *v6))
  {
LABEL_13:
    if ([(GEOComposedStringArgument *)self type] == 5) {
      [(GEOComposedStringArgument_Frequency *)self _replacementValueForFrequencyValue];
    }
    else {
    id v8 = [(GEOComposedStringArgument_Frequency *)self _replacementValueForFrequencyRange];
    }
    goto LABEL_18;
  }
  if (v4 && v4[9])
  {
    if (v5 == 5)
    {
      int v7 = &OBJC_IVAR___GEOComposedStringArgument_Frequency__defaultValue;
LABEL_12:
      if (*(Class *)((char *)&self->super.super.isa + *v7)) {
        goto LABEL_13;
      }
      goto LABEL_17;
    }
LABEL_11:
    int v7 = &OBJC_IVAR___GEOComposedStringArgument_Frequency__defaultMaxValue;
    if (!self->_defaultMinValue) {
      goto LABEL_17;
    }
    goto LABEL_12;
  }
LABEL_17:
  id v8 = 0;
LABEL_18:

  return v8;
}

- (id)_replacementValueForFrequencyValue
{
  overrideValue = self->_overrideValue;
  if (overrideValue)
  {
    v3 = overrideValue;
    goto LABEL_4;
  }
  v3 = self->_defaultValue;
  if (v3)
  {
LABEL_4:
    [(NSMeasurement *)v3 doubleValue];
    uint64_t v5 = llround(v4 / 60.0);
    int v6 = objc_opt_new();
    int v7 = v6;
    if (v5 > 89 || v5 == 60)
    {
      [v6 setHour:v5 / 0x3CuLL];
      v5 %= 0x3CuLL;
    }
    else
    {
      [v6 setHour:0];
    }
    [v7 setMinute:v5];
    if ([v7 hour] != 1) {
      goto LABEL_35;
    }
    if (!v7)
    {
      [0 minute];
      goto LABEL_15;
    }
    if ([v7 hour] >= 1 && !objc_msgSend(v7, "minute"))
    {
      id v8 = +[GEOComposedString localizationProvider];
      uint64_t v14 = objc_msgSend(v8, "frequencySingleValue_OneHour");
    }
    else
    {
LABEL_35:
      if ([v7 minute] != 1 || !v7 || objc_msgSend(v7, "hour"))
      {
LABEL_15:
        id v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
        if (+[GEOComposedString hasLocalizationProvider])
        {
          double v9 = +[GEOComposedString localizationProvider];
          v10 = [v9 locale];
          [v8 setLocale:v10];
        }
        else
        {
          double v9 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
          [v8 setLocale:v9];
        }

        uint64_t v11 = objc_opt_new();
        [v11 setCalendar:v8];
        [v11 setFormattingContext:2];
        [v11 setZeroFormattingBehavior:14];
        [v11 setAllowedUnits:96];
        [v11 setMaximumUnitCount:2];
        if (v7 && [v7 hour] >= 1 && objc_msgSend(v7, "minute") > 0) {
          uint64_t v12 = 1;
        }
        else {
          uint64_t v12 = 2;
        }
        [v11 setUnitsStyle:v12];
        id v13 = [v11 stringFromDateComponents:v7];

        goto LABEL_27;
      }
      id v8 = +[GEOComposedString localizationProvider];
      uint64_t v14 = objc_msgSend(v8, "frequencySingleValue_OneMinute");
    }
    id v13 = (void *)v14;
LABEL_27:

    goto LABEL_28;
  }
  id v13 = 0;
LABEL_28:

  return v13;
}

- (id)_replacementValueForFrequencyRange
{
  overrideMinValue = self->_overrideMinValue;
  if (!overrideMinValue) {
    overrideMinValue = self->_defaultMinValue;
  }
  double v4 = overrideMinValue;
  overrideMaxValue = self->_overrideMaxValue;
  if (!overrideMaxValue) {
    overrideMaxValue = self->_defaultMaxValue;
  }
  int v6 = overrideMaxValue;
  int v7 = v6;
  if (v4) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    v30 = 0;
    goto LABEL_43;
  }
  double v9 = objc_opt_new();
  v10 = objc_opt_new();
  [(NSMeasurement *)v4 doubleValue];
  uint64_t v12 = llround(v11 / 60.0);
  [(NSMeasurement *)v7 doubleValue];
  uint64_t v14 = llround(v13 / 60.0);
  if (v12 > 89 || v14 > 89)
  {
    [v9 setHour:v12 / 60];
    [v9 setMinute:v12 % 60];
    [v10 setHour:v14 / 60];
    v14 %= 60;
  }
  else
  {
    [v9 setHour:0];
    [v10 setHour:0];
    [v9 setMinute:v12];
  }
  [v10 setMinute:v14];
  if (+[GEOComposedString hasLocalizationProvider])
  {
    v15 = +[GEOComposedString localizationProvider];
    uint64_t v16 = [v15 locale];
  }
  else
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  }
  if (!v9) {
    goto LABEL_33;
  }
  if ([v9 hour] < 1 || objc_msgSend(v9, "minute")) {
    goto LABEL_19;
  }
  if (!v10)
  {
    [v9 hour];
    goto LABEL_33;
  }
  if ([v10 hour] < 1) {
LABEL_19:
  }
    BOOL v17 = 0;
  else {
    BOOL v17 = [v10 minute] == 0;
  }
  if ([v9 hour] || !v10)
  {
    if (!v17) {
      goto LABEL_33;
    }
LABEL_26:
    double v19 = objc_opt_new();
    [v19 setLocale:v16];
    v26 = +[GEOComposedString localizationProvider];
    v21 = objc_msgSend(v26, "frequencyRange_BothOnlyHours");

    v27 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "hour"));
    v23 = [v19 stringFromNumber:v27];

    objc_super v24 = NSNumber;
    uint64_t v25 = [v10 hour];
    goto LABEL_27;
  }
  uint64_t v18 = [v10 hour];
  if (v17) {
    goto LABEL_26;
  }
  if (v18)
  {
LABEL_33:
    double v19 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    [v19 setLocale:v16];
    v28 = objc_opt_new();
    [v28 setCalendar:v19];
    [v28 setFormattingContext:2];
    [v28 setZeroFormattingBehavior:14];
    [v28 setAllowedUnits:96];
    [v28 setMaximumUnitCount:2];
    if (v9 && [v9 hour] >= 1 && objc_msgSend(v9, "minute") > 0
      || v10 && [v10 hour] >= 1 && objc_msgSend(v10, "minute") > 0)
    {
      uint64_t v31 = 1;
    }
    else
    {
      uint64_t v31 = 2;
    }
    [v28 setUnitsStyle:v31];
    v32 = +[GEOComposedString localizationProvider];
    v21 = objc_msgSend(v32, "frequencyRange_MixedUnits");

    v23 = [v28 stringFromDateComponents:v9];
    uint64_t v29 = [v28 stringFromDateComponents:v10];
    goto LABEL_42;
  }
  double v19 = objc_opt_new();
  [v19 setLocale:v16];
  v20 = +[GEOComposedString localizationProvider];
  v21 = objc_msgSend(v20, "frequencyRange_BothOnlyMinutes");

  v22 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "minute"));
  v23 = [v19 stringFromNumber:v22];

  objc_super v24 = NSNumber;
  uint64_t v25 = [v10 minute];
LABEL_27:
  v28 = [v24 numberWithInteger:v25];
  uint64_t v29 = [v19 stringFromNumber:v28];
LABEL_42:
  v33 = (void *)v29;

  uint64_t v35 = 0;
  v30 = [NSString localizedStringWithValidatedFormat:v21, @"%@%@", &v35, v23, v33 validFormatSpecifiers error];

LABEL_43:

  return v30;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v18.receiver = self;
  v18.super_class = (Class)GEOComposedStringArgument_Frequency;
  double v4 = [(GEOComposedStringArgument *)&v18 copyWithZone:a3];
  uint64_t v5 = [(NSMeasurement *)self->_defaultValue copy];
  int v6 = (void *)v4[4];
  v4[4] = v5;

  uint64_t v7 = [(NSMeasurement *)self->_overrideValue copy];
  BOOL v8 = (void *)v4[5];
  v4[5] = v7;

  uint64_t v9 = [(NSMeasurement *)self->_defaultMinValue copy];
  v10 = (void *)v4[6];
  v4[6] = v9;

  uint64_t v11 = [(NSMeasurement *)self->_overrideMinValue copy];
  uint64_t v12 = (void *)v4[7];
  v4[7] = v11;

  uint64_t v13 = [(NSMeasurement *)self->_defaultMaxValue copy];
  uint64_t v14 = (void *)v4[8];
  v4[8] = v13;

  uint64_t v15 = [(NSMeasurement *)self->_overrideMaxValue copy];
  uint64_t v16 = (void *)v4[9];
  v4[9] = v15;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOComposedStringArgument_Frequency;
  id v4 = a3;
  [(GEOComposedStringArgument *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_defaultValue, @"_defaultValue", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_overrideValue forKey:@"_overrideValue"];
  [v4 encodeObject:self->_defaultMinValue forKey:@"_defaultMinValue"];
  [v4 encodeObject:self->_overrideMinValue forKey:@"_overrideMinValue"];
  [v4 encodeObject:self->_defaultMaxValue forKey:@"_defaultMaxValue"];
  [v4 encodeObject:self->_overrideMaxValue forKey:@"_overrideMaxValue"];
}

- (GEOComposedStringArgument_Frequency)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)GEOComposedStringArgument_Frequency;
  objc_super v5 = [(GEOComposedStringArgument *)&v20 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_defaultValue"];
    defaultValue = v5->_defaultValue;
    v5->_defaultValue = (NSMeasurement *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_overrideValue"];
    overrideValue = v5->_overrideValue;
    v5->_overrideValue = (NSMeasurement *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_defaultMinValue"];
    defaultMinValue = v5->_defaultMinValue;
    v5->_defaultMinValue = (NSMeasurement *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_overrideMinValue"];
    overrideMinValue = v5->_overrideMinValue;
    v5->_overrideMinValue = (NSMeasurement *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_defaultMaxValue"];
    defaultMaxValue = v5->_defaultMaxValue;
    v5->_defaultMaxValue = (NSMeasurement *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_overrideMaxValue"];
    overrideMaxValue = v5->_overrideMaxValue;
    v5->_overrideMaxValue = (NSMeasurement *)v16;

    objc_super v18 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_super v5 = v4;
    v37.receiver = self;
    v37.super_class = (Class)GEOComposedStringArgument_Frequency;
    if (![(GEOComposedStringArgument *)&v37 isEqual:v5]) {
      goto LABEL_16;
    }
    uint64_t v6 = (void *)v5[4];
    unint64_t v7 = self->_defaultValue;
    unint64_t v8 = v6;
    if (v7 | v8)
    {
      uint64_t v9 = (void *)v8;
      int v10 = [(id)v7 isEqual:v8];

      if (!v10) {
        goto LABEL_16;
      }
    }
    uint64_t v11 = (void *)v5[5];
    unint64_t v12 = self->_overrideValue;
    unint64_t v13 = v11;
    if (v12 | v13)
    {
      uint64_t v14 = (void *)v13;
      int v15 = [(id)v12 isEqual:v13];

      if (!v15) {
        goto LABEL_16;
      }
    }
    uint64_t v16 = (void *)v5[6];
    unint64_t v17 = self->_defaultMinValue;
    unint64_t v18 = v16;
    if (v17 | v18)
    {
      double v19 = (void *)v18;
      int v20 = [(id)v17 isEqual:v18];

      if (!v20) {
        goto LABEL_16;
      }
    }
    v21 = (void *)v5[7];
    unint64_t v22 = self->_overrideMinValue;
    unint64_t v23 = v21;
    if (v22 | v23)
    {
      objc_super v24 = (void *)v23;
      int v25 = [(id)v22 isEqual:v23];

      if (!v25) {
        goto LABEL_16;
      }
    }
    v26 = (void *)v5[8];
    unint64_t v27 = self->_defaultMaxValue;
    unint64_t v28 = v26;
    if (!(v27 | v28)
      || (uint64_t v29 = (void *)v28, v30 = [(id)v27 isEqual:v28], v29, (id)v27, v30))
    {
      overrideMaxValue = self->_overrideMaxValue;
      uint64_t v32 = v5[9];
      id v33 = overrideMaxValue;
      v34 = v33;
      if ((unint64_t)v33 | v32) {
        char v35 = [v33 isEqual:v32];
      }
      else {
        char v35 = 1;
      }
    }
    else
    {
LABEL_16:
      char v35 = 0;
    }
  }
  else
  {
    char v35 = 0;
  }

  return v35;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideMaxValue, 0);
  objc_storeStrong((id *)&self->_defaultMaxValue, 0);
  objc_storeStrong((id *)&self->_overrideMinValue, 0);
  objc_storeStrong((id *)&self->_defaultMinValue, 0);
  objc_storeStrong((id *)&self->_overrideValue, 0);

  objc_storeStrong((id *)&self->_defaultValue, 0);
}

@end