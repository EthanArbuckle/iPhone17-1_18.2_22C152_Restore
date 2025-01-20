@interface FHStatementDetails
- (BOOL)isEqual:(id)a3;
- (BOOL)isMonthOfMerge;
- (BOOL)isMonthOne;
- (BOOL)isMonthZero;
- (NSDate)closingDate;
- (NSDate)openingDate;
- (NSDecimalNumber)combinedBalance;
- (NSDecimalNumber)creditLimit;
- (NSDecimalNumber)currentBalance;
- (NSDecimalNumber)currentBalanceForMonthZero;
- (NSDecimalNumber)minimumDue;
- (NSDecimalNumber)remainingMinimumPayment;
- (NSDecimalNumber)remainingStatementBalance;
- (NSDecimalNumber)statementBalance;
- (NSString)currentStatementIdentifier;
- (NSString)statementIdentifier;
- (id)description;
- (unint64_t)hash;
- (void)setClosingDate:(id)a3;
- (void)setCombinedBalance:(id)a3;
- (void)setCreditLimit:(id)a3;
- (void)setCurrentBalance:(id)a3;
- (void)setCurrentBalanceForMonthZero:(id)a3;
- (void)setCurrentStatementIdentifier:(id)a3;
- (void)setIsMonthOfMerge:(BOOL)a3;
- (void)setIsMonthOne:(BOOL)a3;
- (void)setIsMonthZero:(BOOL)a3;
- (void)setMinimumDue:(id)a3;
- (void)setOpeningDate:(id)a3;
- (void)setRemainingMinimumPayment:(id)a3;
- (void)setRemainingStatementBalance:(id)a3;
- (void)setStatementBalance:(id)a3;
- (void)setStatementIdentifier:(id)a3;
@end

@implementation FHStatementDetails

