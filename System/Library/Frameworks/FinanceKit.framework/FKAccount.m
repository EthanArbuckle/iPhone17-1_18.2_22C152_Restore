@interface FKAccount
- (BOOL)isAccountEnabled;
- (BOOL)isAccountMismatched;
- (BOOL)isEqual:(id)a3;
- (FKAccount)initWithFullyQualifiedAccountIdentifier:(id)a3 accountType:(unint64_t)a4 displayName:(id)a5 displayAccountNumberValue:(id)a6 balance:(id)a7 creditLimit:(id)a8 minimumPaymentAmount:(id)a9 nextPaymentDate:(id)a10 overduePaymentAmount:(id)a11 actions:(id)a12 isAccountEnabled:(BOOL)a13 isAccountMismatched:(BOOL)a14 consentUUID:(id)a15 accountRefreshFailure:(unint64_t)a16 transactionsRefreshFailure:(unint64_t)a17;
- (FKActions)actions;
- (FKAmount)creditLimit;
- (FKAmount)minimumPaymentAmount;
- (FKAmount)overduePaymentAmount;
- (FKBalance)balance;
- (FKFullyQualifiedAccountIdentifier)fullyQualifiedAccountIdentifier;
- (NSDate)nextPaymentDate;
- (NSString)displayAccountNumberValue;
- (NSString)displayName;
- (NSUUID)consentUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)accountRefreshFailure;
- (unint64_t)accountType;
- (unint64_t)hash;
- (unint64_t)transactionsRefreshFailure;
@end

@implementation FKAccount

- (FKAccount)initWithFullyQualifiedAccountIdentifier:(id)a3 accountType:(unint64_t)a4 displayName:(id)a5 displayAccountNumberValue:(id)a6 balance:(id)a7 creditLimit:(id)a8 minimumPaymentAmount:(id)a9 nextPaymentDate:(id)a10 overduePaymentAmount:(id)a11 actions:(id)a12 isAccountEnabled:(BOOL)a13 isAccountMismatched:(BOOL)a14 consentUUID:(id)a15 accountRefreshFailure:(unint64_t)a16 transactionsRefreshFailure:(unint64_t)a17
{
  id v21 = a3;
  id v22 = a5;
  id v54 = a6;
  id v23 = a7;
  id v24 = a8;
  id v25 = a9;
  id v26 = a10;
  id v27 = a11;
  id v28 = a12;
  id v29 = a15;
  v55.receiver = self;
  v55.super_class = (Class)FKAccount;
  v30 = [(FKAccount *)&v55 init];
  if (v30)
  {
    uint64_t v31 = [v21 copy];
    fullyQualifiedAccountIdentifier = v30->_fullyQualifiedAccountIdentifier;
    v30->_fullyQualifiedAccountIdentifier = (FKFullyQualifiedAccountIdentifier *)v31;

    v30->_accountType = a4;
    uint64_t v33 = [v22 copy];
    displayName = v30->_displayName;
    v30->_displayName = (NSString *)v33;

    uint64_t v35 = [v54 copy];
    displayAccountNumberValue = v30->_displayAccountNumberValue;
    v30->_displayAccountNumberValue = (NSString *)v35;

    uint64_t v37 = [v23 copy];
    balance = v30->_balance;
    v30->_balance = (FKBalance *)v37;

    uint64_t v39 = [v24 copy];
    creditLimit = v30->_creditLimit;
    v30->_creditLimit = (FKAmount *)v39;

    uint64_t v41 = [v25 copy];
    minimumPaymentAmount = v30->_minimumPaymentAmount;
    v30->_minimumPaymentAmount = (FKAmount *)v41;

    uint64_t v43 = [v26 copy];
    nextPaymentDate = v30->_nextPaymentDate;
    v30->_nextPaymentDate = (NSDate *)v43;

    uint64_t v45 = [v27 copy];
    overduePaymentAmount = v30->_overduePaymentAmount;
    v30->_overduePaymentAmount = (FKAmount *)v45;

    uint64_t v47 = [v28 copy];
    actions = v30->_actions;
    v30->_actions = (FKActions *)v47;

    v30->_isAccountEnabled = a13;
    v30->_isAccountMismatched = a14;
    uint64_t v49 = [v29 copy];
    consentUUID = v30->_consentUUID;
    v30->_consentUUID = (NSUUID *)v49;

    v30->_accountRefreshFailure = a16;
    v30->_transactionsRefreshFailure = a17;
  }

  return v30;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init(FKAccount);
  v6 = [(FKFullyQualifiedAccountIdentifier *)self->_fullyQualifiedAccountIdentifier copyWithZone:a3];
  fullyQualifiedAccountIdentifier = v5->_fullyQualifiedAccountIdentifier;
  v5->_fullyQualifiedAccountIdentifier = v6;

  v5->_accountType = self->_accountType;
  uint64_t v8 = [(NSString *)self->_displayName copyWithZone:a3];
  displayName = v5->_displayName;
  v5->_displayName = (NSString *)v8;

  uint64_t v10 = [(NSString *)self->_displayAccountNumberValue copyWithZone:a3];
  displayAccountNumberValue = v5->_displayAccountNumberValue;
  v5->_displayAccountNumberValue = (NSString *)v10;

  v12 = [(FKBalance *)self->_balance copyWithZone:a3];
  balance = v5->_balance;
  v5->_balance = v12;

  v14 = [(FKAmount *)self->_creditLimit copyWithZone:a3];
  creditLimit = v5->_creditLimit;
  v5->_creditLimit = v14;

  v16 = [(FKAmount *)self->_minimumPaymentAmount copyWithZone:a3];
  minimumPaymentAmount = v5->_minimumPaymentAmount;
  v5->_minimumPaymentAmount = v16;

  uint64_t v18 = [(NSDate *)self->_nextPaymentDate copyWithZone:a3];
  nextPaymentDate = v5->_nextPaymentDate;
  v5->_nextPaymentDate = (NSDate *)v18;

  v20 = [(FKAmount *)self->_overduePaymentAmount copyWithZone:a3];
  overduePaymentAmount = v5->_overduePaymentAmount;
  v5->_overduePaymentAmount = v20;

  id v22 = [(FKActions *)self->_actions copyWithZone:a3];
  actions = v5->_actions;
  v5->_actions = v22;

  v5->_isAccountEnabled = self->_isAccountEnabled;
  v5->_isAccountMismatched = self->_isAccountMismatched;
  uint64_t v24 = [(NSUUID *)self->_consentUUID copyWithZone:a3];
  consentUUID = v5->_consentUUID;
  v5->_consentUUID = (NSUUID *)v24;

  v5->_accountRefreshFailure = self->_accountRefreshFailure;
  v5->_transactionsRefreshFailure = self->_transactionsRefreshFailure;
  return v5;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v3 safelyAddObject:self->_fullyQualifiedAccountIdentifier];
  [v3 safelyAddObject:self->_displayName];
  [v3 safelyAddObject:self->_displayAccountNumberValue];
  [v3 safelyAddObject:self->_balance];
  [v3 safelyAddObject:self->_creditLimit];
  [v3 safelyAddObject:self->_minimumPaymentAmount];
  [v3 safelyAddObject:self->_nextPaymentDate];
  [v3 safelyAddObject:self->_overduePaymentAmount];
  [v3 safelyAddObject:self->_actions];
  [v3 safelyAddObject:self->_consentUUID];
  uint64_t v4 = FKCombinedHash(17, v3);
  uint64_t v5 = FKIntegerHash(v4, self->_accountType);
  uint64_t v6 = FKIntegerHash(v5, self->_isAccountEnabled);
  uint64_t v7 = FKIntegerHash(v6, self->_isAccountMismatched);
  uint64_t v8 = FKIntegerHash(v7, self->_accountRefreshFailure);
  unint64_t v9 = FKIntegerHash(v8, self->_transactionsRefreshFailure);

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (FKAccount *)a3;
  uint64_t v5 = v4;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = v5;
    BOOL v7 = FKEqualObjects(self->_fullyQualifiedAccountIdentifier, v6[2])
      && (void *)self->_accountType == v6[3]
      && FKEqualObjects(self->_displayName, v6[4])
      && FKEqualObjects(self->_displayAccountNumberValue, v6[5])
      && FKEqualObjects(self->_balance, v6[6])
      && FKEqualObjects(self->_creditLimit, v6[7])
      && FKEqualObjects(self->_minimumPaymentAmount, v6[8])
      && FKEqualObjects(self->_nextPaymentDate, v6[9])
      && FKEqualObjects(self->_overduePaymentAmount, v6[10])
      && FKEqualObjects(self->_actions, v6[11])
      && FKEqualObjects(self->_consentUUID, v6[12])
      && self->_isAccountEnabled == *((unsigned __int8 *)v6 + 8)
      && self->_isAccountMismatched == *((unsigned __int8 *)v6 + 9)
      && (void *)self->_accountRefreshFailure == v6[13]
      && self->_transactionsRefreshFailure == (void)v6[14];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (FKFullyQualifiedAccountIdentifier)fullyQualifiedAccountIdentifier
{
  return self->_fullyQualifiedAccountIdentifier;
}

