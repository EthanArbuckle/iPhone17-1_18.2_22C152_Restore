@interface FHPaymentRingSuggestionRequest
- (BOOL)isEqual:(id)a3;
- (FHPaymentRingSuggestionRequest)initWithcurrentStatement:(id)a3 previousStatement:(id)a4 previousStatementPaymentsSum:(id)a5 currentStatementPaymentsSum:(id)a6 statementPurchasesSum:(id)a7 merchantCategoryTransactionSums:(id)a8 paymentDetails:(id)a9;
- (FHStatementDetails)currentStatement;
- (FHStatementDetails)previousStatement;
- (NSArray)paymentDetails;
- (NSDecimalNumber)currentStatementPaymentsSum;
- (NSDecimalNumber)previousStatementPaymentsSum;
- (NSDecimalNumber)statementPurchasesSum;
- (NSDictionary)merchantCategoryTransactionSums;
- (id)description;
- (unint64_t)hash;
- (void)setCurrentStatement:(id)a3;
- (void)setCurrentStatementPaymentsSum:(id)a3;
- (void)setMerchantCategoryTransactionSums:(id)a3;
- (void)setPaymentDetails:(id)a3;
- (void)setPreviousStatement:(id)a3;
- (void)setPreviousStatementPaymentsSum:(id)a3;
- (void)setStatementPurchasesSum:(id)a3;
@end

@implementation FHPaymentRingSuggestionRequest

- (FHPaymentRingSuggestionRequest)initWithcurrentStatement:(id)a3 previousStatement:(id)a4 previousStatementPaymentsSum:(id)a5 currentStatementPaymentsSum:(id)a6 statementPurchasesSum:(id)a7 merchantCategoryTransactionSums:(id)a8 paymentDetails:(id)a9
{
  id v25 = a3;
  id v24 = a4;
  id v23 = a5;
  id v22 = a6;
  id v21 = a7;
  id v16 = a8;
  id v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)FHPaymentRingSuggestionRequest;
  v18 = [(FHPaymentRingSuggestionRequest *)&v26 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_currentStatement, a3);
    objc_storeStrong((id *)&v19->_previousStatement, a4);
    objc_storeStrong((id *)&v19->_previousStatementPaymentsSum, a5);
    objc_storeStrong((id *)&v19->_currentStatementPaymentsSum, a6);
    objc_storeStrong((id *)&v19->_statementPurchasesSum, a7);
    objc_storeStrong((id *)&v19->_merchantCategoryTransactionSums, a8);
    objc_storeStrong((id *)&v19->_paymentDetails, a9);
  }

  return v19;
}

