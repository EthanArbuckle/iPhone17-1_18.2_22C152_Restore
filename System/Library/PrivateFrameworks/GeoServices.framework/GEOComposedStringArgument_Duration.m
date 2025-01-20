@interface GEOComposedStringArgument_Duration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (GEOComposedStringArgument_Duration)initWithCoder:(id)a3;
- (double)overrideValue;
- (id)_initWithGeoFormatArgument:(id)a3;
- (id)_stringReplacementWithOptions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setOverrideValue:(double)a3;
@end

@implementation GEOComposedStringArgument_Duration

- (id)_initWithGeoFormatArgument:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEOComposedStringArgument_Duration;
  v5 = [(GEOComposedStringArgument *)&v14 _initWithGeoFormatArgument:v4];
  if (!v5)
  {
LABEL_10:
    v11 = 0;
    goto LABEL_7;
  }
  if ([v4 format] != 3 && objc_msgSend(v4, "format") != 4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: geoFormatArgument.format == GEOFormatArgument_Formatter_DURATION_SHORT_UNITS || geoFormatArgument.format == GEOFormatArgument_Formatter_DURATION_MEDIUM_UNITS", v13, 2u);
    }
    goto LABEL_10;
  }
  if ([v4 hasValInt1])
  {
    id v6 = objc_alloc(MEMORY[0x1E4F28E28]);
    double v7 = (double)[v4 valInt1];
    v8 = [MEMORY[0x1E4F29180] seconds];
    uint64_t v9 = [v6 initWithDoubleValue:v8 unit:v7];
    v10 = (void *)v5[4];
    v5[4] = v9;
  }
  v11 = v5;
LABEL_7:

  return v11;
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
  id v6 = (NSMeasurement *)[v5 initWithDoubleValue:v8 unit:a3];
  overrideValue = self->_overrideValue;
  self->_overrideValue = v6;
}

- (id)_stringReplacementWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  overrideValue = self->_overrideValue;
  if (overrideValue || v4 && *((unsigned char *)v4 + 9) && (overrideValue = self->_defaultValue) != 0)
  {
    double v7 = overrideValue;
    [(NSMeasurement *)v7 doubleValue];
    double v9 = v8;
    if ([(GEOComposedStringArgument *)self type] == 3) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = 3;
    }
    v11 = GEOStringForDuration(v10, v9);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)GEOComposedStringArgument_Duration;
  id v4 = [(GEOComposedStringArgument *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSMeasurement *)self->_defaultValue copy];
  id v6 = (void *)v4[4];
  v4[4] = v5;

  uint64_t v7 = [(NSMeasurement *)self->_overrideValue copy];
  double v8 = (void *)v4[5];
  v4[5] = v7;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOComposedStringArgument_Duration;
  id v4 = a3;
  [(GEOComposedStringArgument *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_defaultValue, @"_defaultValue", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_overrideValue forKey:@"_overrideValue"];
}

- (GEOComposedStringArgument_Duration)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEOComposedStringArgument_Duration;
  objc_super v5 = [(GEOComposedStringArgument *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_defaultValue"];
    defaultValue = v5->_defaultValue;
    v5->_defaultValue = (NSMeasurement *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_overrideValue"];
    overrideValue = v5->_overrideValue;
    v5->_overrideValue = (NSMeasurement *)v8;

    objc_super v10 = v5;
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
    v17.receiver = self;
    v17.super_class = (Class)GEOComposedStringArgument_Duration;
    if ([(GEOComposedStringArgument *)&v17 isEqual:v5]
      && ((uint64_t v6 = (void *)v5[4], v7 = self->_defaultValue, v8 = v6, !(v7 | v8))
       || (double v9 = (void *)v8, v10 = [(id)v7 isEqual:v8], v9, (id)v7, v10)))
    {
      overrideValue = self->_overrideValue;
      uint64_t v12 = v5[5];
      id v13 = overrideValue;
      objc_super v14 = v13;
      if ((unint64_t)v13 | v12) {
        char v15 = [v13 isEqual:v12];
      }
      else {
        char v15 = 1;
      }
    }
    else
    {
      char v15 = 0;
    }
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideValue, 0);

  objc_storeStrong((id *)&self->_defaultValue, 0);
}

@end