@interface FKActions
- (BOOL)isEqual:(id)a3;
- (FKActions)initWithDigitalServicingURL:(id)a3 payNowURL:(id)a4 transferFundsURL:(id)a5 postInstallmentURL:(id)a6 redeemRewardsURL:(id)a7;
- (NSURL)digitalServicingURL;
- (NSURL)payNowURL;
- (NSURL)postInstallmentURL;
- (NSURL)redeemRewardsURL;
- (NSURL)transferFundsURL;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation FKActions

- (FKActions)initWithDigitalServicingURL:(id)a3 payNowURL:(id)a4 transferFundsURL:(id)a5 postInstallmentURL:(id)a6 redeemRewardsURL:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)FKActions;
  v17 = [(FKActions *)&v29 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    digitalServicingURL = v17->_digitalServicingURL;
    v17->_digitalServicingURL = (NSURL *)v18;

    uint64_t v20 = [v13 copy];
    payNowURL = v17->_payNowURL;
    v17->_payNowURL = (NSURL *)v20;

    uint64_t v22 = [v14 copy];
    transferFundsURL = v17->_transferFundsURL;
    v17->_transferFundsURL = (NSURL *)v22;

    uint64_t v24 = [v15 copy];
    postInstallmentURL = v17->_postInstallmentURL;
    v17->_postInstallmentURL = (NSURL *)v24;

    uint64_t v26 = [v16 copy];
    redeemRewardsURL = v17->_redeemRewardsURL;
    v17->_redeemRewardsURL = (NSURL *)v26;
  }
  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init(FKActions);
  uint64_t v6 = [(NSURL *)self->_digitalServicingURL copyWithZone:a3];
  digitalServicingURL = v5->_digitalServicingURL;
  v5->_digitalServicingURL = (NSURL *)v6;

  uint64_t v8 = [(NSURL *)self->_payNowURL copyWithZone:a3];
  payNowURL = v5->_payNowURL;
  v5->_payNowURL = (NSURL *)v8;

  uint64_t v10 = [(NSURL *)self->_transferFundsURL copyWithZone:a3];
  transferFundsURL = v5->_transferFundsURL;
  v5->_transferFundsURL = (NSURL *)v10;

  uint64_t v12 = [(NSURL *)self->_postInstallmentURL copyWithZone:a3];
  postInstallmentURL = v5->_postInstallmentURL;
  v5->_postInstallmentURL = (NSURL *)v12;

  uint64_t v14 = [(NSURL *)self->_redeemRewardsURL copyWithZone:a3];
  redeemRewardsURL = v5->_redeemRewardsURL;
  v5->_redeemRewardsURL = (NSURL *)v14;

  return v5;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v3 safelyAddObject:self->_digitalServicingURL];
  [v3 safelyAddObject:self->_payNowURL];
  [v3 safelyAddObject:self->_transferFundsURL];
  [v3 safelyAddObject:self->_postInstallmentURL];
  [v3 safelyAddObject:self->_redeemRewardsURL];
  unint64_t v4 = FKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (FKActions *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = v5;
    if (FKEqualObjects(self->_digitalServicingURL, v6[1])
      && FKEqualObjects(self->_payNowURL, v6[2])
      && FKEqualObjects(self->_transferFundsURL, v6[3])
      && FKEqualObjects(self->_postInstallmentURL, v6[4]))
    {
      char v7 = FKEqualObjects(self->_redeemRewardsURL, v6[5]);
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

- (NSURL)digitalServicingURL
{
  return self->_digitalServicingURL;
}

- (NSURL)payNowURL
{
  return self->_payNowURL;
}

- (NSURL)transferFundsURL
{
  return self->_transferFundsURL;
}

- (NSURL)postInstallmentURL
{
  return self->_postInstallmentURL;
}

- (NSURL)redeemRewardsURL
{
  return self->_redeemRewardsURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redeemRewardsURL, 0);
  objc_storeStrong((id *)&self->_postInstallmentURL, 0);
  objc_storeStrong((id *)&self->_transferFundsURL, 0);
  objc_storeStrong((id *)&self->_payNowURL, 0);

  objc_storeStrong((id *)&self->_digitalServicingURL, 0);
}

@end