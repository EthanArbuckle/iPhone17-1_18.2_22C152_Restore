@interface GEOComposedStringArgument_Distance
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (GEOComposedStringArgument_Distance)initWithCoder:(id)a3;
- (NSMeasurement)overrideValue;
- (id)_initWithGeoFormatArgument:(id)a3;
- (id)_stringReplacementWithOptions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)formatOptions;
- (void)encodeWithCoder:(id)a3;
- (void)setFormatOptions:(unint64_t)a3;
- (void)setOverrideValue:(id)a3;
@end

@implementation GEOComposedStringArgument_Distance

- (id)_initWithGeoFormatArgument:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOComposedStringArgument_Distance;
  id v5 = [(GEOComposedStringArgument *)&v15 _initWithGeoFormatArgument:v4];
  if (v5)
  {
    if ([v4 hasValInt1])
    {
      [v5 setHasDefaultValue:1];
      id v6 = objc_alloc(MEMORY[0x1E4F28E28]);
      double v7 = (double)[v4 valInt1];
      v8 = [MEMORY[0x1E4F291E0] meters];
      uint64_t v9 = [v6 initWithDoubleValue:v8 unit:v7];
      v10 = (void *)*((void *)v5 + 4);
      *((void *)v5 + 4) = v9;
    }
    *((unsigned char *)v5 + 56) = 1;
    v11 = [v4 measurementData];

    if (v11)
    {
      v12 = [v4 measurementData];
      *((unsigned char *)v5 + 56) = [v12 enableUnitScaling];
    }
    id v13 = v5;
  }

  return v5;
}

- (id)_stringReplacementWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_defaultValue)
  {
    if (v4 && *((unsigned char *)v4 + 9))
    {
      overrideValue = self->_overrideValue;
      goto LABEL_11;
    }
    BOOL v7 = self->_formatOptions != 0;
  }
  else
  {
    BOOL v7 = 0;
  }
  overrideValue = self->_overrideValue;
  if (overrideValue) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = !v7;
  }
  if (v8)
  {
    v12 = 0;
    goto LABEL_17;
  }
LABEL_11:
  if (!overrideValue) {
    overrideValue = self->_defaultValue;
  }
  uint64_t v9 = overrideValue;
  v10 = +[GEOComposedString localizationProvider];
  if (self->_allowUnitConversion) {
    unint64_t formatOptions = self->_formatOptions;
  }
  else {
    unint64_t formatOptions = self->_formatOptions | 0x20;
  }
  v12 = _GEOStringForDistanceMeasurement(v9, v10, formatOptions, 0);

LABEL_17:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)GEOComposedStringArgument_Distance;
  id v4 = [(GEOComposedStringArgument *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSMeasurement *)self->_defaultValue copy];
  id v6 = (void *)v4[4];
  v4[4] = v5;

  uint64_t v7 = [(NSMeasurement *)self->_overrideValue copy];
  BOOL v8 = (void *)v4[5];
  v4[5] = v7;

  v4[6] = self->_formatOptions;
  *((unsigned char *)v4 + 56) = self->_allowUnitConversion;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOComposedStringArgument_Distance;
  id v4 = a3;
  [(GEOComposedStringArgument *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_defaultValue, @"_defaultValue", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_overrideValue forKey:@"_overrideValue"];
  [v4 encodeInteger:self->_formatOptions forKey:@"_formatOptions"];
  [v4 encodeBool:self->_allowUnitConversion forKey:@"_allowUnitConversion"];
}

- (GEOComposedStringArgument_Distance)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEOComposedStringArgument_Distance;
  objc_super v5 = [(GEOComposedStringArgument *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_defaultValue"];
    defaultValue = v5->_defaultValue;
    v5->_defaultValue = (NSMeasurement *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_overrideValue"];
    overrideValue = v5->_overrideValue;
    v5->_overrideValue = (NSMeasurement *)v8;

    v5->_unint64_t formatOptions = [v4 decodeIntegerForKey:@"_formatOptions"];
    v5->_allowUnitConversion = [v4 decodeBoolForKey:@"_allowUnitConversion"];
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
    v18.receiver = self;
    v18.super_class = (Class)GEOComposedStringArgument_Distance;
    if (![(GEOComposedStringArgument *)&v18 isEqual:v5]) {
      goto LABEL_10;
    }
    uint64_t v6 = (void *)v5[4];
    unint64_t v7 = self->_defaultValue;
    unint64_t v8 = v6;
    if (v7 | v8)
    {
      uint64_t v9 = (void *)v8;
      int v10 = [(id)v7 isEqual:v8];

      if (!v10) {
        goto LABEL_10;
      }
    }
    if (((v11 = (void *)v5[5], v12 = self->_overrideValue, unint64_t v13 = v11, !(v12 | v13))
       || (v14 = (void *)v13, int v15 = [(id)v12 isEqual:v13],
                              v14,
                              (id)v12,
                              v15))
      && self->_formatOptions == v5[6])
    {
      BOOL v16 = self->_allowUnitConversion == *((unsigned __int8 *)v5 + 56);
    }
    else
    {
LABEL_10:
      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (NSMeasurement)overrideValue
{
  return self->_overrideValue;
}

- (void)setOverrideValue:(id)a3
{
}

- (unint64_t)formatOptions
{
  return self->_formatOptions;
}

- (void)setFormatOptions:(unint64_t)a3
{
  self->_unint64_t formatOptions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideValue, 0);

  objc_storeStrong((id *)&self->_defaultValue, 0);
}

@end