- (unint64_t)hash
{
  v3 = [(FHStatementDetails *)self statementIdentifier];
  uint64_t v4 = [v3 hash];

  v5 = [(FHStatementDetails *)self openingDate];
  uint64_t v6 = 17 * (17 * v4 + [v5 hash]);

  v7 = [(FHStatementDetails *)self closingDate];
  uint64_t v8 = 17 * (v6 + [v7 hash]);

  v9 = [(FHStatementDetails *)self remainingStatementBalance];
  uint64_t v10 = 17 * (v8 + [v9 hash]);

  v11 = [(FHStatementDetails *)self remainingMinimumPayment];
  uint64_t v12 = 17 * (v10 + [v11 hash]);

  v13 = [(FHStatementDetails *)self minimumDue];
  uint64_t v14 = 17 * (v12 + [v13 hash]);

  v15 = [(FHStatementDetails *)self creditLimit];
  uint64_t v16 = 17 * (v14 + [v15 hash]);

  v17 = [(FHStatementDetails *)self statementBalance];
  uint64_t v18 = 17 * (v16 + [v17 hash]);

  v19 = [(FHStatementDetails *)self currentBalance];
  uint64_t v20 = 17 * (v18 + [v19 hash]);

  v21 = [(FHStatementDetails *)self currentBalanceForMonthZero];
  uint64_t v22 = 17 * (v20 + [v21 hash]);

  v23 = [(FHStatementDetails *)self currentStatementIdentifier];
  uint64_t v24 = 17 * (v22 + [v23 hash]);

  uint64_t v25 = 17 * (v24 + [(FHStatementDetails *)self isMonthZero]);
  uint64_t v26 = 17 * (v25 + [(FHStatementDetails *)self isMonthOne]);
  return v26 + [(FHStatementDetails *)self isMonthOfMerge] + 0x25632BDBC201BE1;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (FHStatementDetails *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v23) = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = [(FHStatementDetails *)self statementIdentifier];
    v7 = [(FHStatementDetails *)v5 statementIdentifier];
    if ([v6 isEqual:v7])
    {
      uint64_t v8 = [(FHStatementDetails *)self openingDate];
      v9 = [(FHStatementDetails *)v5 openingDate];
      if ([v8 isEqual:v9])
      {
        uint64_t v10 = [(FHStatementDetails *)self closingDate];
        v11 = [(FHStatementDetails *)v5 closingDate];
        if ([v10 isEqual:v11])
        {
          uint64_t v12 = [(FHStatementDetails *)self remainingStatementBalance];
          v13 = [(FHStatementDetails *)v5 remainingStatementBalance];
          if ([v12 isEqual:v13])
          {
            v38 = v12;
            uint64_t v14 = [(FHStatementDetails *)self remainingMinimumPayment];
            v39 = [(FHStatementDetails *)v5 remainingMinimumPayment];
            v40 = v14;
            if (objc_msgSend(v14, "isEqual:"))
            {
              v15 = [(FHStatementDetails *)self minimumDue];
              v36 = [(FHStatementDetails *)v5 minimumDue];
              v37 = v15;
              if (objc_msgSend(v15, "isEqual:"))
              {
                uint64_t v16 = [(FHStatementDetails *)self creditLimit];
                v34 = [(FHStatementDetails *)v5 creditLimit];
                v35 = v16;
                if (objc_msgSend(v16, "isEqual:"))
                {
                  v17 = [(FHStatementDetails *)self statementBalance];
                  v32 = [(FHStatementDetails *)v5 statementBalance];
                  v33 = v17;
                  if (objc_msgSend(v17, "isEqual:"))
                  {
                    uint64_t v18 = [(FHStatementDetails *)self currentBalance];
                    v30 = [(FHStatementDetails *)v5 currentBalance];
                    v31 = v18;
                    if (objc_msgSend(v18, "isEqual:"))
                    {
                      v19 = [(FHStatementDetails *)self currentBalanceForMonthZero];
                      v28 = [(FHStatementDetails *)v5 currentBalanceForMonthZero];
                      v29 = v19;
                      if (objc_msgSend(v19, "isEqual:"))
                      {
                        uint64_t v20 = [(FHStatementDetails *)self currentStatementIdentifier];
                        uint64_t v26 = [(FHStatementDetails *)v5 currentStatementIdentifier];
                        v27 = v20;
                        if (objc_msgSend(v20, "isEqual:")
                          && (BOOL v21 = [(FHStatementDetails *)self isMonthZero],
                              v21 == [(FHStatementDetails *)v5 isMonthZero])
                          && (BOOL v22 = [(FHStatementDetails *)self isMonthOne],
                              v22 == [(FHStatementDetails *)v5 isMonthOne]))
                        {
                          BOOL v25 = [(FHStatementDetails *)self isMonthOfMerge];
                          BOOL v23 = v25 ^ [(FHStatementDetails *)v5 isMonthOfMerge] ^ 1;
                        }
                        else
                        {
                          LOBYTE(v23) = 0;
                        }
                        uint64_t v12 = v38;
                      }
                      else
                      {
                        LOBYTE(v23) = 0;
                        uint64_t v12 = v38;
                      }
                    }
                    else
                    {
                      LOBYTE(v23) = 0;
                      uint64_t v12 = v38;
                    }
                  }
                  else
                  {
                    LOBYTE(v23) = 0;
                    uint64_t v12 = v38;
                  }
                }
                else
                {
                  LOBYTE(v23) = 0;
                  uint64_t v12 = v38;
                }
              }
              else
              {
                LOBYTE(v23) = 0;
                uint64_t v12 = v38;
              }
            }
            else
            {
              LOBYTE(v23) = 0;
              uint64_t v12 = v38;
            }
          }
          else
          {
            LOBYTE(v23) = 0;
          }
        }
        else
        {
          LOBYTE(v23) = 0;
        }
      }
      else
      {
        LOBYTE(v23) = 0;
      }
    }
    else
    {
      LOBYTE(v23) = 0;
    }
  }
  else
  {
    LOBYTE(v23) = 0;
  }

  return v23;
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"statementIdentifier: '%@'; ", self->_statementIdentifier];
  [v3 appendFormat:@"OpeningDate: '%@'; ", self->_openingDate];
  [v3 appendFormat:@"ClosingDate: '%@'; ", self->_closingDate];
  [v3 appendFormat:@"remainingStatementBalance: '%@'; ", self->_remainingStatementBalance];
  [v3 appendFormat:@"remainingMinimumPayment: '%@'; ", self->_remainingMinimumPayment];
  [v3 appendFormat:@"minimumDue: '%@'; ", self->_minimumDue];
  [v3 appendFormat:@"creditLimit: '%@'; ", self->_creditLimit];
  [v3 appendFormat:@"statementBalance: '%@'; ", self->_statementBalance];
  [v3 appendFormat:@"currentBalance: '%@'; ", self->_currentBalance];
  [v3 appendFormat:@"currentBalanceForMonthZero: '%@'; ", self->_currentBalanceForMonthZero];
  [v3 appendFormat:@"currentStatementIdentifier: '%@'; ", self->_currentStatementIdentifier];
  objc_msgSend(v3, "appendFormat:", @"isMonthZero: '%d'; ", self->_isMonthZero);
  objc_msgSend(v3, "appendFormat:", @"isMonthOne: '%d'; ", self->_isMonthOne);
  objc_msgSend(v3, "appendFormat:", @"isMonthOfMerge: '%d'; ", self->_isMonthOfMerge);
  [v3 appendFormat:@">"];
  return v3;
}

