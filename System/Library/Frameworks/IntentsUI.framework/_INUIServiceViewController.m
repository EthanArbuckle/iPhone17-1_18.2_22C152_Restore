@interface _INUIServiceViewController
+ (BOOL)_isSecureForRemoteViewService;
- (CGSize)_constrainedSizeForDesiredSize:(CGSize)a3;
- (_INUIServiceViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)addChildViewController:(id)a3;
- (void)beginRequestWithExtensionContext:(id)a3;
- (void)configureForParameters:(id)a3 ofInteraction:(id)a4 interactiveBehavior:(unint64_t)a5 context:(unint64_t)a6 completion:(id)a7;
- (void)desiresInteractivity:(id)a3;
- (void)queryRepresentedPropertiesWithCompletion:(id)a3;
- (void)viewWasCancelled;
- (void)viewWillLayoutSubviews;
@end

@implementation _INUIServiceViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentInteraction, 0);

  objc_storeStrong((id *)&self->_hostedViewController, 0);
}

- (CGSize)_constrainedSizeForDesiredSize:(CGSize)a3
{
  double v3 = *MEMORY[0x263F001B0];
  double v4 = *(double *)(MEMORY[0x263F001B0] + 8);
  if (a3.width != *MEMORY[0x263F001B0] || a3.height != v4)
  {
    double height = a3.height;
    double width = a3.width;
    v8 = [(_INUIServiceViewController *)self extensionContext];
    [v8 hostedViewMinimumAllowedSize];
    double v3 = v9;
    double v4 = v10;
    [v8 hostedViewMaximumAllowedSize];
    if (v11 >= width) {
      double v11 = width;
    }
    if (v3 < v11) {
      double v3 = v11;
    }
    if (v12 >= height) {
      double v13 = height;
    }
    else {
      double v13 = v12;
    }
    if (v4 < v13) {
      double v4 = v13;
    }
  }
  double v14 = v3;
  double v15 = v4;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (void)queryRepresentedPropertiesWithCompletion:(id)a3
{
  if (a3)
  {
    double v4 = (objc_class *)MEMORY[0x263EFF980];
    v5 = (void (**)(id, void *))a3;
    id v8 = objc_alloc_init(v4);
    if ([(INUIHostedViewControlling *)self->_hostedViewController conformsToProtocol:&unk_26BE778F8])
    {
      v6 = self->_hostedViewController;
      if ((objc_opt_respondsToSelector() & 1) != 0
        && [(INUIHostedViewControlling *)v6 displaysMessage])
      {
        [v8 addObject:@"SendMessageIntent.recipient"];
        [v8 addObject:@"SendMessageIntent.recipients"];
        [v8 addObject:@"SendMessageIntent.content"];
      }
      if ((objc_opt_respondsToSelector() & 1) != 0
        && [(INUIHostedViewControlling *)v6 displaysMap])
      {
        [v8 addObject:@"RequestRideIntent.pickupLocation.map"];
        [v8 addObject:@"GetRideStatusIntentResponse.rideStatus.vehicle.location.map"];
      }
      if ((objc_opt_respondsToSelector() & 1) != 0
        && [(INUIHostedViewControlling *)v6 displaysPaymentTransaction])
      {
        [v8 addObject:@"SendPaymentIntent.payee"];
        [v8 addObject:@"SendPaymentIntent.currencyAmount"];
        [v8 addObject:@"SendPaymentIntent.note"];
        [v8 addObject:@"RequestPaymentIntent.payer"];
        [v8 addObject:@"RequestPaymentIntent.currencyAmount"];
        [v8 addObject:@"RequestPaymentIntent.note"];
        [v8 addObject:@"BillDetails.billType"];
        [v8 addObject:@"BillDetails.amountDue"];
        [v8 addObject:@"BillDetails.paymentDate"];
        [v8 addObject:@"BillDetails.billPayee"];
        [v8 addObject:@"PayBillIntent.billPayee"];
        [v8 addObject:@"PayBillIntent.fromAccount"];
        [v8 addObject:@"PayBillIntent.transactionAmount"];
        [v8 addObject:@"PayBillIntent.transactionScheduledDate"];
        [v8 addObject:@"PayBillIntent.transactionNote"];
        [v8 addObject:@"PayBillIntent.billType"];
        [v8 addObject:@"PayBillIntent.dueDate"];
        [v8 addObject:@"PayBillIntentResponse.fromAccount"];
        [v8 addObject:@"PayBillIntentResponse.billDetails"];
        [v8 addObject:@"PayBillIntentResponse.transactionAmount"];
        [v8 addObject:@"PayBillIntentResponse.transactionScheduledDate"];
        [v8 addObject:@"PayBillIntentResponse.transactionNote"];
      }
    }
    v7 = (void *)[v8 copy];
    v5[2](v5, v7);
  }
}

- (void)desiresInteractivity:(id)a3
{
  double v4 = (void (**)(id, void))a3;
  if [(INUIHostedViewControlling *)self->_hostedViewController conformsToProtocol:&unk_26BE77898]&& (objc_opt_respondsToSelector())
  {
    [(INUIHostedViewControlling *)self->_hostedViewController desiresInteractivity:v4];
  }
  else
  {
    v4[2](v4, 0);
  }
}

- (void)viewWasCancelled
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if [(INUIHostedViewControlling *)self->_hostedViewController conformsToProtocol:&unk_26BE77898]&& (objc_opt_respondsToSelector())
  {
    double v3 = *MEMORY[0x263F0F810];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_INFO))
    {
      hostedViewController = self->_hostedViewController;
      int v5 = 136315394;
      v6 = "-[_INUIServiceViewController viewWasCancelled]";
      __int16 v7 = 2112;
      id v8 = hostedViewController;
      _os_log_impl(&dword_20A3EB000, v3, OS_LOG_TYPE_INFO, "%s Alerting remote view controller %@ of cancellation", (uint8_t *)&v5, 0x16u);
    }
    [(INUIHostedViewControlling *)self->_hostedViewController viewWasCancelled];
  }
}

