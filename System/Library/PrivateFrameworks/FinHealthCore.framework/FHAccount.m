@interface FHAccount
- (BOOL)isEqual:(id)a3;
- (NSDate)nextPaymentDate;
- (NSDecimalNumber)accountBalance;
- (NSDecimalNumber)creditLimit;
- (NSDecimalNumber)minimumPaymentAmount;
- (NSDecimalNumber)overduePaymentAmount;
- (NSString)accountDescription;
- (NSString)accountID;
- (NSString)currency;
- (NSString)institutionID;
- (NSString)institutionName;
- (NSString)uniqueAccountID;
- (id)description;
- (int64_t)accountCategory;
- (int64_t)accountStatus;
- (int64_t)accountType;
- (int64_t)sourceType;
- (void)setAccountBalance:(id)a3;
- (void)setAccountCategory:(int64_t)a3;
- (void)setAccountDescription:(id)a3;
- (void)setAccountID:(id)a3;
- (void)setAccountStatus:(int64_t)a3;
- (void)setAccountType:(int64_t)a3;
- (void)setCreditLimit:(id)a3;
- (void)setCurrency:(id)a3;
- (void)setInstitutionID:(id)a3;
- (void)setInstitutionName:(id)a3;
- (void)setMinimumPaymentAmount:(id)a3;
- (void)setNextPaymentDate:(id)a3;
- (void)setOverduePaymentAmount:(id)a3;
- (void)setSourceType:(int64_t)a3;
- (void)setUniqueAccountID:(id)a3;
@end

@implementation FHAccount

- (BOOL)isEqual:(id)a3
{
  v4 = (FHAccount *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v25 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = [(FHAccount *)self accountID];
    v7 = [(FHAccount *)v5 accountID];
    if (FHEqualStrings(v6, v7)
      && (int64_t v8 = [(FHAccount *)self sourceType], v8 == [(FHAccount *)v5 sourceType])
      && (int64_t v9 = [(FHAccount *)self accountCategory],
          v9 == [(FHAccount *)v5 accountCategory])
      && (int64_t v10 = [(FHAccount *)self accountType], v10 == [(FHAccount *)v5 accountType]))
    {
      v11 = [(FHAccount *)self accountDescription];
      v12 = [(FHAccount *)v5 accountDescription];
      if (FHEqualStrings(v11, v12)
        && (int64_t v13 = [(FHAccount *)self accountStatus],
            v13 == [(FHAccount *)v5 accountStatus]))
      {
        v14 = [(FHAccount *)self currency];
        v15 = [(FHAccount *)v5 currency];
        if (FHEqualStrings(v14, v15))
        {
          v16 = [(FHAccount *)self creditLimit];
          v17 = [(FHAccount *)v5 creditLimit];
          if (FHEqualObjects(v16, v17))
          {
            v38 = v16;
            v18 = [(FHAccount *)self nextPaymentDate];
            [(FHAccount *)v5 nextPaymentDate];
            v39 = v40 = v18;
            if (FHEqualObjects(v18, v39))
            {
              v19 = [(FHAccount *)self minimumPaymentAmount];
              v36 = [(FHAccount *)v5 minimumPaymentAmount];
              v37 = v19;
              if (FHEqualObjects(v19, v36))
              {
                v20 = [(FHAccount *)self overduePaymentAmount];
                v34 = [(FHAccount *)v5 overduePaymentAmount];
                v35 = v20;
                if (FHEqualObjects(v20, v34))
                {
                  v21 = [(FHAccount *)self accountBalance];
                  [(FHAccount *)v5 accountBalance];
                  v33 = v32 = v21;
                  if (FHEqualObjects(v21, v33))
                  {
                    v22 = [(FHAccount *)self institutionName];
                    v30 = [(FHAccount *)v5 institutionName];
                    v31 = v22;
                    if (FHEqualStrings(v22, v30))
                    {
                      v23 = [(FHAccount *)self institutionID];
                      v28 = [(FHAccount *)v5 institutionID];
                      v29 = v23;
                      if (FHEqualStrings(v23, v28))
                      {
                        v27 = [(FHAccount *)self uniqueAccountID];
                        v24 = [(FHAccount *)v5 uniqueAccountID];
                        char v25 = FHEqualStrings(v27, v24);
                      }
                      else
                      {
                        char v25 = 0;
                      }
                    }
                    else
                    {
                      char v25 = 0;
                    }
                  }
                  else
                  {
                    char v25 = 0;
                  }
                }
                else
                {
                  char v25 = 0;
                }
                v16 = v38;
              }
              else
              {
                char v25 = 0;
                v16 = v38;
              }
            }
            else
            {
              char v25 = 0;
              v16 = v38;
            }
          }
          else
          {
            char v25 = 0;
          }
        }
        else
        {
          char v25 = 0;
        }
      }
      else
      {
        char v25 = 0;
      }
    }
    else
    {
      char v25 = 0;
    }
  }
  else
  {
    char v25 = 0;
  }

  return v25;
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"%@: '%@'; ", @"accountID", self->_accountID];
  [v3 appendFormat:@"%@: '%lu'; ", @"sourceType", self->_sourceType];
  [v3 appendFormat:@"%@: '%lu'; ", @"accountCategory", self->_accountCategory];
  [v3 appendFormat:@"%@: '%lu'; ", @"accountType", self->_accountType];
  [v3 appendFormat:@"%@: '%@'; ", @"accountDescription", self->_accountDescription];
  [v3 appendFormat:@"%@: '%lu'; ", @"accountStatus", self->_accountStatus];
  [v3 appendFormat:@"%@: '%@'; ", @"currency", self->_currency];
  [v3 appendFormat:@"%@: '%@'; ", @"creditLimit", self->_creditLimit];
  [v3 appendFormat:@"%@: '%@'; ", @"nextPaymentDate", self->_nextPaymentDate];
  [v3 appendFormat:@"%@: '%@'; ", @"minimumPaymentAmount", self->_minimumPaymentAmount];
  [v3 appendFormat:@"%@: '%@'; ", @"overduePaymentAmount", self->_overduePaymentAmount];
  [v3 appendFormat:@"%@: '%@'; ", @"accountBalance", self->_accountBalance];
  [v3 appendFormat:@"%@: '%@'; ", @"institutionName", self->_institutionName];
  [v3 appendFormat:@"%@: '%@'; ", @"institutionID", self->_institutionID];
  [v3 appendFormat:@"%@: '%@'; ", @"uniqueAccountID", self->_uniqueAccountID];
  return v3;
}

