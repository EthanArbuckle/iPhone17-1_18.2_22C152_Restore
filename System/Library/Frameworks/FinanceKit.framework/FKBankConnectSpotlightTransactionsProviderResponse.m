@interface FKBankConnectSpotlightTransactionsProviderResponse
- (FKBankConnectSpotlightTransactionsProviderResponse)initWithTransaction:(id)a3 primaryAccountIdentifier:(id)a4;
- (FKPaymentTransaction)transaction;
- (NSString)primaryAccountIdentifier;
@end

@implementation FKBankConnectSpotlightTransactionsProviderResponse

- (FKBankConnectSpotlightTransactionsProviderResponse)initWithTransaction:(id)a3 primaryAccountIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FKBankConnectSpotlightTransactionsProviderResponse;
  v8 = [(FKBankConnectSpotlightTransactionsProviderResponse *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    transaction = v8->_transaction;
    v8->_transaction = (FKPaymentTransaction *)v9;

    uint64_t v11 = [v7 copy];
    primaryAccountIdentifier = v8->_primaryAccountIdentifier;
    v8->_primaryAccountIdentifier = (NSString *)v11;
  }
  return v8;
}

- (FKPaymentTransaction)transaction
{
  return self->_transaction;
}

- (NSString)primaryAccountIdentifier
{
  return self->_primaryAccountIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryAccountIdentifier, 0);

  objc_storeStrong((id *)&self->_transaction, 0);
}

@end