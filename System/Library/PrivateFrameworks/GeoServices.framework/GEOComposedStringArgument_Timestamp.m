@interface GEOComposedStringArgument_Timestamp
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (GEOComposedStringArgument_Timestamp)initWithCoder:(id)a3;
- (NSString)overrideFormatPattern;
- (NSTimeZone)overrideTimeZone;
- (double)overrideValue;
- (id)_initWithGeoFormatArgument:(id)a3;
- (id)_initWithGeoTimestampData:(id)a3;
- (id)_stringReplacementWithOptions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_updateWithGeoTimestampData:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setOverrideFormatPattern:(id)a3;
- (void)setOverrideTimeZone:(id)a3;
- (void)setOverrideValue:(double)a3;
@end

@implementation GEOComposedStringArgument_Timestamp

- (id)_initWithGeoFormatArgument:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOComposedStringArgument_Timestamp;
  id v5 = [(GEOComposedStringArgument *)&v10 _initWithGeoFormatArgument:v4];
  if (v5)
  {
    v6 = [v4 timestampDatas];
    v7 = [v6 firstObject];

    if (v7) {
      [v5 _updateWithGeoTimestampData:v7];
    }
    id v8 = v5;
  }
  return v5;
}

- (id)_initWithGeoTimestampData:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GEOComposedStringArgument_Timestamp;
  id v5 = [(GEOComposedStringArgument *)&v8 _init];
  v6 = v5;
  if (v5) {
    [v5 _updateWithGeoTimestampData:v4];
  }

  return v6;
}

- (void)_updateWithGeoTimestampData:(id)a3
{
  id v11 = a3;
  [(GEOComposedStringArgument *)self setHasDefaultValue:1];
  id v4 = &OBJC_IVAR___GEOComposedStringArgument_Timestamp__defaultValue;
  self->_defaultValue = (double)[v11 timestampVal];
  id v5 = [v11 formatPattern];
  v6 = (NSString *)[v5 copy];
  defaultFormatPattern = self->_defaultFormatPattern;
  self->_defaultFormatPattern = v6;

  objc_super v8 = [v11 timezone];
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E4F1CAF0];
    id v4 = [v11 timezone];
    objc_super v10 = [v9 timeZoneWithName:v4];
  }
  else
  {
    objc_super v10 = 0;
  }
  objc_storeStrong((id *)&self->_defaultTimeZone, v10);
  if (v8)
  {
  }
}

- (void)setOverrideValue:(double)a3
{
  self->_overrideValue = a3;
}

