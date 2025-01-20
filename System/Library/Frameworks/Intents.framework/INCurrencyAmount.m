@interface INCurrencyAmount
+ (BOOL)supportsSecureCoding;
- (BOOL)_intents_compareValue:(id)a3 relation:(unint64_t)a4;
- (BOOL)isEqual:(id)a3;
- (INCurrencyAmount)initWithAmount:(NSDecimalNumber *)amount currencyCode:(NSString *)currencyCode;
- (INCurrencyAmount)initWithCoder:(id)a3;
- (NSDecimalNumber)amount;
- (NSString)currencyCode;
- (NSString)description;
- (id)_dictionaryRepresentation;
- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INCurrencyAmount

- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4
{
  v5 = [a3 locale];
  id v6 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  [v6 setNumberStyle:2];
  v7 = [(INCurrencyAmount *)self currencyCode];
  [v6 setCurrencyCode:v7];

  [v6 setLocale:v5];
  v8 = [(INCurrencyAmount *)self amount];
  v9 = [v6 stringFromNumber:v8];

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currencyCode, 0);

  objc_storeStrong((id *)&self->_amount, 0);
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (id)_dictionaryRepresentation
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"amount";
  amount = self->_amount;
  v4 = amount;
  if (!amount)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"currencyCode";
  v10[0] = v4;
  currencyCode = self->_currencyCode;
  id v6 = currencyCode;
  if (!currencyCode)
  {
    id v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  if (currencyCode)
  {
    if (amount) {
      goto LABEL_7;
    }
  }
  else
  {

    if (amount) {
      goto LABEL_7;
    }
  }

LABEL_7:

  return v7;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INCurrencyAmount;
  id v6 = [(INCurrencyAmount *)&v11 description];
  v7 = [(INCurrencyAmount *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INCurrencyAmount *)self descriptionAtIndent:0];
}

- (void)encodeWithCoder:(id)a3
{
  amount = self->_amount;
  id v5 = a3;
  [v5 encodeObject:amount forKey:@"amount"];
  [v5 encodeObject:self->_currencyCode forKey:@"currencyCode"];
}

- (INCurrencyAmount)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"amount"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currencyCode"];

  v7 = [(INCurrencyAmount *)self initWithAmount:v5 currencyCode:v6];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    amount = self->_amount;
    BOOL v8 = 0;
    if (amount == (NSDecimalNumber *)v5[1] || -[NSDecimalNumber isEqual:](amount, "isEqual:"))
    {
      currencyCode = self->_currencyCode;
      if (currencyCode == (NSString *)v5[2] || -[NSString isEqual:](currencyCode, "isEqual:")) {
        BOOL v8 = 1;
      }
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDecimalNumber *)self->_amount hash];
  return [(NSString *)self->_currencyCode hash] ^ v3;
}

- (INCurrencyAmount)initWithAmount:(NSDecimalNumber *)amount currencyCode:(NSString *)currencyCode
{
  id v6 = amount;
  v7 = currencyCode;
  v14.receiver = self;
  v14.super_class = (Class)INCurrencyAmount;
  BOOL v8 = [(INCurrencyAmount *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [(NSDecimalNumber *)v6 copy];
    v10 = v8->_amount;
    v8->_amount = (NSDecimalNumber *)v9;

    uint64_t v11 = [(NSString *)v7 copy];
    v12 = v8->_currencyCode;
    v8->_currencyCode = (NSString *)v11;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)_intents_compareValue:(id)a3 relation:(unint64_t)a4
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = NSNumber;
    id v8 = v6;
    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = 0;
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
    id v13 = v9;

    id v14 = [v13 amount];

    [v14 doubleValue];
    uint64_t v15 = objc_msgSend(v7, "numberWithDouble:");
LABEL_16:
    v12 = (void *)v15;

    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v6;
    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v11 = v10;
      }
      else {
        uint64_t v11 = 0;
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
    id v14 = v11;

    uint64_t v15 = objc_msgSend(v14, "if_flatMap:", &__block_literal_global_31027);
    goto LABEL_16;
  }
  v12 = 0;
LABEL_17:
  v16 = NSNumber;
  v17 = [(INCurrencyAmount *)self amount];
  [v17 doubleValue];
  v18 = objc_msgSend(v16, "numberWithDouble:");
  char v19 = objc_msgSend(v18, "_intents_compareValue:relation:", v12, a4);

  return v19;
}

id __88__INCurrencyAmount_INCodableAttributeRelationComparing___intents_compareValue_relation___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v3 = NSNumber;
      id v4 = [v2 amount];
      [v4 doubleValue];
      id v5 = objc_msgSend(v3, "numberWithDouble:");
      id v6 = v2;
    }
    else
    {
      id v5 = 0;
      id v6 = 0;
      id v4 = v2;
    }
  }
  else
  {
    id v4 = 0;
    id v5 = 0;
    id v6 = 0;
  }

  v7 = objc_msgSend(MEMORY[0x1E4F1C978], "if_arrayWithObjectIfNonNil:", v5);

  return v7;
}

@end