- (unint64_t)accountType
{
  return self->_accountType;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)displayAccountNumberValue
{
  return self->_displayAccountNumberValue;
}

- (FKBalance)balance
{
  return self->_balance;
}

- (FKAmount)creditLimit
{
  return self->_creditLimit;
}

- (FKAmount)minimumPaymentAmount
{
  return self->_minimumPaymentAmount;
}

- (NSDate)nextPaymentDate
{
  return self->_nextPaymentDate;
}

- (FKAmount)overduePaymentAmount
{
  return self->_overduePaymentAmount;
}

- (FKActions)actions
{
  return self->_actions;
}

- (BOOL)isAccountEnabled
{
  return self->_isAccountEnabled;
}

- (BOOL)isAccountMismatched
{
  return self->_isAccountMismatched;
}

- (NSUUID)consentUUID
{
  return self->_consentUUID;
}

- (unint64_t)accountRefreshFailure
{
  return self->_accountRefreshFailure;
}

- (unint64_t)transactionsRefreshFailure
{
  return self->_transactionsRefreshFailure;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consentUUID, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_overduePaymentAmount, 0);
  objc_storeStrong((id *)&self->_nextPaymentDate, 0);
  objc_storeStrong((id *)&self->_minimumPaymentAmount, 0);
  objc_storeStrong((id *)&self->_creditLimit, 0);
  objc_storeStrong((id *)&self->_balance, 0);
  objc_storeStrong((id *)&self->_displayAccountNumberValue, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_fullyQualifiedAccountIdentifier, 0);
}

@end