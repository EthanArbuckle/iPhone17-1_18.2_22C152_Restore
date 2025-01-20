@interface FKPaymentTransaction
- (BOOL)hasNotificationServiceData;
- (BOOL)isBankConnectTransaction;
- (BOOL)isEqual:(id)a3;
- (FKActions)actions;
- (FKAmount)amount;
- (FKAmount)foreignAmount;
- (FKApplePayTransactionInsight)applePayInsight;
- (FKContactTransactionInsight)contactInsight;
- (FKMapsTransactionInsight)mapsInsight;
- (FKPaymentTransaction)initWithTransactionIdentifier:(id)a3 amount:(id)a4 foreignAmount:(id)a5 foreignCurrencyExchangeRate:(id)a6 transactionDate:(id)a7 transactionStatusChangedDate:(id)a8 type:(unint64_t)a9 status:(int64_t)a10 transactionDescription:(id)a11 originalTransactionDescription:(id)a12 localizedTypeDescription:(id)a13 creditDebitIndicator:(unint64_t)a14 actions:(id)a15 isBankConnectTransaction:(BOOL)a16 merchantCategoryCode:(int64_t)a17 hasNotificationServiceData:(BOOL)a18 paymentHash:(id)a19 altDSID:(id)a20 insights:(id)a21;
- (FKPaymentTransaction)initWithTransactionIdentifier:(id)a3 amount:(id)a4 foreignAmount:(id)a5 foreignCurrencyExchangeRate:(id)a6 transactionDate:(id)a7 transactionStatusChangedDate:(id)a8 type:(unint64_t)a9 status:(int64_t)a10 transactionDescription:(id)a11 originalTransactionDescription:(id)a12 localizedTypeDescription:(id)a13 creditDebitIndicator:(unint64_t)a14 actions:(id)a15 isBankConnectTransaction:(BOOL)a16 merchantCategoryCode:(int64_t)a17 hasNotificationServiceData:(BOOL)a18 paymentHash:(id)a19 altDSID:(id)a20 insights:(id)a21 serviceIdentifier:(id)a22;
- (FKPaymentTransactionInsights)insights;
- (NSDate)transactionDate;
- (NSDate)transactionStatusChangedDate;
- (NSDecimalNumber)foreignCurrencyExchangeRate;
- (NSString)altDSID;
- (NSString)localizedTypeDescription;
- (NSString)originalTransactionDescription;
- (NSString)paymentHash;
- (NSString)serviceIdentifier;
- (NSString)transactionDescription;
- (NSString)transactionId;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)merchantCategoryCode;
- (int64_t)status;
- (unint64_t)creditDebitIndicator;
- (unint64_t)hash;
- (unint64_t)type;
- (void)setInsights:(id)a3;
@end

@implementation FKPaymentTransaction

- (FKPaymentTransaction)initWithTransactionIdentifier:(id)a3 amount:(id)a4 foreignAmount:(id)a5 foreignCurrencyExchangeRate:(id)a6 transactionDate:(id)a7 transactionStatusChangedDate:(id)a8 type:(unint64_t)a9 status:(int64_t)a10 transactionDescription:(id)a11 originalTransactionDescription:(id)a12 localizedTypeDescription:(id)a13 creditDebitIndicator:(unint64_t)a14 actions:(id)a15 isBankConnectTransaction:(BOOL)a16 merchantCategoryCode:(int64_t)a17 hasNotificationServiceData:(BOOL)a18 paymentHash:(id)a19 altDSID:(id)a20 insights:(id)a21
{
  LOBYTE(v23) = a18;
  LOBYTE(v22) = a16;
  return -[FKPaymentTransaction initWithTransactionIdentifier:amount:foreignAmount:foreignCurrencyExchangeRate:transactionDate:transactionStatusChangedDate:type:status:transactionDescription:originalTransactionDescription:localizedTypeDescription:creditDebitIndicator:actions:isBankConnectTransaction:merchantCategoryCode:hasNotificationServiceData:paymentHash:altDSID:insights:serviceIdentifier:](self, "initWithTransactionIdentifier:amount:foreignAmount:foreignCurrencyExchangeRate:transactionDate:transactionStatusChangedDate:type:status:transactionDescription:originalTransactionDescription:localizedTypeDescription:creditDebitIndicator:actions:isBankConnectTransaction:merchantCategoryCode:hasNotificationServiceData:paymentHash:altDSID:insights:serviceIdentifier:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, v22,
           a17,
           v23,
           a19,
           a20,
           a21,
           0);
}

