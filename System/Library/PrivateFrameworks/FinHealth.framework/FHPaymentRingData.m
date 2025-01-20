@interface FHPaymentRingData
- (BOOL)isEqual:(id)a3;
- (FHPaymentRingData)initWithTransactionDate:(id)a3 transactionAmount:(id)a4 paymentAmountCategory:(unint64_t)a5;
- (NSDate)transactionDate;
- (NSDecimalNumber)transactionAmount;
- (id)description;
- (unint64_t)hash;
- (unint64_t)paymentAmountCategory;
- (void)setPaymentAmountCategory:(unint64_t)a3;
- (void)setTransactionAmount:(id)a3;
- (void)setTransactionDate:(id)a3;
@end

@implementation FHPaymentRingData

- (FHPaymentRingData)initWithTransactionDate:(id)a3 transactionAmount:(id)a4 paymentAmountCategory:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FHPaymentRingData;
  v11 = [(FHPaymentRingData *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_transactionDate, a3);
    objc_storeStrong((id *)&v12->_transactionAmount, a4);
    v12->_paymentAmountCategory = a5;
  }

  return v12;
}

- (unint64_t)hash
{
  v3 = [(FHPaymentRingData *)self transactionAmount];
  uint64_t v4 = [v3 hash];

  v5 = [(FHPaymentRingData *)self transactionDate];
  uint64_t v6 = 17 * (17 * v4 + [v5 hash]);

  return v6 + [(FHPaymentRingData *)self paymentAmountCategory] + 4913;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (FHPaymentRingData *)a3;
  v5 = v4;
  if (v4 == self)
  {
    BOOL v10 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = [(FHPaymentRingData *)self transactionDate];
    v7 = [(FHPaymentRingData *)v5 transactionDate];
    if ([v6 isEqual:v7])
    {
      v8 = [(FHPaymentRingData *)self transactionAmount];
      id v9 = [(FHPaymentRingData *)v5 transactionAmount];
      if (v8 == v9)
      {
        unint64_t v11 = [(FHPaymentRingData *)self paymentAmountCategory];
        BOOL v10 = v11 == [(FHPaymentRingData *)v5 paymentAmountCategory];
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"transactionDate: '%@'; ", self->_transactionDate];
  uint64_t v4 = FHPaymentRingSuggestionCategoryToString();
  [v3 appendFormat:@"paymentAmountCategory: '%@'; ", v4];

  [v3 appendFormat:@"transactionAmount: '%@'; ", self->_transactionAmount];
  [v3 appendFormat:@">"];
  return v3;
}

- (NSDate)transactionDate
{
  return self->_transactionDate;
}

- (void)setTransactionDate:(id)a3
{
}

- (NSDecimalNumber)transactionAmount
{
  return self->_transactionAmount;
}

- (void)setTransactionAmount:(id)a3
{
}

- (unint64_t)paymentAmountCategory
{
  return self->_paymentAmountCategory;
}

- (void)setPaymentAmountCategory:(unint64_t)a3
{
  self->_paymentAmountCategory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionAmount, 0);
  objc_storeStrong((id *)&self->_transactionDate, 0);
}

@end