@interface FHPaymentRingSuggestionResponse
+ (id)roundingAmount:(id)a3;
- (BOOL)isEqual:(id)a3;
- (FHPaymentRingSuggestionResponse)initWithAmount:(id)a3 category:(unint64_t)a4;
- (NSDecimalNumber)amount;
- (id)description;
- (int64_t)compare:(id)a3;
- (int64_t)merchantCategory;
- (int64_t)priority;
- (unint64_t)category;
- (unint64_t)hash;
- (void)setAmount:(id)a3;
- (void)setCategory:(unint64_t)a3;
- (void)setMerchantCategory:(int64_t)a3;
- (void)setPriority:(int64_t)a3;
@end

@implementation FHPaymentRingSuggestionResponse

- (FHPaymentRingSuggestionResponse)initWithAmount:(id)a3 category:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FHPaymentRingSuggestionResponse;
  v7 = [(FHPaymentRingSuggestionResponse *)&v11 init];
  if (v7)
  {
    uint64_t v8 = +[FHPaymentRingSuggestionResponse roundingAmount:v6];
    amount = v7->_amount;
    v7->_amount = (NSDecimalNumber *)v8;

    v7->_category = a4;
  }

  return v7;
}

+ (id)roundingAmount:(id)a3
{
  v3 = (void *)MEMORY[0x263F087B8];
  id v4 = a3;
  v5 = [v3 decimalNumberHandlerWithRoundingMode:0 scale:2 raiseOnExactness:0 raiseOnOverflow:0 raiseOnUnderflow:0 raiseOnDivideByZero:0];
  id v6 = [v4 decimalNumberByRoundingAccordingToBehavior:v5];

  return v6;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  amount = self->_amount;
  id v6 = [v4 amount];
  if ([(NSDecimalNumber *)amount compare:v6])
  {
    unint64_t category = self->_category;
    int64_t v8 = category == [v4 category];
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v3 = [(FHPaymentRingSuggestionResponse *)self amount];
  uint64_t v4 = [v3 hash];

  unint64_t v5 = 17 * (17 * v4 + [(FHPaymentRingSuggestionResponse *)self category]);
  return v5 + [(FHPaymentRingSuggestionResponse *)self priority] + 4913;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (FHPaymentRingSuggestionResponse *)a3;
  unint64_t v5 = v4;
  if (v4 == self)
  {
    BOOL v10 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = [(FHPaymentRingSuggestionResponse *)self amount];
    v7 = [(FHPaymentRingSuggestionResponse *)v5 amount];
    if ([v6 isEqual:v7]
      && (unint64_t v8 = [(FHPaymentRingSuggestionResponse *)self category],
          v8 == [(FHPaymentRingSuggestionResponse *)v5 category]))
    {
      int64_t v9 = [(FHPaymentRingSuggestionResponse *)self priority];
      BOOL v10 = v9 == [(FHPaymentRingSuggestionResponse *)v5 priority];
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
  [v3 appendFormat:@"amount: '%@'; ", self->_amount];
  uint64_t v4 = FHPaymentRingSuggestionCategoryToString(self->_category);
  [v3 appendFormat:@"category: '%@'; ", v4];

  objc_msgSend(v3, "appendFormat:", @"priority: %ld; ", self->_priority);
  [v3 appendFormat:@">"];
  return v3;
}

- (unint64_t)category
{
  return self->_category;
}

- (void)setCategory:(unint64_t)a3
{
  self->_unint64_t category = a3;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (int64_t)merchantCategory
{
  return self->_merchantCategory;
}

- (void)setMerchantCategory:(int64_t)a3
{
  self->_merchantCategory = a3;
}

- (void).cxx_destruct
{
}

@end