@interface FKAmount
- (BOOL)isEqual:(id)a3;
- (FKAmount)initWithDecimalNumber:(id)a3 currency:(id)a4;
- (NSDecimalNumber)decimal;
- (NSString)currency;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation FKAmount

- (FKAmount)initWithDecimalNumber:(id)a3 currency:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FKAmount;
  v8 = [(FKAmount *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    decimal = v8->_decimal;
    v8->_decimal = (NSDecimalNumber *)v9;

    uint64_t v11 = [v7 copy];
    currency = v8->_currency;
    v8->_currency = (NSString *)v11;
  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(FKAmount);
  uint64_t v5 = [(NSDecimalNumber *)self->_decimal copy];
  decimal = v4->_decimal;
  v4->_decimal = (NSDecimalNumber *)v5;

  uint64_t v7 = [(NSString *)self->_currency copy];
  currency = v4->_currency;
  v4->_currency = (NSString *)v7;

  return v4;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v3 safelyAddObject:self->_decimal];
  [v3 safelyAddObject:self->_currency];
  unint64_t v4 = FKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (FKAmount *)a3;
  uint64_t v5 = v4;
  if (self == v4)
  {
    char v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = v5;
    if ([(NSDecimalNumber *)self->_decimal isEqualToNumber:v6[1]]) {
      char v7 = FKEqualObjects(self->_currency, v6[2]);
    }
    else {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSDecimalNumber)decimal
{
  return self->_decimal;
}

- (NSString)currency
{
  return self->_currency;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currency, 0);

  objc_storeStrong((id *)&self->_decimal, 0);
}

@end