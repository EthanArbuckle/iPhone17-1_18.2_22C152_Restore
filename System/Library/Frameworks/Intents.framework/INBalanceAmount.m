@interface INBalanceAmount
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (INBalanceAmount)initWithAmount:(NSDecimalNumber *)amount balanceType:(INBalanceType)balanceType;
- (INBalanceAmount)initWithAmount:(NSDecimalNumber *)amount currencyCode:(NSString *)currencyCode;
- (INBalanceAmount)initWithAmount:(id)a3 balanceType:(int64_t)a4 currencyCode:(id)a5;
- (INBalanceAmount)initWithCoder:(id)a3;
- (INBalanceType)balanceType;
- (NSDecimalNumber)amount;
- (NSString)currencyCode;
- (id)_dictionaryRepresentation;
- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4;
- (id)description;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INBalanceAmount

- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4
{
  id v5 = a3;
  v6 = [v5 locale];
  uint64_t v7 = [(INBalanceAmount *)self currencyCode];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(INBalanceAmount *)self amount];

    if (v9)
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
      [v10 setNumberStyle:2];
      v11 = [(INBalanceAmount *)self currencyCode];
      [v10 setCurrencyCode:v11];

      [v10 setLocale:v6];
      v12 = [(INBalanceAmount *)self amount];
      uint64_t v13 = [v10 stringFromNumber:v12];
LABEL_7:
      v16 = (void *)v13;

      goto LABEL_9;
    }
  }
  if ([(INBalanceAmount *)self balanceType])
  {
    v14 = [(INBalanceAmount *)self amount];

    if (v14)
    {
      id v15 = [NSString alloc];
      id v10 = [(INBalanceAmount *)self amount];
      v12 = INBalanceTypeGetLocalizedName([(INBalanceAmount *)self balanceType], v5);
      uint64_t v13 = [v15 initWithFormat:@"%@ %@", v6, v10, v12 locale];
      goto LABEL_7;
    }
  }
  v16 = 0;
LABEL_9:

  return v16;
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

- (INBalanceType)balanceType
{
  return self->_balanceType;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (id)_dictionaryRepresentation
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v12[0] = @"amount";
  amount = self->_amount;
  v4 = amount;
  if (!amount)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[0] = v4;
  v12[1] = @"balanceType";
  unint64_t v5 = self->_balanceType - 1;
  if (v5 > 2) {
    v6 = @"unknown";
  }
  else {
    v6 = off_1E5517F68[v5];
  }
  uint64_t v7 = v6;
  v13[1] = v7;
  v12[2] = @"currencyCode";
  currencyCode = self->_currencyCode;
  v9 = currencyCode;
  if (!currencyCode)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[2] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  if (!currencyCode) {

  }
  if (!amount) {

  }
  return v10;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  unint64_t v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INBalanceAmount;
  v6 = [(INBalanceAmount *)&v11 description];
  uint64_t v7 = [(INBalanceAmount *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (id)description
{
  return [(INBalanceAmount *)self descriptionAtIndent:0];
}

- (void)encodeWithCoder:(id)a3
{
  amount = self->_amount;
  id v5 = a3;
  [v5 encodeObject:amount forKey:@"amount"];
  [v5 encodeInteger:self->_balanceType forKey:@"balanceType"];
  [v5 encodeObject:self->_currencyCode forKey:@"currencyCode"];
}

- (INBalanceAmount)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"amount"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"balanceType"];
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currencyCode"];

  v8 = [(INBalanceAmount *)self initWithAmount:v5 balanceType:v6 currencyCode:v7];
  return v8;
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
    if ((amount == (NSDecimalNumber *)v5[1] || -[NSDecimalNumber isEqual:](amount, "isEqual:"))
      && self->_balanceType == v5[2])
    {
      currencyCode = self->_currencyCode;
      if (currencyCode == (NSString *)v5[3] || -[NSString isEqual:](currencyCode, "isEqual:")) {
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
  currencyCode = self->_currencyCode;
  int64_t v5 = self->_balanceType ^ v3;
  return v5 ^ [(NSString *)currencyCode hash];
}

- (INBalanceAmount)initWithAmount:(id)a3 balanceType:(int64_t)a4 currencyCode:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)INBalanceAmount;
  id v10 = [(INBalanceAmount *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    amount = v10->_amount;
    v10->_amount = (NSDecimalNumber *)v11;

    v10->_balanceType = a4;
    uint64_t v13 = [v9 copy];
    currencyCode = v10->_currencyCode;
    v10->_currencyCode = (NSString *)v13;
  }
  return v10;
}

- (INBalanceAmount)initWithAmount:(NSDecimalNumber *)amount currencyCode:(NSString *)currencyCode
{
  uint64_t v6 = amount;
  uint64_t v7 = currencyCode;
  v14.receiver = self;
  v14.super_class = (Class)INBalanceAmount;
  id v8 = [(INBalanceAmount *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [(NSDecimalNumber *)v6 copy];
    id v10 = v8->_amount;
    v8->_amount = (NSDecimalNumber *)v9;

    v8->_balanceType = 1;
    uint64_t v11 = [(NSString *)v7 copy];
    v12 = v8->_currencyCode;
    v8->_currencyCode = (NSString *)v11;
  }
  return v8;
}

- (INBalanceAmount)initWithAmount:(NSDecimalNumber *)amount balanceType:(INBalanceType)balanceType
{
  uint64_t v6 = amount;
  if (balanceType == INBalanceTypeMoney)
  {
    NSLog((NSString *)@"Initializing INBalanceAmount with INBalanceTypeMoney not allowed. Use initWithAmount:currencyCode: instead");
    uint64_t v7 = 0;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)INBalanceAmount;
    id v8 = [(INBalanceAmount *)&v13 init];
    if (v8)
    {
      uint64_t v9 = [(NSDecimalNumber *)v6 copy];
      id v10 = v8->_amount;
      v8->_amount = (NSDecimalNumber *)v9;

      currencyCode = v8->_currencyCode;
      v8->_balanceType = balanceType;
      v8->_currencyCode = 0;
    }
    self = v8;
    uint64_t v7 = self;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end