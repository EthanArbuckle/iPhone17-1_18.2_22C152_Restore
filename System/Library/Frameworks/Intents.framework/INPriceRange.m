@interface INPriceRange
+ (BOOL)supportsSecureCoding;
+ (id)_priceWithPriceRangeValue:(id)a3;
- (BOOL)isEqual:(id)a3;
- (INPriceRange)initWithCoder:(id)a3;
- (INPriceRange)initWithMaximumPrice:(NSDecimalNumber *)maximumPrice currencyCode:(NSString *)currencyCode;
- (INPriceRange)initWithMinimumPrice:(NSDecimalNumber *)minimumPrice currencyCode:(NSString *)currencyCode;
- (INPriceRange)initWithPrice:(NSDecimalNumber *)price currencyCode:(NSString *)currencyCode;
- (INPriceRange)initWithRangeBetweenPrice:(NSDecimalNumber *)firstPrice andPrice:(NSDecimalNumber *)secondPrice currencyCode:(NSString *)currencyCode;
- (NSDecimalNumber)maximumPrice;
- (NSDecimalNumber)minimumPrice;
- (NSString)currencyCode;
- (NSString)description;
- (id)_dictionaryRepresentation;
- (id)_formattedStringWithLocale:(id)a3 componentsFormatString:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INPriceRange

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_maximumPrice, 0);

  objc_storeStrong((id *)&self->_minimumPrice, 0);
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (NSDecimalNumber)maximumPrice
{
  return self->_maximumPrice;
}

- (NSDecimalNumber)minimumPrice
{
  return self->_minimumPrice;
}

- (id)_dictionaryRepresentation
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v11[0] = @"minimumPrice";
  minimumPrice = self->_minimumPrice;
  v4 = minimumPrice;
  if (!minimumPrice)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v4;
  v11[1] = @"maximumPrice";
  maximumPrice = self->_maximumPrice;
  v6 = maximumPrice;
  if (!maximumPrice)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v6;
  v11[2] = @"currencyCode";
  currencyCode = self->_currencyCode;
  v8 = currencyCode;
  if (!currencyCode)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  if (currencyCode)
  {
    if (maximumPrice) {
      goto LABEL_9;
    }
LABEL_14:

    if (minimumPrice) {
      goto LABEL_10;
    }
    goto LABEL_15;
  }

  if (!maximumPrice) {
    goto LABEL_14;
  }
LABEL_9:
  if (minimumPrice) {
    goto LABEL_10;
  }
LABEL_15:

LABEL_10:

  return v9;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INPriceRange;
  v6 = [(INPriceRange *)&v11 description];
  v7 = [(INPriceRange *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INPriceRange *)self descriptionAtIndent:0];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (INPriceRange *)v4;
    if (self == v5)
    {
      char v12 = 1;
    }
    else
    {
      v6 = [(INPriceRange *)self minimumPrice];
      v7 = [(INPriceRange *)v5 minimumPrice];
      if ([v6 isEqual:v7])
      {
        v8 = [(INPriceRange *)self maximumPrice];
        v9 = [(INPriceRange *)v5 maximumPrice];
        if ([v8 isEqual:v9])
        {
          v10 = [(INPriceRange *)self currencyCode];
          objc_super v11 = [(INPriceRange *)v5 currencyCode];
          char v12 = [v10 isEqualToString:v11];
        }
        else
        {
          char v12 = 0;
        }
      }
      else
      {
        char v12 = 0;
      }
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDecimalNumber *)self->_minimumPrice hash];
  uint64_t v4 = [(NSDecimalNumber *)self->_maximumPrice hash] ^ v3;
  return v4 ^ [(NSString *)self->_currencyCode hash];
}

- (id)_formattedStringWithLocale:(id)a3 componentsFormatString:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_opt_new();
  [v8 setLocale:v7];

  v9 = [(INPriceRange *)self currencyCode];
  [v8 setCurrencyCode:v9];

  v10 = [(INPriceRange *)self minimumPrice];
  if (v10)
  {
    objc_super v11 = [v8 stringFromNumber:v10];
  }
  else
  {
    objc_super v11 = &stru_1EDA6DB28;
  }
  char v12 = [(INPriceRange *)self minimumPrice];
  v13 = [(INPriceRange *)self maximumPrice];
  int v14 = [v12 isEqual:v13];

  if (v14)
  {
    v15 = v11;
  }
  else
  {
    v16 = &stru_1EDA6DB28;
    [v8 setCurrencySymbol:&stru_1EDA6DB28];
    [v8 setInternationalCurrencySymbol:&stru_1EDA6DB28];
    v17 = [(INPriceRange *)self maximumPrice];
    if (v17)
    {
      v16 = [v8 stringFromNumber:v17];
    }
    objc_msgSend(NSString, "stringWithFormat:", v6, v11, v16);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(INPriceRange *)self minimumPrice];
  [v4 encodeObject:v5 forKey:@"firstPrice"];

  id v6 = [(INPriceRange *)self maximumPrice];
  [v4 encodeObject:v6 forKey:@"secondPrice"];

  id v7 = [(INPriceRange *)self currencyCode];
  [v4 encodeObject:v7 forKey:@"currencyCode"];
}