- (unint64_t)hash
{
  v3 = [(FHPaymentRingSuggestionRequest *)self currentStatement];
  uint64_t v4 = [v3 hash];

  v5 = [(FHPaymentRingSuggestionRequest *)self previousStatement];
  uint64_t v6 = 17 * (17 * v4 + [v5 hash]);

  v7 = [(FHPaymentRingSuggestionRequest *)self previousStatementPaymentsSum];
  uint64_t v8 = 17 * (v6 + [v7 hash]);

  v9 = [(FHPaymentRingSuggestionRequest *)self currentStatementPaymentsSum];
  uint64_t v10 = 17 * (v8 + [v9 hash]);

  v11 = [(FHPaymentRingSuggestionRequest *)self statementPurchasesSum];
  uint64_t v12 = 17 * (v10 + [v11 hash]);

  v13 = [(FHPaymentRingSuggestionRequest *)self merchantCategoryTransactionSums];
  uint64_t v14 = 17 * (v12 + [v13 hash]);

  v15 = [(FHPaymentRingSuggestionRequest *)self paymentDetails];
  unint64_t v16 = v14 + [v15 hash] + 410338673;

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (FHPaymentRingSuggestionRequest *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v17 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = [(FHPaymentRingSuggestionRequest *)self currentStatement];
    v7 = [(FHPaymentRingSuggestionRequest *)v5 currentStatement];
    if ([v6 isEqual:v7])
    {
      uint64_t v8 = [(FHPaymentRingSuggestionRequest *)self previousStatement];
      v9 = [(FHPaymentRingSuggestionRequest *)v5 previousStatement];
      if ([v8 isEqual:v9])
      {
        uint64_t v10 = [(FHPaymentRingSuggestionRequest *)self previousStatementPaymentsSum];
        v11 = [(FHPaymentRingSuggestionRequest *)v5 previousStatementPaymentsSum];
        if ([v10 isEqual:v11])
        {
          uint64_t v12 = [(FHPaymentRingSuggestionRequest *)self currentStatementPaymentsSum];
          v13 = [(FHPaymentRingSuggestionRequest *)v5 currentStatementPaymentsSum];
          if ([v12 isEqual:v13])
          {
            id v24 = v12;
            uint64_t v14 = [(FHPaymentRingSuggestionRequest *)self statementPurchasesSum];
            [(FHPaymentRingSuggestionRequest *)v5 statementPurchasesSum];
            id v23 = v25 = v14;
            if (objc_msgSend(v14, "isEqual:"))
            {
              v15 = [(FHPaymentRingSuggestionRequest *)self merchantCategoryTransactionSums];
              id v21 = [(FHPaymentRingSuggestionRequest *)v5 merchantCategoryTransactionSums];
              id v22 = v15;
              int v16 = objc_msgSend(v15, "isEqual:");
              uint64_t v12 = v24;
              if (v16)
              {
                v20 = [(FHPaymentRingSuggestionRequest *)self paymentDetails];
                v19 = [(FHPaymentRingSuggestionRequest *)v5 paymentDetails];
                char v17 = [v20 isEqual:v19];
              }
              else
              {
                char v17 = 0;
              }
            }
            else
            {
              char v17 = 0;
              uint64_t v12 = v24;
            }
          }
          else
          {
            char v17 = 0;
          }
        }
        else
        {
          char v17 = 0;
        }
      }
      else
      {
        char v17 = 0;
      }
    }
    else
    {
      char v17 = 0;
    }
  }
  else
  {
    char v17 = 0;
  }

  return v17;
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"currentStatement: '%@'; ", self->_currentStatement];
  [v3 appendFormat:@"previousStatement: '%@'; ", self->_previousStatement];
  [v3 appendFormat:@"previousStatementPaymentsSum: '%@'; ", self->_previousStatementPaymentsSum];
  [v3 appendFormat:@"currentStatementPaymentsSum: '%@'; ", self->_currentStatementPaymentsSum];
  [v3 appendFormat:@"statementPurchasesSum: '%@'; ", self->_statementPurchasesSum];
  objc_msgSend(v3, "appendFormat:", @"merchantCategoryTransactionSums: '%@'; ",
    self->_merchantCategoryTransactionSums);
  [v3 appendFormat:@"paymentDetails: '%@'; ", self->_paymentDetails];
  [v3 appendFormat:@">"];
  return v3;
}

- (FHStatementDetails)currentStatement
{
  return self->_currentStatement;
}

- (void)setCurrentStatement:(id)a3
{
}

- (FHStatementDetails)previousStatement
{
  return self->_previousStatement;
}

- (void)setPreviousStatement:(id)a3
{
}

- (NSDecimalNumber)previousStatementPaymentsSum
{
  return self->_previousStatementPaymentsSum;
}

- (void)setPreviousStatementPaymentsSum:(id)a3
{
}

- (NSDecimalNumber)currentStatementPaymentsSum
{
  return self->_currentStatementPaymentsSum;
}

- (void)setCurrentStatementPaymentsSum:(id)a3
{
}

- (NSDecimalNumber)statementPurchasesSum
{
  return self->_statementPurchasesSum;
}

- (void)setStatementPurchasesSum:(id)a3
{
}

- (NSDictionary)merchantCategoryTransactionSums
{
  return self->_merchantCategoryTransactionSums;
}

- (void)setMerchantCategoryTransactionSums:(id)a3
{
}

- (NSArray)paymentDetails
{
  return self->_paymentDetails;
}

- (void)setPaymentDetails:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentDetails, 0);
  objc_storeStrong((id *)&self->_merchantCategoryTransactionSums, 0);
  objc_storeStrong((id *)&self->_statementPurchasesSum, 0);
  objc_storeStrong((id *)&self->_currentStatementPaymentsSum, 0);
  objc_storeStrong((id *)&self->_previousStatementPaymentsSum, 0);
  objc_storeStrong((id *)&self->_previousStatement, 0);
  objc_storeStrong((id *)&self->_currentStatement, 0);
}

@end