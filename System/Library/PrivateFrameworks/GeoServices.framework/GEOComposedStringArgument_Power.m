@interface GEOComposedStringArgument_Power
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (GEOComposedStringArgument_Power)initWithCoder:(id)a3;
- (float)overrideValue;
- (id)_initWithGeoFormatArgument:(id)a3;
- (id)_stringReplacementWithOptions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setOverrideValue:(float)a3;
@end

@implementation GEOComposedStringArgument_Power

- (id)_initWithGeoFormatArgument:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEOComposedStringArgument_Power;
  v5 = [(GEOComposedStringArgument *)&v12 _initWithGeoFormatArgument:v4];
  if (v5)
  {
    v6 = [v4 numberData];
    int v7 = [v6 hasValue];

    if (v7)
    {
      [v5 setHasDefaultValue:1];
      v8 = [v4 numberData];
      [v8 value];
      v5[8] = v9;
    }
    v10 = v5;
  }

  return v5;
}

- (void)setOverrideValue:(float)a3
{
  self->_overrideValue = a3;
}

- (id)_stringReplacementWithOptions:(id)a3
{
  id v4 = a3;
  if ([(GEOComposedStringArgument *)self hasOverrideValue]
    || v4 && v4[9] && [(GEOComposedStringArgument *)self hasDefaultValue])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F28E30]);
    v6 = [v5 numberFormatter];
    [v6 setMaximumFractionDigits:0];

    BOOL v7 = [(GEOComposedStringArgument *)self hasOverrideValue];
    uint64_t v8 = 1;
    if (!v7) {
      uint64_t v8 = 0;
    }
    float v9 = *(float *)((char *)&self->super.super.isa + OBJC_IVAR___GEOComposedStringArgument_Power__defaultValue[v8]);
    id v10 = objc_alloc(MEMORY[0x1E4F28E28]);
    v11 = [MEMORY[0x1E4F291F0] kilowatts];
    objc_super v12 = (void *)[v10 initWithDoubleValue:v11 unit:v9];

    v13 = [v5 stringFromMeasurement:v12];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOComposedStringArgument_Power;
  id result = [(GEOComposedStringArgument *)&v5 copyWithZone:a3];
  *((_DWORD *)result + 8) = LODWORD(self->_defaultValue);
  *((_DWORD *)result + 9) = LODWORD(self->_overrideValue);
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOComposedStringArgument_Power;
  id v4 = a3;
  [(GEOComposedStringArgument *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeDouble:forKey:", @"_defaultValue", self->_defaultValue, v5.receiver, v5.super_class);
  [v4 encodeDouble:@"_overrideValue" forKey:self->_overrideValue];
}

- (GEOComposedStringArgument_Power)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOComposedStringArgument_Power;
  objc_super v5 = [(GEOComposedStringArgument *)&v10 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"_defaultValue"];
    *(float *)&double v6 = v6;
    v5->_defaultValue = *(float *)&v6;
    [v4 decodeDoubleForKey:@"_overrideValue"];
    *(float *)&double v7 = v7;
    v5->_overrideValue = *(float *)&v7;
    uint64_t v8 = v5;
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
    objc_super v5 = (float *)v4;
    v8.receiver = self;
    v8.super_class = (Class)GEOComposedStringArgument_Power;
    BOOL v6 = [(GEOComposedStringArgument *)&v8 isEqual:v5]
      && self->_defaultValue == v5[8]
      && self->_overrideValue == v5[9];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (float)overrideValue
{
  return self->_overrideValue;
}

@end