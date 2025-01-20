@interface DKNotableUserDataWallet
- (DKNotableUserDataWallet)initWithContext:(id)a3 localCards:(id)a4;
- (NSArray)localPaymentCards;
- (NSArray)walletCards;
- (PKPaymentSetupAssistantProvisioningContext)paymentProvisioningContext;
- (id)passSnapshotForCredential:(id)a3;
- (void)setLocalPaymentCards:(id)a3;
- (void)setPaymentProvisioningContext:(id)a3;
@end

@implementation DKNotableUserDataWallet

- (DKNotableUserDataWallet)initWithContext:(id)a3 localCards:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DKNotableUserDataWallet;
  v9 = [(DKNotableUserDataWallet *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_paymentProvisioningContext, a3);
    objc_storeStrong((id *)&v10->_localPaymentCards, a4);
  }

  return v10;
}

- (NSArray)walletCards
{
  v2 = [(DKNotableUserDataWallet *)self paymentProvisioningContext];
  v3 = [v2 setupAssistantCredentials];

  return (NSArray *)v3;
}

- (id)passSnapshotForCredential:(id)a3
{
  id v4 = a3;
  v5 = [(DKNotableUserDataWallet *)self paymentProvisioningContext];
  v6 = [v5 passSnapshotForCredential:v4];

  return v6;
}

- (NSArray)localPaymentCards
{
  return self->_localPaymentCards;
}

- (void)setLocalPaymentCards:(id)a3
{
}

- (PKPaymentSetupAssistantProvisioningContext)paymentProvisioningContext
{
  return self->_paymentProvisioningContext;
}

- (void)setPaymentProvisioningContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentProvisioningContext, 0);
  objc_storeStrong((id *)&self->_localPaymentCards, 0);
}

@end