@interface FKBalanceCalculation
- (BOOL)isEqual:(id)a3;
- (FKAmount)amount;
- (FKBalanceCalculation)initWithAmount:(id)a3 asOf:(id)a4 creditDebitIndicator:(unint64_t)a5;
- (NSDate)asOf;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)creditDebitIndicator;
- (unint64_t)hash;
@end

@implementation FKBalanceCalculation

- (FKBalanceCalculation)initWithAmount:(id)a3 asOf:(id)a4 creditDebitIndicator:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)FKBalanceCalculation;
  v10 = [(FKBalanceCalculation *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    amount = v10->_amount;
    v10->_amount = (FKAmount *)v11;

    uint64_t v13 = [v9 copy];
    asOf = v10->_asOf;
    v10->_asOf = (NSDate *)v13;

    v10->_creditDebitIndicator = a5;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init(FKBalanceCalculation);
  v6 = [(FKAmount *)self->_amount copyWithZone:a3];
  amount = v5->_amount;
  v5->_amount = v6;

  uint64_t v8 = [(NSDate *)self->_asOf copyWithZone:a3];
  asOf = v5->_asOf;
  v5->_asOf = (NSDate *)v8;

  v5->_creditDebitIndicator = self->_creditDebitIndicator;
  return v5;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v3 safelyAddObject:self->_amount];
  [v3 safelyAddObject:self->_asOf];
  uint64_t v4 = FKCombinedHash(17, v3);
  unint64_t v5 = FKIntegerHash(v4, self->_creditDebitIndicator);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (FKBalanceCalculation *)a3;
  unint64_t v5 = v4;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    BOOL v7 = FKEqualObjects(self->_amount, v6[1])
      && FKEqualObjects(self->_asOf, v6[2])
      && self->_creditDebitIndicator == (void)v6[3];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (FKAmount)amount
{
  return self->_amount;
}

- (NSDate)asOf
{
  return self->_asOf;
}

- (unint64_t)creditDebitIndicator
{
  return self->_creditDebitIndicator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asOf, 0);

  objc_storeStrong((id *)&self->_amount, 0);
}

@end