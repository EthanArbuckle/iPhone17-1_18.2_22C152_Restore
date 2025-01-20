@interface GEOComposedStringArgument_Percentage
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (GEOComposedStringArgument_Percentage)initWithCoder:(id)a3;
- (float)overrideValue;
- (id)_initWithGeoFormatArgument:(id)a3;
- (id)_stringReplacementWithOptions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setOverrideValue:(float)a3;
@end

@implementation GEOComposedStringArgument_Percentage

- (id)_initWithGeoFormatArgument:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEOComposedStringArgument_Percentage;
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
    id v5 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    [v5 setNumberStyle:3];
    [v5 setMaximumFractionDigits:0];
    [v5 setMultiplier:&unk_1ED73DFA8];
    BOOL v6 = [(GEOComposedStringArgument *)self hasOverrideValue];
    uint64_t v8 = 1;
    if (!v6) {
      uint64_t v8 = 0;
    }
    LODWORD(v7) = *(_DWORD *)((char *)&self->super.super.isa
                            + OBJC_IVAR___GEOComposedStringArgument_Percentage__defaultValue[v8]);
    int v9 = [NSNumber numberWithFloat:v7];
    v10 = [v5 stringFromNumber:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOComposedStringArgument_Percentage;
  id result = [(GEOComposedStringArgument *)&v5 copyWithZone:a3];
  *((_DWORD *)result + 8) = LODWORD(self->_defaultValue);
  *((_DWORD *)result + 9) = LODWORD(self->_overrideValue);
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOComposedStringArgument_Percentage;
  id v4 = a3;
  [(GEOComposedStringArgument *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeDouble:forKey:", @"_defaultValue", self->_defaultValue, v5.receiver, v5.super_class);
  [v4 encodeDouble:@"_overrideValue" forKey:self->_overrideValue];
}

- (GEOComposedStringArgument_Percentage)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOComposedStringArgument_Percentage;
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
    v8.super_class = (Class)GEOComposedStringArgument_Percentage;
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