- (id)_stringReplacementWithOptions:(id)a3
{
  id v4 = a3;
  if ([(GEOComposedStringArgument *)self hasOverrideValue]
    || v4 && v4[9] && [(GEOComposedStringArgument *)self hasDefaultValue])
  {
    BOOL v5 = [(GEOComposedStringArgument *)self hasOverrideValue];
    uint64_t v6 = 3;
    if (!v5) {
      uint64_t v6 = 0;
    }
    uint64_t v7 = OBJC_IVAR___GEOComposedStringArgument_Timestamp__defaultValue[v6];
    overrideFormatPattern = self->_overrideFormatPattern;
    if (!overrideFormatPattern) {
      overrideFormatPattern = self->_defaultFormatPattern;
    }
    double v9 = *(double *)((char *)&self->super.super.isa + v7);
    objc_super v10 = overrideFormatPattern;
    id v11 = +[GEOComposedString localizationProvider];
    v12 = [v11 locale];

    overrideTimeZone = self->_overrideTimeZone;
    if (!overrideTimeZone) {
      overrideTimeZone = self->_defaultTimeZone;
    }
    v14 = GEOStringForTimestamp(v10, v12, overrideTimeZone, v9);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)GEOComposedStringArgument_Timestamp;
  id v4 = [(GEOComposedStringArgument *)&v14 copyWithZone:a3];
  v4[4] = *(void *)&self->_defaultValue;
  uint64_t v5 = [(NSString *)self->_defaultFormatPattern copy];
  uint64_t v6 = (void *)v4[5];
  v4[5] = v5;

  uint64_t v7 = [(NSTimeZone *)self->_defaultTimeZone copy];
  objc_super v8 = (void *)v4[6];
  v4[6] = v7;

  v4[7] = *(void *)&self->_overrideValue;
  uint64_t v9 = [(NSString *)self->_overrideFormatPattern copy];
  objc_super v10 = (void *)v4[8];
  v4[8] = v9;

  uint64_t v11 = [(NSTimeZone *)self->_overrideTimeZone copy];
  v12 = (void *)v4[9];
  v4[9] = v11;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOComposedStringArgument_Timestamp;
  id v4 = a3;
  [(GEOComposedStringArgument *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeDouble:forKey:", @"_defaultValue", self->_defaultValue, v5.receiver, v5.super_class);
  [v4 encodeObject:self->_defaultFormatPattern forKey:@"_defaultFormatPattern"];
  [v4 encodeObject:self->_defaultTimeZone forKey:@"_defaultTimeZone"];
  [v4 encodeDouble:@"_overrideValue" forKey:self->_overrideValue];
  [v4 encodeObject:self->_overrideFormatPattern forKey:@"_overrideFormatPattern"];
  [v4 encodeObject:self->_overrideTimeZone forKey:@"_overrideTimeZone"];
}

- (GEOComposedStringArgument_Timestamp)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GEOComposedStringArgument_Timestamp;
  objc_super v5 = [(GEOComposedStringArgument *)&v18 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"_defaultValue"];
    v5->_defaultValue = v6;
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_defaultFormatPattern"];
    defaultFormatPattern = v5->_defaultFormatPattern;
    v5->_defaultFormatPattern = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_defaultTimeZone"];
    defaultTimeZone = v5->_defaultTimeZone;
    v5->_defaultTimeZone = (NSTimeZone *)v9;

    [v4 decodeDoubleForKey:@"_overrideValue"];
    v5->_overrideValue = v11;
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_overrideFormatPattern"];
    overrideFormatPattern = v5->_overrideFormatPattern;
    v5->_overrideFormatPattern = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_overrideTimeZone"];
    overrideTimeZone = v5->_overrideTimeZone;
    v5->_overrideTimeZone = (NSTimeZone *)v14;

    v16 = v5;
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
    objc_super v5 = (double *)v4;
    v27.receiver = self;
    v27.super_class = (Class)GEOComposedStringArgument_Timestamp;
    if (![(GEOComposedStringArgument *)&v27 isEqual:v5]) {
      goto LABEL_14;
    }
    if (self->_defaultValue != v5[4]) {
      goto LABEL_14;
    }
    double v6 = (void *)*((void *)v5 + 5);
    unint64_t v7 = self->_defaultFormatPattern;
    unint64_t v8 = v6;
    if (v7 | v8)
    {
      uint64_t v9 = (void *)v8;
      int v10 = [(id)v7 isEqual:v8];

      if (!v10) {
        goto LABEL_14;
      }
    }
    double v11 = (void *)*((void *)v5 + 6);
    unint64_t v12 = self->_defaultTimeZone;
    unint64_t v13 = v11;
    if (v12 | v13)
    {
      uint64_t v14 = (void *)v13;
      int v15 = [(id)v12 isEqual:v13];

      if (!v15) {
        goto LABEL_14;
      }
    }
    if (self->_overrideValue == v5[7]
      && ((v16 = (void *)*((void *)v5 + 8),
           unint64_t v17 = self->_overrideFormatPattern,
           unint64_t v18 = v16,
           !(v17 | v18))
       || (v19 = (void *)v18, int v20 = [(id)v17 isEqual:v18],
                              v19,
                              (id)v17,
                              v20)))
    {
      overrideTimeZone = self->_overrideTimeZone;
      uint64_t v22 = *((void *)v5 + 9);
      id v23 = overrideTimeZone;
      v24 = v23;
      if ((unint64_t)v23 | v22) {
        char v25 = [v23 isEqual:v22];
      }
      else {
        char v25 = 1;
      }
    }
    else
    {
LABEL_14:
      char v25 = 0;
    }
  }
  else
  {
    char v25 = 0;
  }

  return v25;
}

- (double)overrideValue
{
  return self->_overrideValue;
}

- (NSString)overrideFormatPattern
{
  return self->_overrideFormatPattern;
}

- (void)setOverrideFormatPattern:(id)a3
{
}

- (NSTimeZone)overrideTimeZone
{
  return self->_overrideTimeZone;
}

- (void)setOverrideTimeZone:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideTimeZone, 0);
  objc_storeStrong((id *)&self->_overrideFormatPattern, 0);
  objc_storeStrong((id *)&self->_defaultTimeZone, 0);

  objc_storeStrong((id *)&self->_defaultFormatPattern, 0);
}

@end