- (NSString)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (void)setSourceType:(int64_t)a3
{
  self->_sourceType = a3;
}

- (int64_t)accountCategory
{
  return self->_accountCategory;
}

- (void)setAccountCategory:(int64_t)a3
{
  self->_accountCategory = a3;
}

- (int64_t)accountType
{
  return self->_accountType;
}

- (void)setAccountType:(int64_t)a3
{
  self->_accountType = a3;
}

- (NSString)accountDescription
{
  return self->_accountDescription;
}

- (void)setAccountDescription:(id)a3
{
}

- (int64_t)accountStatus
{
  return self->_accountStatus;
}

- (void)setAccountStatus:(int64_t)a3
{
  self->_accountStatus = a3;
}

- (NSString)currency
{
  return self->_currency;
}

- (void)setCurrency:(id)a3
{
}

- (NSDecimalNumber)creditLimit
{
  return self->_creditLimit;
}

- (void)setCreditLimit:(id)a3
{
}

- (NSDate)nextPaymentDate
{
  return self->_nextPaymentDate;
}

- (void)setNextPaymentDate:(id)a3
{
}

- (NSDecimalNumber)minimumPaymentAmount
{
  return self->_minimumPaymentAmount;
}

- (void)setMinimumPaymentAmount:(id)a3
{
}

- (NSDecimalNumber)overduePaymentAmount
{
  return self->_overduePaymentAmount;
}

- (void)setOverduePaymentAmount:(id)a3
{
}

- (NSDecimalNumber)accountBalance
{
  return self->_accountBalance;
}

- (void)setAccountBalance:(id)a3
{
}

- (NSString)institutionName
{
  return self->_institutionName;
}

- (void)setInstitutionName:(id)a3
{
}

- (NSString)institutionID
{
  return self->_institutionID;
}

- (void)setInstitutionID:(id)a3
{
}

- (NSString)uniqueAccountID
{
  return self->_uniqueAccountID;
}

- (void)setUniqueAccountID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueAccountID, 0);
  objc_storeStrong((id *)&self->_institutionID, 0);
  objc_storeStrong((id *)&self->_institutionName, 0);
  objc_storeStrong((id *)&self->_accountBalance, 0);
  objc_storeStrong((id *)&self->_overduePaymentAmount, 0);
  objc_storeStrong((id *)&self->_minimumPaymentAmount, 0);
  objc_storeStrong((id *)&self->_nextPaymentDate, 0);
  objc_storeStrong((id *)&self->_creditLimit, 0);
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_accountDescription, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
}

@end