- (FKPaymentTransaction)initWithTransactionIdentifier:(id)a3 amount:(id)a4 foreignAmount:(id)a5 foreignCurrencyExchangeRate:(id)a6 transactionDate:(id)a7 transactionStatusChangedDate:(id)a8 type:(unint64_t)a9 status:(int64_t)a10 transactionDescription:(id)a11 originalTransactionDescription:(id)a12 localizedTypeDescription:(id)a13 creditDebitIndicator:(unint64_t)a14 actions:(id)a15 isBankConnectTransaction:(BOOL)a16 merchantCategoryCode:(int64_t)a17 hasNotificationServiceData:(BOOL)a18 paymentHash:(id)a19 altDSID:(id)a20 insights:(id)a21 serviceIdentifier:(id)a22
{
  id v71 = a3;
  id v70 = a4;
  id v69 = a5;
  id v68 = a6;
  id v67 = a7;
  id v66 = a8;
  id v27 = a11;
  id v65 = a12;
  id v28 = a13;
  id v29 = a15;
  id v30 = a19;
  id v31 = a20;
  id v32 = a21;
  id v33 = a22;
  v72.receiver = self;
  v72.super_class = (Class)FKPaymentTransaction;
  v34 = [(FKPaymentTransaction *)&v72 init];
  if (v34)
  {
    uint64_t v35 = [v71 copy];
    transactionId = v34->_transactionId;
    v34->_transactionId = (NSString *)v35;

    uint64_t v37 = [v70 copy];
    amount = v34->_amount;
    v34->_amount = (FKAmount *)v37;

    uint64_t v39 = [v69 copy];
    foreignAmount = v34->_foreignAmount;
    v34->_foreignAmount = (FKAmount *)v39;

    uint64_t v41 = [v68 copy];
    foreignCurrencyExchangeRate = v34->_foreignCurrencyExchangeRate;
    v34->_foreignCurrencyExchangeRate = (NSDecimalNumber *)v41;

    uint64_t v43 = [v67 copy];
    transactionDate = v34->_transactionDate;
    v34->_transactionDate = (NSDate *)v43;

    uint64_t v45 = [v66 copy];
    transactionStatusChangedDate = v34->_transactionStatusChangedDate;
    v34->_transactionStatusChangedDate = (NSDate *)v45;

    v34->_type = a9;
    v34->_status = a10;
    uint64_t v47 = [v27 copy];
    transactionDescription = v34->_transactionDescription;
    v34->_transactionDescription = (NSString *)v47;

    uint64_t v49 = [v65 copy];
    originalTransactionDescription = v34->_originalTransactionDescription;
    v34->_originalTransactionDescription = (NSString *)v49;

    uint64_t v51 = [v28 copy];
    localizedTypeDescription = v34->_localizedTypeDescription;
    v34->_localizedTypeDescription = (NSString *)v51;

    v34->_merchantCategoryCode = a17;
    v34->_creditDebitIndicator = a14;
    uint64_t v53 = [v29 copy];
    actions = v34->_actions;
    v34->_actions = (FKActions *)v53;

    v34->_isBankConnectTransaction = a16;
    v34->_hasNotificationServiceData = a18;
    uint64_t v55 = [v30 copy];
    paymentHash = v34->_paymentHash;
    v34->_paymentHash = (NSString *)v55;

    uint64_t v57 = [v31 copy];
    altDSID = v34->_altDSID;
    v34->_altDSID = (NSString *)v57;

    uint64_t v59 = [v32 copy];
    insights = v34->_insights;
    v34->_insights = (FKPaymentTransactionInsights *)v59;

    uint64_t v61 = [v33 copy];
    serviceIdentifier = v34->_serviceIdentifier;
    v34->_serviceIdentifier = (NSString *)v61;
  }
  return v34;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init(FKPaymentTransaction);
  uint64_t v6 = [(NSString *)self->_transactionId copyWithZone:a3];
  transactionId = v5->_transactionId;
  v5->_transactionId = (NSString *)v6;

  v8 = [(FKAmount *)self->_amount copyWithZone:a3];
  amount = v5->_amount;
  v5->_amount = v8;

  v10 = [(FKAmount *)self->_foreignAmount copyWithZone:a3];
  foreignAmount = v5->_foreignAmount;
  v5->_foreignAmount = v10;

  uint64_t v12 = [(NSDecimalNumber *)self->_foreignCurrencyExchangeRate copyWithZone:a3];
  foreignCurrencyExchangeRate = v5->_foreignCurrencyExchangeRate;
  v5->_foreignCurrencyExchangeRate = (NSDecimalNumber *)v12;

  uint64_t v14 = [(NSDate *)self->_transactionDate copyWithZone:a3];
  transactionDate = v5->_transactionDate;
  v5->_transactionDate = (NSDate *)v14;

  uint64_t v16 = [(NSDate *)self->_transactionStatusChangedDate copyWithZone:a3];
  transactionStatusChangedDate = v5->_transactionStatusChangedDate;
  v5->_transactionStatusChangedDate = (NSDate *)v16;

  v5->_type = self->_type;
  v5->_status = self->_status;
  uint64_t v18 = [(NSString *)self->_transactionDescription copyWithZone:a3];
  transactionDescription = v5->_transactionDescription;
  v5->_transactionDescription = (NSString *)v18;

  uint64_t v20 = [(NSString *)self->_originalTransactionDescription copyWithZone:a3];
  originalTransactionDescription = v5->_originalTransactionDescription;
  v5->_originalTransactionDescription = (NSString *)v20;

  uint64_t v22 = [(NSString *)self->_localizedTypeDescription copyWithZone:a3];
  localizedTypeDescription = v5->_localizedTypeDescription;
  v5->_localizedTypeDescription = (NSString *)v22;

  v5->_merchantCategoryCode = self->_merchantCategoryCode;
  v5->_creditDebitIndicator = self->_creditDebitIndicator;
  v24 = [(FKActions *)self->_actions copyWithZone:a3];
  actions = v5->_actions;
  v5->_actions = v24;

  v5->_isBankConnectTransaction = self->_isBankConnectTransaction;
  v5->_hasNotificationServiceData = self->_hasNotificationServiceData;
  uint64_t v26 = [(NSString *)self->_altDSID copyWithZone:a3];
  altDSID = v5->_altDSID;
  v5->_altDSID = (NSString *)v26;

  uint64_t v28 = [(NSString *)self->_paymentHash copyWithZone:a3];
  paymentHash = v5->_paymentHash;
  v5->_paymentHash = (NSString *)v28;

  id v30 = [(FKPaymentTransactionInsights *)self->_insights copyWithZone:a3];
  insights = v5->_insights;
  v5->_insights = v30;

  uint64_t v32 = [(NSString *)self->_serviceIdentifier copyWithZone:a3];
  serviceIdentifier = v5->_serviceIdentifier;
  v5->_serviceIdentifier = (NSString *)v32;

  return v5;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v3 safelyAddObject:self->_transactionId];
  [v3 safelyAddObject:self->_amount];
  [v3 safelyAddObject:self->_foreignAmount];
  [v3 safelyAddObject:self->_foreignCurrencyExchangeRate];
  [v3 safelyAddObject:self->_transactionDate];
  [v3 safelyAddObject:self->_transactionStatusChangedDate];
  [v3 safelyAddObject:self->_transactionDescription];
  [v3 safelyAddObject:self->_originalTransactionDescription];
  [v3 safelyAddObject:self->_localizedTypeDescription];
  [v3 safelyAddObject:self->_actions];
  [v3 safelyAddObject:self->_altDSID];
  [v3 safelyAddObject:self->_paymentHash];
  [v3 safelyAddObject:self->_insights];
  [v3 safelyAddObject:self->_serviceIdentifier];
  uint64_t v4 = FKCombinedHash(17, v3);
  uint64_t v5 = FKIntegerHash(v4, self->_type);
  uint64_t v6 = FKIntegerHash(v5, self->_status);
  uint64_t v7 = FKIntegerHash(v6, self->_merchantCategoryCode);
  uint64_t v8 = FKIntegerHash(v7, self->_creditDebitIndicator);
  uint64_t v9 = FKIntegerHash(v8, self->_isBankConnectTransaction);
  unint64_t v10 = FKIntegerHash(v9, self->_hasNotificationServiceData);

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (FKPaymentTransaction *)a3;
  uint64_t v5 = v4;
  if (self == v4)
  {
    char v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = v5;
    if (FKEqualObjects(self->_transactionId, v6[2])
      && FKEqualObjects(self->_amount, v6[3])
      && FKEqualObjects(self->_foreignAmount, v6[4])
      && FKEqualObjects(self->_foreignCurrencyExchangeRate, v6[5])
      && FKEqualObjects(self->_transactionDate, v6[6])
      && FKEqualObjects(self->_transactionStatusChangedDate, v6[7])
      && (void *)self->_type == v6[8]
      && (void *)self->_status == v6[9]
      && FKEqualObjects(self->_transactionDescription, v6[10])
      && FKEqualObjects(self->_originalTransactionDescription, v6[11])
      && FKEqualObjects(self->_localizedTypeDescription, v6[12])
      && (void *)self->_creditDebitIndicator == v6[14]
      && FKEqualObjects(self->_actions, v6[15])
      && self->_isBankConnectTransaction == *((unsigned __int8 *)v6 + 8)
      && (void *)self->_merchantCategoryCode == v6[13]
      && self->_hasNotificationServiceData == *((unsigned __int8 *)v6 + 9)
      && FKEqualObjects(self->_altDSID, v6[17])
      && FKEqualObjects(self->_paymentHash, v6[16])
      && FKEqualObjects(self->_insights, v6[19]))
    {
      char v7 = FKEqualObjects(self->_serviceIdentifier, v6[18]);
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (FKMapsTransactionInsight)mapsInsight
{
  return [(FKPaymentTransactionInsights *)self->_insights mapsInsight];
}

- (FKApplePayTransactionInsight)applePayInsight
{
  return [(FKPaymentTransactionInsights *)self->_insights applePayInsight];
}

- (FKContactTransactionInsight)contactInsight
{
  return [(FKPaymentTransactionInsights *)self->_insights contactInsight];
}

- (NSString)transactionId
{
  return self->_transactionId;
}

- (FKAmount)amount
{
  return self->_amount;
}

- (FKAmount)foreignAmount
{
  return self->_foreignAmount;
}

- (NSDecimalNumber)foreignCurrencyExchangeRate
{
  return self->_foreignCurrencyExchangeRate;
}

- (NSDate)transactionDate
{
  return self->_transactionDate;
}

- (NSDate)transactionStatusChangedDate
{
  return self->_transactionStatusChangedDate;
}

- (unint64_t)type
{
  return self->_type;
}

- (int64_t)status
{
  return self->_status;
}

- (NSString)transactionDescription
{
  return self->_transactionDescription;
}

- (NSString)originalTransactionDescription
{
  return self->_originalTransactionDescription;
}

- (NSString)localizedTypeDescription
{
  return self->_localizedTypeDescription;
}

- (int64_t)merchantCategoryCode
{
  return self->_merchantCategoryCode;
}

- (unint64_t)creditDebitIndicator
{
  return self->_creditDebitIndicator;
}

- (FKActions)actions
{
  return self->_actions;
}

- (BOOL)isBankConnectTransaction
{
  return self->_isBankConnectTransaction;
}

- (NSString)paymentHash
{
  return self->_paymentHash;
}

- (BOOL)hasNotificationServiceData
{
  return self->_hasNotificationServiceData;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (FKPaymentTransactionInsights)insights
{
  return self->_insights;
}

- (void)setInsights:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_insights, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_paymentHash, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_localizedTypeDescription, 0);
  objc_storeStrong((id *)&self->_originalTransactionDescription, 0);
  objc_storeStrong((id *)&self->_transactionDescription, 0);
  objc_storeStrong((id *)&self->_transactionStatusChangedDate, 0);
  objc_storeStrong((id *)&self->_transactionDate, 0);
  objc_storeStrong((id *)&self->_foreignCurrencyExchangeRate, 0);
  objc_storeStrong((id *)&self->_foreignAmount, 0);
  objc_storeStrong((id *)&self->_amount, 0);

  objc_storeStrong((id *)&self->_transactionId, 0);
}

@end