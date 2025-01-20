@interface PKPeerPaymentRegistrationFlowController
- (NSString)senderAddress;
- (PKCurrencyAmount)currencyAmount;
- (PKPaymentSetupDelegate)setupDelegate;
- (PKPeerPaymentAccount)account;
- (PKPeerPaymentRegistrationFlowController)initWithAccount:(id)a3 currencyAmount:(id)a4 state:(unint64_t)a5 senderAddress:(id)a6 setupDelegate:(id)a7;
- (PKPeerPaymentRegistrationFlowController)initWithUserInfo:(id)a3 setupDelegate:(id)a4;
- (unint64_t)state;
- (void)preflightWithCompletion:(id)a3;
@end

@implementation PKPeerPaymentRegistrationFlowController

- (PKPeerPaymentRegistrationFlowController)initWithAccount:(id)a3 currencyAmount:(id)a4 state:(unint64_t)a5 senderAddress:(id)a6 setupDelegate:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)PKPeerPaymentRegistrationFlowController;
  v17 = [(PKPeerPaymentRegistrationFlowController *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_account, a3);
    objc_storeStrong((id *)&v18->_currencyAmount, a4);
    v18->_state = a5;
    objc_storeStrong((id *)&v18->_senderAddress, a6);
    objc_storeWeak((id *)&v18->_setupDelegate, v16);
  }

  return v18;
}

- (PKPeerPaymentRegistrationFlowController)initWithUserInfo:(id)a3 setupDelegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)PKPeerPaymentRegistrationFlowController;
  v8 = [(PKPeerPaymentRegistrationFlowController *)&v25 init];
  if (!v8) {
    goto LABEL_14;
  }
  v9 = [v6 objectForKey:@"account"];
  id v10 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v9 error:0];
  if (v10)
  {
    uint64_t v11 = objc_opt_class();
    id v26 = 0;
    uint64_t v12 = [v10 decodeTopLevelObjectOfClass:v11 forKey:NSKeyedArchiveRootObjectKey error:&v26];
    id v13 = v26;
    [v10 finishDecoding];
    if (v12) {
      goto LABEL_10;
    }
    id v14 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [v13 description];
      *(_DWORD *)buf = 138412290;
      v28 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Could not unarchive peer payment account data with error:%@", buf, 0xCu);
    }
  }
  else
  {
    id v13 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Could not initialize unarchiver with peer payment account data.", buf, 2u);
    }
  }
  uint64_t v12 = 0;
LABEL_10:

  account = v8->_account;
  v8->_account = (PKPeerPaymentAccount *)v12;

  v17 = [v6 objectForKey:@"amount"];
  v18 = [v6 objectForKey:@"currency"];
  if ([(NSString *)v18 length] && v17)
  {
    uint64_t v19 = PKCurrencyAmountCreate(v17, v18, 0);
    currencyAmount = v8->_currencyAmount;
    v8->_currencyAmount = (PKCurrencyAmount *)v19;
  }
  uint64_t v21 = [v6 objectForKey:@"senderAddress"];
  senderAddress = v8->_senderAddress;
  v8->_senderAddress = (NSString *)v21;

  v23 = [v6 objectForKey:@"state"];
  v8->_state = (unint64_t)[v23 unsignedIntegerValue];

  objc_storeWeak((id *)&v8->_setupDelegate, v7);
LABEL_14:

  return v8;
}

- (void)preflightWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (self->_account)
    {
      id v5 = objc_alloc((Class)PKPaymentProvisioningController);
      id v6 = +[PKPaymentWebService sharedService];
      id v7 = [v5 initWithWebService:v6];

      id v8 = [objc_alloc((Class)PKPeerPaymentCredential) initWithPeerPaymentAccount:self->_account];
      [v8 setAmount:self->_currencyAmount];
      [v8 setFlowState:self->_state];
      [v8 setPendingPaymentSenderAddress:self->_senderAddress];
      if (v8)
      {
        id v17 = v8;
        v9 = +[NSArray arrayWithObjects:&v17 count:1];
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_10000C9C0;
        v12[3] = &unk_100014B00;
        id v13 = v7;
        id v14 = self;
        id v15 = v4;
        [v13 associateCredentials:v9 withCompletionHandler:v12];

        id v10 = v13;
      }
      else
      {
        uint64_t v11 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Could not create peer payment credential.", buf, 2u);
        }

        id v10 = +[PKPaymentSetupNavigationController viewControllerForPresentingPaymentError:0];
        [v10 setModalInPresentation:1];
        (*((void (**)(id, id))v4 + 2))(v4, v10);
      }
    }
    else
    {
      id v7 = +[PKPaymentSetupNavigationController viewControllerForPresentingPaymentError:0];
      [v7 setModalInPresentation:1];
      (*((void (**)(id, id))v4 + 2))(v4, v7);
    }
  }
}

- (PKPeerPaymentAccount)account
{
  return self->_account;
}

- (PKCurrencyAmount)currencyAmount
{
  return self->_currencyAmount;
}

- (unint64_t)state
{
  return self->_state;
}

- (NSString)senderAddress
{
  return self->_senderAddress;
}

- (PKPaymentSetupDelegate)setupDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);

  return (PKPaymentSetupDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_setupDelegate);
  objc_storeStrong((id *)&self->_senderAddress, 0);
  objc_storeStrong((id *)&self->_currencyAmount, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end