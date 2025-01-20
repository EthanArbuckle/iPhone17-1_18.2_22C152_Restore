@interface HFNumberRangeFormatter
+ (id)_nonNumericCharacterSet;
- (BOOL)_isRTL;
- (BOOL)_shouldRemoveUnitFromMaximumFormattedValue:(id)a3;
- (BOOL)_shouldRemoveUnitFromMinimumFormattedValue:(id)a3;
- (BOOL)consolidatesUnit;
- (BOOL)simplifiesEqualValues;
- (HFNumberRangeFormatter)initWithNumberFormatter:(id)a3;
- (NSFormatter)numberFormatter;
- (id)stringForNumberRange:(id)a3;
- (id)stringForObjectValue:(id)a3;
- (void)setConsolidatesUnit:(BOOL)a3;
- (void)setNumberFormatter:(id)a3;
- (void)setSimplifiesEqualValues:(BOOL)a3;
@end

@implementation HFNumberRangeFormatter

- (void).cxx_destruct
{
}

- (id)stringForNumberRange:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 type];
  if (v6 == 1)
  {
    v10 = [(HFNumberRangeFormatter *)self numberFormatter];
    v11 = [v5 minValue];
    v7 = [v10 stringForObjectValue:v11];

    v12 = [(HFNumberRangeFormatter *)self numberFormatter];
    v13 = [v5 maxValue];
    v8 = [v12 stringForObjectValue:v13];

    if ([(HFNumberRangeFormatter *)self simplifiesEqualValues]
      && [v7 isEqualToString:v8])
    {
      id v9 = v7;
      v7 = v9;
    }
    else
    {
      if ([(HFNumberRangeFormatter *)self _shouldRemoveUnitFromMinimumFormattedValue:v7])
      {
        v14 = [(id)objc_opt_class() _nonNumericCharacterSet];
        uint64_t v15 = [v7 stringByTrimmingCharactersInSet:v14];

        v7 = (void *)v15;
      }
      if ([(HFNumberRangeFormatter *)self _shouldRemoveUnitFromMaximumFormattedValue:v8])
      {
        v22 = [(id)objc_opt_class() _nonNumericCharacterSet];
        uint64_t v23 = [v8 stringByTrimmingCharactersInSet:v22];

        v8 = (void *)v23;
      }
      v3 = 0;
      if (!v7 || !v8) {
        goto LABEL_15;
      }
      HFLocalizedStringWithFormat(@"HFNumberRangeFormatterRange", @"%1$@ %2$@", v16, v17, v18, v19, v20, v21, (uint64_t)v7);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    if (v6) {
      goto LABEL_16;
    }
    v7 = [(HFNumberRangeFormatter *)self numberFormatter];
    v8 = [v5 midValue];
    id v9 = [v7 stringForObjectValue:v8];
  }
  v3 = v9;
LABEL_15:

LABEL_16:
  return v3;
}

- (NSFormatter)numberFormatter
{
  return self->_numberFormatter;
}

- (BOOL)simplifiesEqualValues
{
  return self->_simplifiesEqualValues;
}

- (HFNumberRangeFormatter)initWithNumberFormatter:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFNumberRangeFormatter;
  uint64_t v6 = [(HFNumberRangeFormatter *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_numberFormatter, a3);
    v7->_consolidatesUnit = 0;
    v7->_simplifiesEqualValues = 0;
  }

  return v7;
}

- (void)setSimplifiesEqualValues:(BOOL)a3
{
  self->_simplifiesEqualValues = a3;
}

- (void)setConsolidatesUnit:(BOOL)a3
{
  self->_consolidatesUnit = a3;
}

- (id)stringForObjectValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    v8 = [(HFNumberRangeFormatter *)self stringForNumberRange:v7];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)_nonNumericCharacterSet
{
  v2 = [MEMORY[0x263F089C0] decimalDigitCharacterSet];
  [v2 addCharactersInString:@"-–"];
  v3 = [v2 invertedSet];

  return v3;
}

- (BOOL)_isRTL
{
  v2 = HFHomeBundle();
  v3 = [v2 preferredLocalizations];
  id v4 = [v3 firstObject];

  if (v4)
  {
    id v5 = (void *)MEMORY[0x263EFF960];
    uint64_t v6 = [MEMORY[0x263EFF960] canonicalLanguageIdentifierFromString:v4];
    BOOL v7 = [v5 characterDirectionForLanguage:v6] == 2;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_shouldRemoveUnitFromMinimumFormattedValue:(id)a3
{
  id v4 = a3;
  if (!-[HFNumberRangeFormatter consolidatesUnit](self, "consolidatesUnit") || ![v4 length]) {
    goto LABEL_5;
  }
  id v5 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v6 = [v5 languageCode];
  if ([v6 isEqualToString:@"ar"])
  {
    BOOL v7 = [MEMORY[0x263EFF960] currentLocale];
    v8 = [v7 numberingSystem];
    char v9 = [v8 isEqualToString:@"latn"];

    if (v9)
    {
LABEL_5:
      char v10 = 0;
      goto LABEL_6;
    }
  }
  else
  {
  }
  if ([(HFNumberRangeFormatter *)self _isRTL])
  {
    char v10 = 1;
  }
  else
  {
    v12 = [(id)objc_opt_class() _nonNumericCharacterSet];
    char v10 = objc_msgSend(v12, "characterIsMember:", objc_msgSend(v4, "characterAtIndex:", objc_msgSend(v4, "length") - 1));
  }
LABEL_6:

  return v10;
}

- (BOOL)_shouldRemoveUnitFromMaximumFormattedValue:(id)a3
{
  id v4 = a3;
  if ([(HFNumberRangeFormatter *)self consolidatesUnit]
    && [v4 length]
    && ![(HFNumberRangeFormatter *)self _isRTL])
  {
    BOOL v7 = [(id)objc_opt_class() _nonNumericCharacterSet];
    char v5 = objc_msgSend(v7, "characterIsMember:", objc_msgSend(v4, "characterAtIndex:", 0));
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)setNumberFormatter:(id)a3
{
}

- (BOOL)consolidatesUnit
{
  return self->_consolidatesUnit;
}

@end