- (INPriceRange)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firstPrice"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secondPrice"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currencyCode"];

  v8 = [(INPriceRange *)self initWithRangeBetweenPrice:v5 andPrice:v6 currencyCode:v7];
  return v8;
}

- (INPriceRange)initWithPrice:(NSDecimalNumber *)price currencyCode:(NSString *)currencyCode
{
  return [(INPriceRange *)self initWithRangeBetweenPrice:price andPrice:price currencyCode:currencyCode];
}

- (INPriceRange)initWithMinimumPrice:(NSDecimalNumber *)minimumPrice currencyCode:(NSString *)currencyCode
{
  id v6 = minimumPrice;
  id v7 = currencyCode;
  v14.receiver = self;
  v14.super_class = (Class)INPriceRange;
  v8 = [(INPriceRange *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [(NSDecimalNumber *)v6 copy];
    v10 = v8->_minimumPrice;
    v8->_minimumPrice = (NSDecimalNumber *)v9;

    uint64_t v11 = [(NSString *)v7 copy];
    char v12 = v8->_currencyCode;
    v8->_currencyCode = (NSString *)v11;
  }
  return v8;
}

- (INPriceRange)initWithMaximumPrice:(NSDecimalNumber *)maximumPrice currencyCode:(NSString *)currencyCode
{
  id v6 = maximumPrice;
  id v7 = currencyCode;
  v14.receiver = self;
  v14.super_class = (Class)INPriceRange;
  v8 = [(INPriceRange *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [(NSDecimalNumber *)v6 copy];
    v10 = v8->_maximumPrice;
    v8->_maximumPrice = (NSDecimalNumber *)v9;

    uint64_t v11 = [(NSString *)v7 copy];
    char v12 = v8->_currencyCode;
    v8->_currencyCode = (NSString *)v11;
  }
  return v8;
}

- (INPriceRange)initWithRangeBetweenPrice:(NSDecimalNumber *)firstPrice andPrice:(NSDecimalNumber *)secondPrice currencyCode:(NSString *)currencyCode
{
  v8 = firstPrice;
  uint64_t v9 = secondPrice;
  v10 = currencyCode;
  v23.receiver = self;
  v23.super_class = (Class)INPriceRange;
  uint64_t v11 = [(INPriceRange *)&v23 init];
  if (v11)
  {
    uint64_t v12 = [(NSDecimalNumber *)v8 compare:v9];
    BOOL v13 = v12 == -1;
    if (v12 == -1) {
      objc_super v14 = v8;
    }
    else {
      objc_super v14 = v9;
    }
    if (v13) {
      v15 = v9;
    }
    else {
      v15 = v8;
    }
    uint64_t v16 = [(NSDecimalNumber *)v14 copy];
    minimumPrice = v11->_minimumPrice;
    v11->_minimumPrice = (NSDecimalNumber *)v16;

    uint64_t v18 = [(NSDecimalNumber *)v15 copy];
    maximumPrice = v11->_maximumPrice;
    v11->_maximumPrice = (NSDecimalNumber *)v18;

    uint64_t v20 = [(NSString *)v10 copy];
    v21 = v11->_currencyCode;
    v11->_currencyCode = (NSString *)v20;
  }
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_priceWithPriceRangeValue:(id)a3
{
  id v4 = a3;
  v5 = [v4 minimumPrice];
  id v6 = INIntentSlotValueTransformFromDecimalNumberValue(v5);

  id v7 = [v4 maximumPrice];
  v8 = INIntentSlotValueTransformFromDecimalNumberValue(v7);

  uint64_t v9 = [v4 currencyCode];

  if (v6 && v8)
  {
    uint64_t v10 = [objc_alloc((Class)a1) initWithRangeBetweenPrice:v6 andPrice:v8 currencyCode:v9];
LABEL_8:
    uint64_t v11 = (void *)v10;
    goto LABEL_9;
  }
  if (v6)
  {
    uint64_t v10 = [objc_alloc((Class)a1) initWithMinimumPrice:v6 currencyCode:v9];
    goto LABEL_8;
  }
  if (v8)
  {
    uint64_t v10 = [objc_alloc((Class)a1) initWithMaximumPrice:v8 currencyCode:v9];
    goto LABEL_8;
  }
  uint64_t v11 = 0;
LABEL_9:

  return v11;
}

@end