- (void)configureForParameters:(id)a3 ofInteraction:(id)a4 interactiveBehavior:(unint64_t)a5 context:(unint64_t)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a7;
  double v13 = INTypedInteractionWithInteraction();
  objc_storeStrong((id *)&self->_currentInteraction, v13);
  self->_currentContext = a6;
  char v14 = objc_opt_respondsToSelector();
  hostedViewController = self->_hostedViewController;
  if (v14)
  {
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __106___INUIServiceViewController_configureForParameters_ofInteraction_interactiveBehavior_context_completion___block_invoke;
    v24[3] = &unk_263FD69E0;
    id v25 = v12;
    [(INUIHostedViewControlling *)hostedViewController configureViewForParameters:v11 ofInteraction:v13 interactiveBehavior:a5 context:a6 completion:v24];
    v16 = v25;
LABEL_8:

    goto LABEL_9;
  }
  if (objc_opt_respondsToSelector())
  {
    v17 = self->_hostedViewController;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __106___INUIServiceViewController_configureForParameters_ofInteraction_interactiveBehavior_context_completion___block_invoke_2;
    v22[3] = &unk_263FD69E0;
    id v23 = v12;
    [(INUIHostedViewControlling *)v17 configureViewForParameters:v11 ofInteraction:v13 context:a6 completion:v22];
    v16 = v23;
    goto LABEL_8;
  }
  if (![v11 count])
  {
    v18 = self->_hostedViewController;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __106___INUIServiceViewController_configureForParameters_ofInteraction_interactiveBehavior_context_completion___block_invoke_3;
    v19[3] = &unk_263FD6A30;
    id v21 = v12;
    v19[4] = self;
    id v20 = v13;
    [(INUIHostedViewControlling *)v18 configureWithInteraction:v20 context:a6 completion:v19];

    v16 = v21;
    goto LABEL_8;
  }
  (*((void (**)(id, void, void, void, double, double))v12 + 2))(v12, 0, 0, 0, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
LABEL_9:
}

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_INUIServiceViewController;
  [(_INUIServiceViewController *)&v8 beginRequestWithExtensionContext:v4];
  id v5 = v4;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;

  [v7 setViewController:self];
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)_INUIServiceViewController;
  [(_INUIServiceViewController *)&v5 viewWillLayoutSubviews];
  double v3 = [(INUIHostedViewControlling *)self->_hostedViewController view];
  id v4 = [(_INUIServiceViewController *)self view];
  [v4 bounds];
  objc_msgSend(v3, "setFrame:");
}

- (void)addChildViewController:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_INUIServiceViewController;
  [(_INUIServiceViewController *)&v11 addChildViewController:v5];
  if ([v5 conformsToProtocol:&unk_26BE75CC0])
  {
    p_hostedViewController = &self->_hostedViewController;
    objc_storeStrong((id *)&self->_hostedViewController, a3);
    id v7 = [(INUIHostedViewControlling *)self->_hostedViewController view];
    objc_super v8 = [(_INUIServiceViewController *)self view];
    [v8 bounds];
    objc_msgSend(v7, "setFrame:");

    uint64_t v9 = [(_INUIServiceViewController *)self view];
    double v10 = [(INUIHostedViewControlling *)*p_hostedViewController view];
    [v9 addSubview:v10];
  }
}

- (_INUIServiceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)_INUIServiceViewController;
  id v4 = [(_INUIServiceViewController *)&v11 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    id v5 = [MEMORY[0x263EF93E0] sharedInstance];
    uint64_t v6 = *MEMORY[0x263EF9048];
    id v10 = 0;
    [v5 setCategory:v6 withOptions:1 error:&v10];
    id v7 = v10;

    if (v7)
    {
      objc_super v8 = *MEMORY[0x263F0F810];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        double v13 = "-[_INUIServiceViewController initWithNibName:bundle:]";
        __int16 v14 = 2114;
        id v15 = v7;
        _os_log_error_impl(&dword_20A3EB000, v8, OS_LOG_TYPE_ERROR, "%s Unable to set AVAudioSession category: %{public}@", buf, 0x16u);
      }
    }
  }
  return v4;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

@end