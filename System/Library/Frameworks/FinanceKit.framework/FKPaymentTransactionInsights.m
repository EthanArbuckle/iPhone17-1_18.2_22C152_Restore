@interface FKPaymentTransactionInsights
- (BOOL)isEqual:(id)a3;
- (FKApplePayTransactionInsight)applePayInsight;
- (FKBankMerchantInformationInsight)bankMerchantInformationInsight;
- (FKContactTransactionInsight)contactInsight;
- (FKMapsTransactionInsight)mapsInsight;
- (FKPaymentTransactionInsights)initWithApplePayInsight:(id)a3 bankMerchantInformationInsight:(id)a4 mapsInsight:(id)a5;
- (FKPaymentTransactionInsights)initWithApplePayInsight:(id)a3 bankMerchantInformationInsight:(id)a4 mapsInsight:(id)a5 contactInsight:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setApplePayInsight:(id)a3;
- (void)setBankMerchantInformationInsight:(id)a3;
- (void)setContactInsight:(id)a3;
- (void)setMapsInsight:(id)a3;
@end

@implementation FKPaymentTransactionInsights

- (FKPaymentTransactionInsights)initWithApplePayInsight:(id)a3 bankMerchantInformationInsight:(id)a4 mapsInsight:(id)a5
{
  return [(FKPaymentTransactionInsights *)self initWithApplePayInsight:a3 bankMerchantInformationInsight:a4 mapsInsight:a5 contactInsight:0];
}

- (FKPaymentTransactionInsights)initWithApplePayInsight:(id)a3 bankMerchantInformationInsight:(id)a4 mapsInsight:(id)a5 contactInsight:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)FKPaymentTransactionInsights;
  v14 = [(FKPaymentTransactionInsights *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    applePayInsight = v14->_applePayInsight;
    v14->_applePayInsight = (FKApplePayTransactionInsight *)v15;

    uint64_t v17 = [v11 copy];
    bankMerchantInformationInsight = v14->_bankMerchantInformationInsight;
    v14->_bankMerchantInformationInsight = (FKBankMerchantInformationInsight *)v17;

    uint64_t v19 = [v12 copy];
    mapsInsight = v14->_mapsInsight;
    v14->_mapsInsight = (FKMapsTransactionInsight *)v19;

    uint64_t v21 = [v13 copy];
    contactInsight = v14->_contactInsight;
    v14->_contactInsight = (FKContactTransactionInsight *)v21;
  }
  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v6 = [(FKApplePayTransactionInsight *)self->_applePayInsight copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(FKBankMerchantInformationInsight *)self->_bankMerchantInformationInsight copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(FKMapsTransactionInsight *)self->_mapsInsight copyWithZone:a3];
  id v11 = (void *)v5[3];
  v5[3] = v10;

  id v12 = [(FKContactTransactionInsight *)self->_contactInsight copyWithZone:a3];
  id v13 = (void *)v5[4];
  v5[4] = v12;

  return v5;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v3 safelyAddObject:self->_applePayInsight];
  [v3 safelyAddObject:self->_bankMerchantInformationInsight];
  [v3 safelyAddObject:self->_mapsInsight];
  [v3 safelyAddObject:self->_contactInsight];
  unint64_t v4 = FKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (FKPaymentTransactionInsights *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = v5;
    if (FKEqualObjects(self->_applePayInsight, v6[1])
      && FKEqualObjects(self->_bankMerchantInformationInsight, v6[2])
      && FKEqualObjects(self->_mapsInsight, v6[3]))
    {
      char v7 = FKEqualObjects(self->_contactInsight, v6[4]);
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

- (FKApplePayTransactionInsight)applePayInsight
{
  return self->_applePayInsight;
}

- (void)setApplePayInsight:(id)a3
{
}

- (FKBankMerchantInformationInsight)bankMerchantInformationInsight
{
  return self->_bankMerchantInformationInsight;
}

- (void)setBankMerchantInformationInsight:(id)a3
{
}

- (FKMapsTransactionInsight)mapsInsight
{
  return self->_mapsInsight;
}

- (void)setMapsInsight:(id)a3
{
}

- (FKContactTransactionInsight)contactInsight
{
  return self->_contactInsight;
}

- (void)setContactInsight:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactInsight, 0);
  objc_storeStrong((id *)&self->_mapsInsight, 0);
  objc_storeStrong((id *)&self->_bankMerchantInformationInsight, 0);

  objc_storeStrong((id *)&self->_applePayInsight, 0);
}

@end