- (NSString)statementIdentifier
{
  return self->_statementIdentifier;
}

- (void)setStatementIdentifier:(id)a3
{
}

- (NSDate)openingDate
{
  return self->_openingDate;
}

- (void)setOpeningDate:(id)a3
{
}

- (NSDate)closingDate
{
  return self->_closingDate;
}

- (void)setClosingDate:(id)a3
{
}

- (NSDecimalNumber)remainingStatementBalance
{
  return self->_remainingStatementBalance;
}

- (void)setRemainingStatementBalance:(id)a3
{
}

- (NSDecimalNumber)combinedBalance
{
  return self->_combinedBalance;
}

- (void)setCombinedBalance:(id)a3
{
}

- (NSDecimalNumber)remainingMinimumPayment
{
  return self->_remainingMinimumPayment;
}

- (void)setRemainingMinimumPayment:(id)a3
{
}

- (NSDecimalNumber)minimumDue
{
  return self->_minimumDue;
}

- (void)setMinimumDue:(id)a3
{
}

- (NSDecimalNumber)creditLimit
{
  return self->_creditLimit;
}

- (void)setCreditLimit:(id)a3
{
}

- (NSDecimalNumber)statementBalance
{
  return self->_statementBalance;
}

- (void)setStatementBalance:(id)a3
{
}

- (NSDecimalNumber)currentBalance
{
  return self->_currentBalance;
}

- (void)setCurrentBalance:(id)a3
{
}

- (NSDecimalNumber)currentBalanceForMonthZero
{
  return self->_currentBalanceForMonthZero;
}

- (void)setCurrentBalanceForMonthZero:(id)a3
{
}

- (NSString)currentStatementIdentifier
{
  return self->_currentStatementIdentifier;
}

- (void)setCurrentStatementIdentifier:(id)a3
{
}

- (BOOL)isMonthZero
{
  return self->_isMonthZero;
}

- (void)setIsMonthZero:(BOOL)a3
{
  self->_isMonthZero = a3;
}

- (BOOL)isMonthOne
{
  return self->_isMonthOne;
}

- (void)setIsMonthOne:(BOOL)a3
{
  self->_isMonthOne = a3;
}

- (BOOL)isMonthOfMerge
{
  return self->_isMonthOfMerge;
}

- (void)setIsMonthOfMerge:(BOOL)a3
{
  self->_isMonthOfMerge = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentStatementIdentifier, 0);
  objc_storeStrong((id *)&self->_currentBalanceForMonthZero, 0);
  objc_storeStrong((id *)&self->_currentBalance, 0);
  objc_storeStrong((id *)&self->_statementBalance, 0);
  objc_storeStrong((id *)&self->_creditLimit, 0);
  objc_storeStrong((id *)&self->_minimumDue, 0);
  objc_storeStrong((id *)&self->_remainingMinimumPayment, 0);
  objc_storeStrong((id *)&self->_combinedBalance, 0);
  objc_storeStrong((id *)&self->_remainingStatementBalance, 0);
  objc_storeStrong((id *)&self->_closingDate, 0);
  objc_storeStrong((id *)&self->_openingDate, 0);
  objc_storeStrong((id *)&self->_statementIdentifier, 0);
}

@end