@interface FKAppleAccount
- (BOOL)isEqual:(id)a3;
- (FKAppleAccount)initWithAccountIdentifier:(id)a3 currentBalance:(id)a4 totalBalance:(id)a5 currency:(id)a6 status:(unint64_t)a7 type:(unint64_t)a8 creditLimit:(id)a9 minimumDueAmount:(id)a10 nextPaymentDueDate:(id)a11 lastUpdated:(id)a12 displayName:(id)a13;
- (FKAppleAccount)initWithAccountIdentifier:(id)a3 currentBalance:(id)a4 totalBalance:(id)a5 currency:(id)a6 status:(unint64_t)a7 type:(unint64_t)a8 creditLimit:(id)a9 minimumDueAmount:(id)a10 nextPaymentDueDate:(id)a11 lastUpdated:(id)a12 displayName:(id)a13 openingDate:(id)a14 overduePaymentAmount:(id)a15;
- (NSDate)lastUpdated;
- (NSDate)nextPaymentDueDate;
- (NSDate)openingDate;
- (NSDecimalNumber)creditLimit;
- (NSDecimalNumber)currentBalance;
- (NSDecimalNumber)minimumDueAmount;
- (NSDecimalNumber)overduePaymentAmount;
- (NSDecimalNumber)totalBalance;
- (NSString)accountIdentifier;
- (NSString)currency;
- (NSString)displayName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)creditDebitIndicator;
- (unint64_t)hash;
- (unint64_t)status;
- (unint64_t)type;
@end

@implementation FKAppleAccount

- (FKAppleAccount)initWithAccountIdentifier:(id)a3 currentBalance:(id)a4 totalBalance:(id)a5 currency:(id)a6 status:(unint64_t)a7 type:(unint64_t)a8 creditLimit:(id)a9 minimumDueAmount:(id)a10 nextPaymentDueDate:(id)a11 lastUpdated:(id)a12 displayName:(id)a13
{
  return [(FKAppleAccount *)self initWithAccountIdentifier:a3 currentBalance:a4 totalBalance:a5 currency:a6 status:a7 type:a8 creditLimit:a9 minimumDueAmount:a10 nextPaymentDueDate:a11 lastUpdated:a12 displayName:a13 openingDate:0 overduePaymentAmount:0];
}

