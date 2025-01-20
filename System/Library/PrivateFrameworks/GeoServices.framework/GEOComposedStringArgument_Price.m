@interface GEOComposedStringArgument_Price
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (GEOComposedStringArgument_Price)initWithCoder:(id)a3;
- (NSString)overrideCurrencyCode;
- (float)overrideAmount;
- (id)_initWithGeoFormatArgument:(id)a3;
- (id)_stringReplacementWithOptions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setOverrideAmount:(float)a3;
- (void)setOverrideCurrencyCode:(id)a3;
@end

@implementation GEOComposedStringArgument_Price

- (id)_initWithGeoFormatArgument:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOComposedStringArgument_Price;
  id v5 = [(GEOComposedStringArgument *)&v13 _initWithGeoFormatArgument:v4];
  if (v5)
  {
    if ([v4 hasPrice])
    {
      [v5 setHasDefaultValue:1];
      v6 = [v4 price];
      [v6 amount];
      *((_DWORD *)v5 + 8) = v7;
    }
    v8 = [v4 price];
    uint64_t v9 = [v8 currencyCode];
    v10 = (void *)*((void *)v5 + 5);
    *((void *)v5 + 5) = v9;

    id v11 = v5;
  }

  return v5;
}

- (void)setOverrideAmount:(float)a3
{
  self->_overrideAmount = a3;
}

- (id)_stringReplacementWithOptions:(id)a3
{
  id v4 = a3;
  if ([(GEOComposedStringArgument *)self hasOverrideValue]
    || v4 && v4[9] && [(GEOComposedStringArgument *)self hasDefaultValue])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    v6 = +[GEOComposedString localizationProvider];
    int v7 = [v6 locale];
    [v5 setLocale:v7];

    [v5 setNumberStyle:2];
    overrideCurrencyCode = self->_overrideCurrencyCode;
    if (!overrideCurrencyCode) {
      overrideCurrencyCode = self->_defaultCurrencyCode;
    }
    uint64_t v9 = overrideCurrencyCode;
    [v5 setCurrencyCode:v9];
    if ([(NSString *)v9 isEqualToString:@"CNY"]) {
      [v5 setMinimumFractionDigits:0];
    }
    BOOL v10 = [(GEOComposedStringArgument *)self hasOverrideValue];
    uint64_t v12 = 2;
    if (!v10) {
      uint64_t v12 = 0;
    }
    LODWORD(v11) = *(_DWORD *)((char *)&self->super.super.isa
                             + OBJC_IVAR___GEOComposedStringArgument_Price__defaultAmount[v12]);
    objc_super v13 = [NSNumber numberWithFloat:v11];
    v14 = [v5 stringFromNumber:v13];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GEOComposedStringArgument_Price;
  id v4 = [(GEOComposedStringArgument *)&v6 copyWithZone:a3];
  *((_DWORD *)v4 + 8) = LODWORD(self->_defaultAmount);
  objc_storeStrong((id *)v4 + 5, self->_defaultCurrencyCode);
  *((_DWORD *)v4 + 12) = LODWORD(self->_overrideAmount);
  objc_storeStrong((id *)v4 + 7, self->_overrideCurrencyCode);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOComposedStringArgument_Price;
  id v4 = a3;
  [(GEOComposedStringArgument *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeDouble:forKey:", @"_defaultAmount", self->_defaultAmount, v5.receiver, v5.super_class);
  [v4 encodeObject:self->_defaultCurrencyCode forKey:@"_defaultCurrencyCode"];
  [v4 encodeDouble:@"_overrideAmount" forKey:self->_overrideAmount];
  [v4 encodeObject:self->_overrideCurrencyCode forKey:@"_overrideCurrencyCode"];
}

- (GEOComposedStringArgument_Price)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEOComposedStringArgument_Price;
  objc_super v5 = [(GEOComposedStringArgument *)&v14 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"_defaultAmount"];
    *(float *)&double v6 = v6;
    v5->_defaultAmount = *(float *)&v6;
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_defaultCurrencyCode"];
    defaultCurrencyCode = v5->_defaultCurrencyCode;
    v5->_defaultCurrencyCode = (NSString *)v7;

    [v4 decodeDoubleForKey:@"_overrideAmount"];
    *(float *)&double v9 = v9;
    v5->_overrideAmount = *(float *)&v9;
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_overrideCurrencyCode"];
    overrideCurrencyCode = v5->_overrideCurrencyCode;
    v5->_overrideCurrencyCode = (NSString *)v10;

    uint64_t v12 = v5;
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
    v17.receiver = self;
    v17.super_class = (Class)GEOComposedStringArgument_Price;
    if ([(GEOComposedStringArgument *)&v17 isEqual:v5]
      && self->_defaultAmount == v5[8]
      && ((double v6 = (void *)*((void *)v5 + 5),
           unint64_t v7 = self->_defaultCurrencyCode,
           unint64_t v8 = v6,
           !(v7 | v8))
       || (double v9 = (void *)v8, v10 = [(id)v7 isEqual:v8], v9, (id)v7, v10))
      && self->_overrideAmount == v5[12])
    {
      overrideCurrencyCode = self->_overrideCurrencyCode;
      uint64_t v12 = *((void *)v5 + 7);
      id v13 = overrideCurrencyCode;
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

- (float)overrideAmount
{
  return self->_overrideAmount;
}

- (NSString)overrideCurrencyCode
{
  return self->_overrideCurrencyCode;
}

- (void)setOverrideCurrencyCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideCurrencyCode, 0);

  objc_storeStrong((id *)&self->_defaultCurrencyCode, 0);
}

@end