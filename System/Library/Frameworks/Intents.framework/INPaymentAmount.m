@interface INPaymentAmount
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INAmountType)amountType;
- (INCurrencyAmount)amount;
- (INPaymentAmount)initWithAmountType:(INAmountType)amountType amount:(INCurrencyAmount *)amount;
- (INPaymentAmount)initWithCoder:(id)a3;
- (NSString)description;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INPaymentAmount

- (void).cxx_destruct
{
}

- (INAmountType)amountType
{
  return self->_amountType;
}

- (INCurrencyAmount)amount
{
  return self->_amount;
}

- (id)_dictionaryRepresentation
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8[0] = @"amount";
  amount = self->_amount;
  v4 = amount;
  if (!amount)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v8[1] = @"amountType";
  v9[0] = v4;
  v5 = [NSNumber numberWithInteger:self->_amountType];
  v9[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

  if (!amount) {

  }
  return v6;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INPaymentAmount;
  v6 = [(INPaymentAmount *)&v11 description];
  v7 = [(INPaymentAmount *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INPaymentAmount *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_amount];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"amount");
  unint64_t v9 = self->_amountType - 1;
  if (v9 > 5) {
    v10 = @"unknown";
  }
  else {
    v10 = off_1E5519570[v9];
  }
  objc_super v11 = v10;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, @"amountType");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  amount = self->_amount;
  id v5 = a3;
  [v5 encodeObject:amount forKey:@"amount"];
  [v5 encodeInteger:self->_amountType forKey:@"amountType"];
}

- (INPaymentAmount)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"amount"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"amountType"];

  v7 = [(INPaymentAmount *)self initWithAmountType:v6 amount:v5];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INPaymentAmount *)a3;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      amount = self->_amount;
      BOOL v7 = (amount == v5->_amount || -[INCurrencyAmount isEqual:](amount, "isEqual:"))
        && self->_amountType == v5->_amountType;
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(INCurrencyAmount *)self->_amount hash];
  id v4 = [NSNumber numberWithInteger:self->_amountType];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (INPaymentAmount)initWithAmountType:(INAmountType)amountType amount:(INCurrencyAmount *)amount
{
  uint64_t v6 = amount;
  v11.receiver = self;
  v11.super_class = (Class)INPaymentAmount;
  BOOL v7 = [(INPaymentAmount *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [(INCurrencyAmount *)v6 copy];
    unint64_t v9 = v7->_amount;
    v7->_amount = (INCurrencyAmount *)v8;

    v7->_amountType = amountType;
  }

  return v7;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = objc_opt_class();
    v10 = [v8 objectForKeyedSubscript:@"amount"];
    objc_super v11 = [v7 decodeObjectOfClass:v9 from:v10];

    v12 = [v8 objectForKeyedSubscript:@"amountType"];
    uint64_t v13 = INAmountTypeWithString(v12);

    v14 = (void *)[objc_alloc((Class)a1) initWithAmountType:v13 amount:v11];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [(INPaymentAmount *)self amount];

  if (v6)
  {
    id v7 = [(INPaymentAmount *)self amount];
    id v8 = objc_msgSend(v7, "_intents_readableTitleWithLocalizer:", v5);

    id v5 = v7;
  }
  else
  {
    id v8 = INAmountTypeGetLocalizedName([(INPaymentAmount *)self amountType], v5);
  }

  return v8;
}

@end