- (FKAppleAccount)initWithAccountIdentifier:(id)a3 currentBalance:(id)a4 totalBalance:(id)a5 currency:(id)a6 status:(unint64_t)a7 type:(unint64_t)a8 creditLimit:(id)a9 minimumDueAmount:(id)a10 nextPaymentDueDate:(id)a11 lastUpdated:(id)a12 displayName:(id)a13 openingDate:(id)a14 overduePaymentAmount:(id)a15
{
  id v18 = a3;
  id v19 = a4;
  id v55 = a5;
  id v54 = a6;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  id v23 = a12;
  id v24 = a13;
  id v25 = a14;
  id v26 = a15;
  v56.receiver = self;
  v56.super_class = (Class)FKAppleAccount;
  v27 = [(FKAppleAccount *)&v56 init];
  if (v27)
  {
    uint64_t v28 = [v18 copy];
    accountIdentifier = v27->_accountIdentifier;
    v27->_accountIdentifier = (NSString *)v28;

    uint64_t v30 = [v19 copy];
    currentBalance = v27->_currentBalance;
    v27->_currentBalance = (NSDecimalNumber *)v30;

    uint64_t v32 = [v55 copy];
    totalBalance = v27->_totalBalance;
    v27->_totalBalance = (NSDecimalNumber *)v32;

    uint64_t v34 = [v54 copy];
    currency = v27->_currency;
    v27->_currency = (NSString *)v34;

    uint64_t v36 = [v24 copy];
    displayName = v27->_displayName;
    v27->_displayName = (NSString *)v36;

    v27->_status = a7;
    v27->_type = a8;
    uint64_t v38 = [v20 copy];
    creditLimit = v27->_creditLimit;
    v27->_creditLimit = (NSDecimalNumber *)v38;

    uint64_t v40 = [v21 copy];
    minimumDueAmount = v27->_minimumDueAmount;
    v27->_minimumDueAmount = (NSDecimalNumber *)v40;

    uint64_t v42 = [v22 copy];
    nextPaymentDueDate = v27->_nextPaymentDueDate;
    v27->_nextPaymentDueDate = (NSDate *)v42;

    uint64_t v44 = [v23 copy];
    lastUpdated = v27->_lastUpdated;
    v27->_lastUpdated = (NSDate *)v44;

    uint64_t v46 = [v25 copy];
    openingDate = v27->_openingDate;
    v27->_openingDate = (NSDate *)v46;

    uint64_t v48 = [v26 copy];
    overduePaymentAmount = v27->_overduePaymentAmount;
    v27->_overduePaymentAmount = (NSDecimalNumber *)v48;
  }
  return v27;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = [(NSString *)self->_accountIdentifier copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_displayName copyWithZone:a3];
  v9 = (void *)v5[7];
  v5[7] = v8;

  uint64_t v10 = [(NSDecimalNumber *)self->_currentBalance copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  uint64_t v12 = [(NSDecimalNumber *)self->_totalBalance copyWithZone:a3];
  v13 = (void *)v5[3];
  v5[3] = v12;

  uint64_t v14 = [(NSString *)self->_currency copyWithZone:a3];
  v15 = (void *)v5[4];
  v5[4] = v14;

  v5[5] = self->_status;
  uint64_t v16 = [(NSDecimalNumber *)self->_minimumDueAmount copyWithZone:a3];
  v17 = (void *)v5[9];
  v5[9] = v16;

  uint64_t v18 = [(NSDecimalNumber *)self->_creditLimit copyWithZone:a3];
  id v19 = (void *)v5[8];
  v5[8] = v18;

  uint64_t v20 = [(NSDate *)self->_nextPaymentDueDate copyWithZone:a3];
  id v21 = (void *)v5[10];
  v5[10] = v20;

  uint64_t v22 = [(NSDate *)self->_lastUpdated copyWithZone:a3];
  id v23 = (void *)v5[11];
  v5[11] = v22;

  uint64_t v24 = [(NSDate *)self->_openingDate copyWithZone:a3];
  id v25 = (void *)v5[12];
  v5[12] = v24;

  uint64_t v26 = [(NSDecimalNumber *)self->_overduePaymentAmount copyWithZone:a3];
  v27 = (void *)v5[13];
  v5[13] = v26;

  return v5;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v3 safelyAddObject:self->_accountIdentifier];
  [v3 safelyAddObject:self->_displayName];
  [v3 safelyAddObject:self->_currentBalance];
  [v3 safelyAddObject:self->_totalBalance];
  [v3 safelyAddObject:self->_currency];
  [v3 safelyAddObject:self->_minimumDueAmount];
  [v3 safelyAddObject:self->_creditLimit];
  [v3 safelyAddObject:self->_nextPaymentDueDate];
  [v3 safelyAddObject:self->_lastUpdated];
  [v3 safelyAddObject:self->_openingDate];
  [v3 safelyAddObject:self->_overduePaymentAmount];
  uint64_t v4 = FKCombinedHash(17, v3);
  unint64_t v5 = FKIntegerHash(v4, self->_status);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (FKAppleAccount *)a3;
  unint64_t v5 = v4;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = v5;
    BOOL v7 = FKEqualObjects(self->_accountIdentifier, v6[1])
      && FKEqualObjects(self->_displayName, v6[7])
      && FKEqualObjects(self->_minimumDueAmount, v6[9])
      && FKEqualObjects(self->_currentBalance, v6[2])
      && FKEqualObjects(self->_totalBalance, v6[3])
      && FKEqualObjects(self->_currency, v6[4])
      && FKEqualObjects(self->_creditLimit, v6[8])
      && FKEqualObjects(self->_nextPaymentDueDate, v6[10])
      && FKEqualObjects(self->_lastUpdated, v6[11])
      && FKEqualObjects(self->_openingDate, v6[12])
      && FKEqualObjects(self->_overduePaymentAmount, v6[13])
      && self->_status == (void)v6[5];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"accountIdentifier: '%@'; ", self->_accountIdentifier];
  [v3 appendFormat:@"displayName: '%@'; ", self->_displayName];
  [v3 appendFormat:@"minimumDueAmount: '%@'; ", self->_minimumDueAmount];
  [v3 appendFormat:@"currentBalance: '%@'; ", self->_currentBalance];
  [v3 appendFormat:@"totalBalance: '%@'; ", self->_totalBalance];
  [v3 appendFormat:@"currency: '%@'; ", self->_currency];
  [v3 appendFormat:@"creditLimit: '%@'; ", self->_creditLimit];
  [v3 appendFormat:@"nextPaymentDueDate: '%@'; ", self->_nextPaymentDueDate];
  objc_msgSend(v3, "appendFormat:", @"status: '%ld'; ", self->_status);
  [v3 appendFormat:@"lastUpdated: '%@'; ", self->_lastUpdated];
  [v3 appendFormat:@"openingDate: '%@'; ", self->_openingDate];
  [v3 appendFormat:@"overduePaymentAmount: '%@'; ", self->_overduePaymentAmount];
  [v3 appendFormat:@">"];

  return v3;
}

- (unint64_t)creditDebitIndicator
{
  return self->_type - 1 < 2;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (NSDecimalNumber)currentBalance
{
  return self->_currentBalance;
}

- (NSDecimalNumber)totalBalance
{
  return self->_totalBalance;
}

- (NSString)currency
{
  return self->_currency;
}

- (unint64_t)status
{
  return self->_status;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSDecimalNumber)creditLimit
{
  return self->_creditLimit;
}

- (NSDecimalNumber)minimumDueAmount
{
  return self->_minimumDueAmount;
}

- (NSDate)nextPaymentDueDate
{
  return self->_nextPaymentDueDate;
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (NSDate)openingDate
{
  return self->_openingDate;
}

- (NSDecimalNumber)overduePaymentAmount
{
  return self->_overduePaymentAmount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overduePaymentAmount, 0);
  objc_storeStrong((id *)&self->_openingDate, 0);
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_nextPaymentDueDate, 0);
  objc_storeStrong((id *)&self->_minimumDueAmount, 0);
  objc_storeStrong((id *)&self->_creditLimit, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_totalBalance, 0);
  objc_storeStrong((id *)&self->_currentBalance, 0);

  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end